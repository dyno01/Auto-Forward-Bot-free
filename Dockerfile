FROM python:3.8-slim-buster

# Set working directory
WORKDIR /fwdbot

# Copy bot code
COPY main.py /fwdbot/
COPY utils/ /fwdbot/utils/
COPY config.py /fwdbot/

# Copy start.sh
COPY start.sh /fwdbot/
RUN chmod +x /fwdbot/start.sh

# Copy requirements and install
COPY requirements.txt /fwdbot/
RUN pip install --no-cache-dir -U pip \
    && pip install --no-cache-dir -r requirements.txt

# Command to start bot
CMD ["/fwdbot/start.sh"]
