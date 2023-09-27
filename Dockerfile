FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/hslatman/caddy-crowdsec-bouncer \
    --with github.com/caddyserver/caddy/v2=github.com/caddyserver/caddy/v2@${CADDY_VERSION}

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
