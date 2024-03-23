docker build -t codesecurese/dekoder-cso-builder:$2 .
docker push codesecurese/dekoder-cso-builder:$2

docker tag codesecurese/dekoder-cso-builder:$2 ghcr.io/codesecure-se/dekoder-cso-builder:$2
docker push ghcr.io/codesecure-se/dekoder-cso-builder:$2
