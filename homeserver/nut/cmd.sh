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

# Use the curl command to send the message
curl -s -X POST $TELEGRAM_BOT_API$TELEGRAM_BOT_API_TOKEN$TELEGRAM_BOT_API_SEND_MESSAGE_METHOD -d chat_id=$TELEGRAM_BOT_CHAT_ID -d text="$TELEGRAM_BOT_TEXT_MESSAGE"

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

