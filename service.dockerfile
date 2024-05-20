FROM alpine:latest

COPY --chmod=555 service-entrypoint.sh /entrypoint.sh
COPY service.torrc torrc

RUN apk --no-cache add tor netcat-openbsd

USER tor

ENTRYPOINT ["/entrypoint.sh"]
