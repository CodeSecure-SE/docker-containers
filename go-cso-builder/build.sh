#docker build -t codesecurese/rust-cso-builder:8.1b0 .
#docker push codesecurese/rust-cso-builder:8.1b0

# GHCR builders
docker build -t ghcr.io/codesecure-se/go-cso-builder:8.1b0 .
docker push ghcr.io/codesecure-se/go-cso-builder:8.1b0
