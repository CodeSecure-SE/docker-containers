#!/bin/bash

docker build --no-cache -t codesecurese/node-cso-builder:$2 .
docker push codesecurese/node-cso-builder:$2

docker tag codesecurese/node-cso-builder:$2 ghcr.io/codesecure-se/node-cso-builder:$2
docker push ghcr.io/codesecure-se/node-cso-builder:$2
