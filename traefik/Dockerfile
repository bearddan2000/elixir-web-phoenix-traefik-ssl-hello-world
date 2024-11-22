FROM alpine:edge AS base

WORKDIR /cert

RUN apk upgrade --update-cache --available && \
    apk add openssl && \
    rm -rf /var/cache/apk/*

RUN openssl req -new -text -passout pass:abcd -subj /CN=localhost -out server.req -keyout privkey.pem

RUN openssl rsa -in privkey.pem -passin pass:abcd -out server.key

RUN openssl req -x509 -in server.req -text -key server.key -out server.crt

RUN chmod -R +x * && ls

FROM traefik:v2.4

WORKDIR /workspace

COPY . /etc/traefik

COPY --from=base /cert /etc/certs:ro