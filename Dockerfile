FROM parity/subkey:2.0.0 AS subkey

FROM parity/polkadot:v0.8.23 AS polkadot

FROM ubuntu:18.04 as jq-builder

RUN apt-get update && \
  apt-get install --no-install-recommends -y \
  autoconf \
  automake \
  build-essential \
  ca-certificates \
  flex \
  git \
  libtool

WORKDIR tmp

RUN git clone https://github.com/stedolan/jq.git && \
  cd jq && \
  git submodule update --init && \
  autoreconf -fi  && \
  ./configure --with-oniguruma=builtin && \
  make -j8 && \
  make check && \
  ./configure --with-oniguruma=builtin --disable-maintainer-mode && \
  make LDFLAGS=-all-static && \
  make install && \
  which jq

FROM ubuntu:18.04

RUN apt-get update && \
  apt-get install --no-install-recommends -y \
  ca-certificates \
  curl \
  libssl1.0.0 \
  libssl-dev

ENV KUBECTL_VERSION=v1.18.1

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
  chmod a+x kubectl && \
  mv kubectl /usr/local/bin

WORKDIR /app

COPY --from=polkadot /usr/local/bin/polkadot .
COPY --from=subkey /usr/local/bin/subkey /usr/local/bin/
COPY --from=jq-builder /usr/local/bin/jq /usr/local/bin

RUN ./polkadot build-spec --chain dev > ./base_chainspec_dev.json && \
  cat ./base_chainspec_dev.json | jq "del(.chainType)" > ./base_chainspec.json && \
  rm ./polkadot

COPY scripts/ .
