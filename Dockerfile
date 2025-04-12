# Set the version of Caddy to build with/on
ARG CADDY_VERSION=2.9.1

# Select the Caddy Builder image for xcaddy operations
FROM caddy:${CADDY_VERSION}-builder AS builder

# Install modules using xcaddy using the builder image
RUN xcaddy build \
    --with github.com/mholt/caddy-l4

# Select the official Caddy Docker image
FROM caddy:${CADDY_VERSION}

# Copy files to the new Caddy Docker image from the builder
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
