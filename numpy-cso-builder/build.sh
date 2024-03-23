#!/bin/sh
docker build -t codesecurese/numpy-cso-builder:$2 .
docker push codesecurese/numpy-cso-builder:$2

docker tag codesecurese/numpy-cso-builder:$2 ghcr.io/codesecure-se/numpy-cso-builder:$2
docker push ghcr.io/codesecure-se/numpy-cso-builder:$2
