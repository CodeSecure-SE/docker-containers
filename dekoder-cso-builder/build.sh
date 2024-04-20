docker build -t codesecurese/detekt-cso-builder:$2 .
docker push codesecurese/detekt-cso-builder:$2

docker tag codesecurese/detekt-cso-builder:$2 ghcr.io/codesecure-se/detekt-cso-builder:$2
docker push ghcr.io/codesecure-se/detekt-cso-builder:$2
