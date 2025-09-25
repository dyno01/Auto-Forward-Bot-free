#!/bin/bash
# start.sh

# Exit immediately if any command fails
set -e

# Optional: print commands as they run (useful for logs)
set -x

# Activate virtual environment if you use one (optional)
# source /venv/bin/activate

# Run your bot in the foreground
python3 main.py
