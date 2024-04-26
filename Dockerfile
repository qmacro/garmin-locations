FROM debian:12

RUN apt-get update
RUN apt-get install -y curl jq gpsbabel cron vim

COPY process/crontab /etc/crontab
RUN crontab /etc/crontab

ADD process /process
WORKDIR /process
CMD ["bash", "-c", "./entrypoint; cron -f"]

