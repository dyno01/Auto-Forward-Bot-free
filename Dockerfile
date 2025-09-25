# Set working directory
WORKDIR /fwdbot

# Copy bot code
COPY main.py /fwdbot/
# If you have other modules/folders:
COPY utils/ /fwdbot/utils/
COPY config.py /fwdbot/

# Copy start.sh
COPY start.sh /fwdbot/
RUN chmod +x /fwdbot/start.sh

# Install dependencies
COPY requirements.txt /fwdbot/
RUN pip install --no-cache-dir -U pip \
    && pip install --no-cache-dir -r requirements.txt

# Command to start bot
CMD ["/fwdbot/start.sh"]
