ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:10.0.0
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Install system dependencies.
RUN apk update && \
    apk add --no-cache \
       g++=10.3.1_git20210424-r2 \
       musl-dev=1.2.2-r3 \
       libffi-dev=3.3-r2 \
       python3-dev=3.9.5-r1 \
       py3-pip=20.3.4-r1

# Install Python dependencies.
COPY requirements.txt /
RUN pip3 install --no-cache-dir -r /requirements.txt && \
  rm /requirements.txt && \
  apk del \
    g++ \
    musl-dev \
    libffi-dev

# Copy root filesystem.
COPY rootfs /

# Define entrypoint.
RUN chmod a+x /run.sh
CMD ["/run.sh"]

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Rohan Liston <rohan.liston@users.noreply.github.com>" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="A2I2" \
    org.opencontainers.image.authors="Rohan Liston <rohan.liston@users.noreply.github.com>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://addons.community" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
