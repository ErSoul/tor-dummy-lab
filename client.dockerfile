FROM alpine:latest

RUN apk --no-cache add tor netcat-openbsd

USER tor
EXPOSE 9050

# echo 'Run netcat: nc -x 127.0.0.1:9050 $ONION_URL $ONION_PORT'
ENTRYPOINT tor
