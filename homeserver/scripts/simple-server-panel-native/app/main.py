import os
import subprocess
import time
from datetime import datetime
from pathlib import Path
from urllib.parse import quote

import psutil
from fastapi import FastAPI, Form, Request
from fastapi.responses import HTMLResponse, RedirectResponse
from fastapi.templating import Jinja2Templates


BASE_DIR = Path(__file__).resolve().parent.parent

APP_TITLE = os.getenv("APP_TITLE", "Home Server Panel")
ACTION_SCRIPT = os.getenv("ACTION_SCRIPT", str(BASE_DIR / "scripts" / "media_control.sh"))
HOST_TIMEZONE = os.getenv("TZ", "Europe/Novosibirsk")

app = FastAPI(title=APP_TITLE)
templates = Jinja2Templates(directory=str(BASE_DIR / "app" / "templates"))


def bytes_to_gb(value: int) -> str:
    return f"{value / 1024 ** 3:.1f} GB"


def get_uptime() -> str:
    seconds = int(time.time() - psutil.boot_time())

    days, seconds = divmod(seconds, 86400)
    hours, seconds = divmod(seconds, 3600)
    minutes, _ = divmod(seconds, 60)

    parts = []

    if days:
        parts.append(f"{days}d")

    if hours:
        parts.append(f"{hours}h")

    parts.append(f"{minutes}m")

    return " ".join(parts)


def get_service_status(service_name: str) -> str:
    try:
        result = subprocess.run(
            ["systemctl", "is-active", service_name],
            capture_output=True,
            text=True,
            timeout=5,
            check=False,
        )
    except Exception as exc:
        return f"unknown: {exc}"

    return result.stdout.strip() or "unknown"


def get_server_info() -> dict:
    memory = psutil.virtual_memory()
    load_avg = os.getloadavg()

    return {
        "now": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        "timezone": HOST_TIMEZONE,
        "hostname": os.uname().nodename,
        "uptime": get_uptime(),
        "cpu_percent": psutil.cpu_percent(interval=0.2),
        "load_avg": f"{load_avg[0]:.2f}, {load_avg[1]:.2f}, {load_avg[2]:.2f}",
        "memory_total": bytes_to_gb(memory.total),
        "memory_used": bytes_to_gb(memory.used),
        "memory_percent": memory.percent,
        "minidlna_status": get_service_status("minidlna.service"),
    }


def get_disks() -> list[dict]:
    disks = []

    for partition in psutil.disk_partitions(all=False):
        try:
            usage = psutil.disk_usage(partition.mountpoint)
        except (PermissionError, FileNotFoundError):
            continue

        disks.append(
            {
                "device": partition.device,
                "mountpoint": partition.mountpoint,
                "fstype": partition.fstype,
                "total": bytes_to_gb(usage.total),
                "used": bytes_to_gb(usage.used),
                "free": bytes_to_gb(usage.free),
                "percent": usage.percent,
            }
        )

    return disks


def run_action(mode: str) -> tuple[bool, str]:
    if mode not in {"Start", "Stop"}:
        return False, "Invalid mode"

    script = Path(ACTION_SCRIPT)

    if not script.exists():
        return False, f"Script not found: {ACTION_SCRIPT}"

    try:
        result = subprocess.run(
            [str(script), mode],
            check=False,
            capture_output=True,
            text=True,
            timeout=120,
        )
    except subprocess.TimeoutExpired:
        return False, "Script timeout"

    output = (result.stdout or "") + (result.stderr or "")
    output = output.strip() or "No output"

    return result.returncode == 0, output


@app.get("/", response_class=HTMLResponse)
async def index(
    request: Request,
    message: str | None = None,
    status: str | None = None,
):
    return templates.TemplateResponse(
        "index.html",
        {
            "request": request,
            "title": APP_TITLE,
            "info": get_server_info(),
            "disks": get_disks(),
            "message": message,
            "status": status,
        },
    )


@app.post("/action")
async def action(mode: str = Form(...)):
    ok, output = run_action(mode)

    return RedirectResponse(
        url=f"/?status={'ok' if ok else 'error'}&message={quote(output)}",
        status_code=303,
    )
