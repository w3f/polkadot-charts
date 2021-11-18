FROM parity/subkey:2.0.0 AS subkey

FROM parity/polkadot:v0.9.12 AS polkadot

FROM ubuntu:18.04

RUN apt-get update && \
  apt-get install --no-install-recommends -y \
  ca-certificates \
  curl \
  libssl1.0.0 \
  libssl-dev \
  jq

ENV KUBECTL_VERSION=v1.22.2

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
  chmod a+x kubectl && \
  mv kubectl /usr/local/bin

WORKDIR /app

COPY --from=polkadot /usr/bin/polkadot .
COPY --from=subkey /usr/local/bin/subkey /usr/local/bin/

RUN ./polkadot build-spec --chain dev > ./base_chainspec_dev.json && \
  cat ./base_chainspec_dev.json | jq "del(.chainType)" > ./base_chainspec.json && \
  rm ./polkadot

COPY scripts/ .
