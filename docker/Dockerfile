FROM alpine

# add necessary packages
RUN apk add --no-cache \
  # for building
  build-base \
  # used in various rust dependencies
  cmake \
  # finding dependencies
  pkgconf \
  # lots of things need ssl
  openssl-dev \
  # necessary for rustup and other downloads
  curl \
  # paste uses postgresql
  libpq \
  # paste uses libsodium
  libsodium-dev
