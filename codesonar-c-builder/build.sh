docker build . --tag codesecurese/codesonar-c-builder:$2  --build-arg CODESONAR_PACKAGE=$1 --build-arg TELEMETRY=1 --build-arg HUB=0 --build-arg JAVA_ANALYSIS=0 --build-arg PYTHON_ANALYSIS=0 --build-arg JAVA_API=0 --build-arg CSHARP_API=0 --build-arg PYTHON_API=1 --build-arg ECLIPSE=0 --build-arg CMDLINE_UTILITIES=0 --build-arg CONFIG_TOOL=0 --build-arg GENERATE_CERT=0 
docker push codesecurese/codesonar-c-builder:$2

docker tag codesecurese/codesonar-c-builder:$2 ghcr.io/codesecure-se/codesonar-c-builder:$2

docker push ghcr.io/codesecure-se/codesonar-c-builder:$2

