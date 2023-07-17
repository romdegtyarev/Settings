#!/bin/sh

case $1 in
      commbad)
      logger  "UPS communications failure"
      ;;
      commok)
      logger  "UPS communications restored"
      ;;
      nocomm)
      logger  "UPS communications cannot be established"
      ;;
      shutdowncritical)
      logger "UPS battery level CRITICAL. Shutting down NOW!!!!"
      ;;
      powerup)
      logger "UPS on line. Shutdown aborted."
      ;;
      *)
      logger "Unrecognized command: $1"
      ;;
esac

