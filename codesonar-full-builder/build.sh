docker build . --tag codesecurese/codesonar-full-builder:$2  --build-arg CODESONAR_PACKAGE=$1 --build-arg TELEMETRY=1 --build-arg HUB=0 --build-arg JAVA_ANALYSIS=1 --build-arg PYTHON_ANALYSIS=1 --build-arg JAVA_API=1 --build-arg CSHARP_API=1 --build-arg PYTHON_API=1 --build-arg ECLIPSE=0 --build-arg CMDLINE_UTILITIES=1 --build-arg CONFIG_TOOL=0 --build-arg GENERATE_CERT=1 
docker push codesecurese/codesonar-full-builder:$2

docker tag codesecurese/codesonar-full-builder:$2 ghcr.io/codesecure-se/codesonar-full-builder:$2

docker push ghcr.io/codesecure-se/codesonar-full-builder:$2

