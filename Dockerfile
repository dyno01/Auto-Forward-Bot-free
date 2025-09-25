FROM python:3.8-slim-buster

# Use apt-get instead of apt (safer in scripts) 
# Install only what you need (git) and clean cache
RUN apt-get update && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for caching
COPY requirements.txt /requirements.txt

# Upgrade pip and install Python dependencies
RUN pip install --no-cache-dir -U pip \
    && pip install --no-cache-dir -r /requirements.txt

# Create working directory
WORKDIR /fwdbot

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Default command
CMD ["/bin/bash", "/start.sh"]
