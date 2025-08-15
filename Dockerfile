ARG CADDY_VERSION=latest
ARG CADDY_VERSION_NO_V=latest
FROM caddy:builder AS builder

RUN xcaddy build ${CADDY_VERSION} \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-security

FROM caddy:${CADDY_VERSION_NO_V}
COPY --from=builder /usr/bin/caddy /usr/bin/caddy