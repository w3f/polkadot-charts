FROM parity/subkey:2.0.0 AS subkey

FROM web3f/polkadot:kusama-v0.6.5 AS polkadot


FROM ubuntu:18.04

RUN apt update && \
  apt install --no-install-recommends -y \
  ca-certificates \
  curl \
  jq \
  libssl1.0.0 \
  libssl-dev

ENV KUBECTL_VERSION=v1.13.7

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
  chmod a+x kubectl && \
  mv kubectl /usr/local/bin

WORKDIR /app

COPY --from=polkadot /usr/local/bin/polkadot .
COPY --from=subkey /usr/local/bin/subkey /usr/local/bin/

RUN ./polkadot build-spec --chain local > ./base_chainspec.json && \
  rm ./polkadot

COPY scripts/ .
COPY chainspecs/ .
