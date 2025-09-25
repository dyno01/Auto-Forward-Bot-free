#!/bin/bash
# start.sh

# Exit immediately if a command fails
set -e

# Optional: print commands in logs
set -x

# Run the bot in the foreground
python3 /fwdbot/main.py
