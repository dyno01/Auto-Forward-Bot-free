FROM python:3.11-slim

WORKDIR /fwdbot

RUN apt-get update && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

COPY . /fwdbot/

RUN pip install --no-cache-dir -U pip \
    && pip install --no-cache-dir -r requirements.txt

RUN chmod +x /fwdbot/start.sh

CMD ["/fwdbot/start.sh"]
