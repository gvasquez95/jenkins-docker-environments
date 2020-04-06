#Base layer from official rust image
FROM rust:latest

#Install sccache for later faster build times using cache for previously built crates
RUN cargo install sccache

# add linter components
RUN rustup update && rustup component add rustfmt && rustup component add clippy

# install dependencies for tarpaulin build
RUN apt-get update -y && apt-get install -y apt-utils && apt-get install -y cmake openssl pkg-config libssl-dev zlib1g-dev

#build tarpaulin for code coverage
RUN cargo install cargo-tarpaulin