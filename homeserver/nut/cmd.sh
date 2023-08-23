#!/bin/sh

# Set the API token and chat ID
TELEGRAM_BOT_API="https://api.telegram.org/bot"
TELEGRAM_BOT_API_TOKEN="_TOKEN_"
TELEGRAM_BOT_API_SEND_MESSAGE_METHOD="/sendMessage"

ARG_COUNT=$#
TELEGRAM_BOT_CHAT_ID="_ID_"
TELEGRAM_BOT_TEXT_MESSAGE="This is a test message"

if [ $ARG_COUNT -ge 1 ]
then
        TELEGRAM_BOT_TEXT_MESSAGE=$1
        echo $TELEGRAM_BOT_TEXT_MESSAGE

fi

case $1 in
      commbad)
      TELEGRAM_BOT_TEXT_MESSAGE="UPS communications failure"
      ;;
      commok)
      TELEGRAM_BOT_TEXT_MESSAGE="UPS communications restored"
      ;;
      nocomm)
      TELEGRAM_BOT_TEXT_MESSAGE="UPS communications cannot be established"
      ;;
      shutdowncritical)
      TELEGRAM_BOT_TEXT_MESSAGE="UPS battery level CRITICAL. Shutting down NOW!!!!"
      ;;
      powerup)
      TELEGRAM_BOT_TEXT_MESSAGE="UPS on line. Shutdown aborted."
      ;;
      *)
      TELEGRAM_BOT_TEXT_MESSAGE="Unrecognized command: $1"
      ;;
esac

echo $TELEGRAM_BOT_TEXT_MESSAGE
logger $TELEGRAM_BOT_TEXT_MESSAGE
# Use the curl command to send the message
curl -s -X POST $TELEGRAM_BOT_API$TELEGRAM_BOT_API_TOKEN$TELEGRAM_BOT_API_SEND_MESSAGE_METHOD -d chat_id=$TELEGRAM_BOT_CHAT_ID -d text="$TELEGRAM_BOT_TEXT_MESSAGE"

