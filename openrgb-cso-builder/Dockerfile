FROM canuckmh/openrgb-builder:latest

RUN apt-get update && apt-get -y install gosu time gridsite-clients python3 && apt clean

# Add CodeSonar from the latest CodeSonar release
COPY --from=codesecurese/codesonar-c-builder:8.0p0 /opt/codesonar/. /opt/codesonar
COPY --from=codesecurese/codesonar-c-builder:8.0p0 /opt/codesonar-github/. /opt/codesonar-github
COPY --from=codesecurese/codesonar-c-builder:8.0p0 /opt/codesonar-gitlab/. /opt/codesonar-gitlab
ENV PATH="/opt/codesonar/codesonar/bin:${PATH}"

# This is to adjust the user in the container to a local user

RUN groupadd --gid 1000 user\
    && useradd --uid 1000 --gid 1000 -m user

USER user

