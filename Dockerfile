ARG NGINX_VERSION=alpine

FROM nginx:1.25.3-alpine AS base
RUN export DEBIAN_FRONTEND=noninteractive &&\
    if command -v apk >/dev/null 2>/dev/null; then apk add --no-cache gnupg; else  apt-get update && apt-get install -y gnupg wget ca-certificates && apt-get clean; fi
COPY rootfs/ /
RUN chmod +x /usr/local/bin/*
