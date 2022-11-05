FROM debian:11-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y linux-perf curl gcc git neovim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN ~/.cargo/bin/cargo install flamegraph

ENV CARGO_PROFILE_RELEASE_DEBUG true
