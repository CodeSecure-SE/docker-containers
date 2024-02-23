docker build . --tag codesecurese/codesonar-full-builder:8.1b0 --build-arg CODESONAR_PACKAGE=codesonar-8.1p0.20240212-x86_64-pc-linux.tar.gz --build-arg TELEMETRY=1 --build-arg HUB=0 --build-arg JAVA_ANALYSIS=1 --build-arg PYTHON_ANALYSIS=1 --build-arg JAVA_API=1 --build-arg CSHARP_API=1 --build-arg PYTHON_API=1 --build-arg ECLIPSE=0 --build-arg CMDLINE_UTILITIES=1 --build-arg CONFIG_TOOL=0 --build-arg GENERATE_CERT=1 
docker push codesecurese/codesonar-full-builder:8.1b0


#docker build . --tag ghcr.io/odesecure-se/codesonar-full-builder:8.1b0 --build-arg CODESONAR_PACKAGE=codesonar-8.1p0.20240212-x86_64-pc-linux.tar.gz --build-arg TELEMETRY=1 --build-arg HUB=0 --build-arg JAVA_ANALYSIS=1 --build-arg PYTHON_ANALYSIS=1 --build-arg JAVA_API=1 --build-arg CSHARP_API=1 --build-arg PYTHON_API=1 --build-arg ECLIPSE=0 --build-arg CMDLINE_UTILITIES=1 --build-arg CONFIG_TOOL=0 --build-arg GENERATE_CERT=1 
#docker push ghcr.io/codesecure-se/codesonar-full-builder:8.1b0
