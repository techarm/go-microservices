# build a tiny docker image
FROM alpine:latest

RUN mkdir /app

COPY templates /templates
COPY mailerApp /app

CMD ["/app/mailerApp"]