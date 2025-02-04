FROM ubuntu:latest

WORKDIR /bash-treasure-hunt

RUN apt-get update && \
  apt-get --no-install-recommends install -yq \
    openssl \
    shellcheck
