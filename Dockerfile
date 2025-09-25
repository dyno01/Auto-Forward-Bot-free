FROM python:3.8-slim-buster

WORKDIR /fwdbot

RUN apt-get update && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

# Copy everything at once
COPY . /fwdbot/

RUN pip install --no-cache-dir -U pip \
    && pip install --no-cache-dir -r requirements.txt

RUN chmod +x /fwdbot/start.sh

CMD ["/fwdbot/start.sh"]
