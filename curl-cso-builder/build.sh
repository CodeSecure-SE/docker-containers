#!/bin/bash
docker build -t codesecurese/curl-cso-builder:$2 --build-arg CODESONAR_VERSION="$2" .
docker push codesecurese/curl-cso-builder:$2

docker tag codesecurese/curl-cso-builder:$2 ghcr.io/codesecure-se/curl-cso-builder:$2

docker push ghcr.io/codesecure-se/curl-cso-builder:$2
