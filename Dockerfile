FROM alpine:3.15.4

USER root

RUN apk add \
    bash \
    git \
    openssh \
    git-subtree

WORKDIR /app
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/bin/sh", "/app/entrypoint.sh"]