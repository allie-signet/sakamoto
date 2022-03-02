FROM rust:1.58-slim-buster as builder

WORKDIR /usr/src/sakamoto
COPY . .
RUN cargo build --release

FROM debian:buster-slim
RUN apt-get update && apt-get install -y curl 
COPY --from=builder /usr/src/sakamoto/target/release/sakamoto .

CMD ["./sakamoto"]