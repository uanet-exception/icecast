FROM docker.io/library/alpine:3.19

RUN addgroup -S icecast && \
    adduser -S icecast

RUN apk add --no-cache icecast~=2.4.4 mailcap

COPY ./docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN mkdir -p /var/log/icecast
RUN chown icecast:icecast /var/log/icecast

EXPOSE 8000
VOLUME ["/var/log/icecast"]
ENTRYPOINT ["/entrypoint.sh"]
CMD icecast -c /etc/icecast.xml
