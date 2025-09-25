# Use Python 3.8 slim (you can upgrade to 3.11 if you want)
FROM python:3.8-slim-buster

# Set working directory inside the container
WORKDIR /fwdbot

# Install system dependencies (git, etc.)
RUN apt-get update && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt /fwdbot/
RUN pip install --no-cache-dir -U pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy your bot files
COPY main.py /fwdbot/
COPY config.py /fwdbot/

# Optional: only copy utils folder if it exists
COPY ./utils /fwdbot/utils 2>/dev/null || echo "No utils folder, skipping"

# Copy start script and make it executable
COPY start.sh /fwdbot/
RUN chmod +x /fwdbot/start.sh

# Command to start the bot
CMD ["/fwdbot/start.sh"]
