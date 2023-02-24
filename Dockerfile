ARG DISTRO=alpine
ARG DISTRO_VARIANT=3.17

FROM docker.io/tiredofit/${DISTRO}:${DISTRO_VARIANT}
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ARG ETURNAL_VERSION

ENV ETURNAL_VERSION=1.10.1 \
    ETURNAL_REPO_URL=https://github.com/processone/eturnal \
    IMAGE_NAME="tiredofit/eturnal" \
    IMAGE_REPO_URL="https://github.com/tiredofit/eturnal/"

RUN source assets/functions/00-container && \
    set -x && \
    addgroup -S -g 3478 eturnal && \
    adduser -D -S -s /sbin/nologin \
            -h /usr/lib/eturnal/run \
            -G eturnal \
            -g "eturnal" \
            -u 3478 eturnal \
            && \
    \
    package update && \
    package upgrade && \
    package install .eturnal-build-deps \
                    build-base \
                    erlang-dev \
                    git \
                    libcap-utils \
                    openssl-dev \
                    yaml-dev \
                    && \
    \
    package install .eturnal-run-deps \
                    libcap2 \
                    libssl3 \
                    libstdc++ \
                    ncurses-libs \
                    openssl \
                    yaml \
                    zlib \
                    && \
    \
    curl -sSL https://s3.amazonaws.com/rebar3/rebar3 -o /usr/sbin/rebar3 && \
    chmod +x /usr/sbin/rebar3 && \
    clone_git_repo "${ETURNAL_REPO_URL}" "${ETURNAL_VERSION}" && \
    echo "-setcookie eturnal" >> config/vm.args && \
    mkdir -p /assets/eturnal/ && \
    cp -R config/eturnal.yml /assets/eturnal/config-default.yml && \
    rebar3 as prod tar && \
    mkdir /usr/lib/eturnal && \
    tar xvfz _build/prod/rel/eturnal/eturnal-*.tar.gz -C /usr/lib/eturnal && \
    sed -i "s|/opt/eturnal/|/usr/lib/eturnal/|g" /usr/lib/eturnal/bin/stun && \
    ln -sf /usr/lib/eturnal/bin/eturnal /usr/sbin/eturnal && \
    ln -sf /usr/lib/eturnal/bin/eturnalctl /usr/sbin/eturnalctl && \
    ln -sf /usr/lib/eturnal/bin/stun /usr/sbin/stun && \
    rm -rf /usr/lib/eturnal/etc/* && \
    mkdir -p /usr/lib/eturnal/run && \
    chown -R eturnal:eturnal /usr/lib/eturnal/run && \
    package remove .eturnal-build-deps && \
    package cleanup && \
    \
    rm -rf \
            /root/.cache \
            /root/.gitconfig \
            /usr/sbin/rebar3 \
            /usr/src/*

EXPOSE 3478 3478/udp

COPY install /

