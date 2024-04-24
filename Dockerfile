FROM alpine:3.19

RUN apk add bash curl jq --no-cache
COPY process/crontab /etc/crontab
RUN crontab /etc/crontab

ADD process /process
WORKDIR /process
CMD ["bash", "-c", "./entrypoint; crond -f"]

