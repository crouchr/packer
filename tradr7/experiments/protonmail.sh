#!/bin/bash
# RCH : modified to run as vagrant - simpler than running as a dedicated user such as protonmail

case "$1" in
  start)
    # will create an screen in detached mode (background) with name "vagrant/protonmail"
    screen -S vagrant -dm protonmail-bridge --cli
    echo "Service started."
    ;;
  status)
    # ignore this block unless you understand how screen works and that only lists the current user's screens
    result=$(screen -list | grep vagrant)
    if [ $? == 0 ]; then
      echo "Protonmail bridge service is ON."
    else
      echo "Protonmail bridge service is OFF."
    fi
    ;;
  stop)
    # Will quit a screen called "vagrant/protonmail" and therefore terminate the running protonmail-bridge process
    screen -S vagrant -X quit
    echo "Service stopped."
    ;;
  *)
    echo "Unknown command: $1"
    exit 1
  ;;
esac
