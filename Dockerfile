FROM parity/substrate:2.0.0-79dd9c830 AS substrate


FROM ubuntu:18.04

RUN apt update && \
  apt install --no-install-recommends -y \
  jq \
  libssl1.0.0 \
  libssl-dev

WORKDIR /app

COPY --from=substrate /usr/local/bin/substrate .

RUN ./substrate build-spec --chain local > ./base_chainspec.json && \
  rm ./substrate

COPY scripts/ .
