#!/bin/bash

docker build -t codesecurese/rust-cso-builder:$2 .
docker push codesecurese/rust-cso-builder:$2

docker tag codesecurese/rust-cso-builder:$2 ghcr.io/codesecure-se/rust-cso-builder:$2
docker push ghcr.io/codesecure-se/rust-cso-builder:$2
