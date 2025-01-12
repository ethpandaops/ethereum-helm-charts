FROM golang:1.22 AS builder
RUN git clone https://github.com/ethereum/go-ethereum.git /go-ethereum
WORKDIR /go-ethereum

# Build only the bootnode binary
RUN make all

# Use a minimal Alpine image for runtime
FROM alpine:latest

# Copy the bootnode binary from the build stage
COPY --from=builder /go-ethereum/build/bin/geth /usr/local/bin/bootnode

# Add necessary tools for debugging
RUN apk add --no-cache net-tools iproute2

