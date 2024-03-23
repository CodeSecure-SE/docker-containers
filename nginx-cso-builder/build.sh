docker build -t codesecurese/nginx-cso-builder:$2 .
docker push codesecurese/nginx-cso-builder:$2

docker tag codesecurese/nginx-cso-builder:$2 ghcr.io/codesecure-se/nginx-cso-builder:$2
docker push ghcr.io/codesecure-se/nginx-cso-builder:$2
