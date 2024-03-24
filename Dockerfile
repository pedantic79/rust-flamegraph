FROM debian:12-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y linux-perf curl gcc git neovim pkg-config libssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN ~/.cargo/bin/cargo install flamegraph
RUN ~/.cargo/bin/cargo install --git https://github.com/pedantic79/cargo-aoc.git --branch new-criterion

ENV CARGO_PROFILE_RELEASE_DEBUG true
