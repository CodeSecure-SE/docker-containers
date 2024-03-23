docker build -t ghcr.io/codesecure-se/mvn-csoj-builder:$2 .
docker push ghcr.io/codesecure-se/mvn-csoj-builder:$2

docker tag ghcr.io/codesecure-se/mvn-csoj-builder:$2 codesecurese/mvn-csoj-builder:$2
docker push codesecurese/mvn-csoj-builder:$2
