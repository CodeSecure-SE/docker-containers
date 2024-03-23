FROM ubuntu:22.04

# Ubuntu 22.04 has node 12 and we need >14
RUN apt-get update && apt-get install -y curl && apt-get clean
RUN curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get update && apt-get install -y git nodejs && apt-get clean


COPY --from=codesecurese/codesonar-3-builder:8.1b1 /opt/codesonar/. /opt/codesonar
COPY --from=codesecurese/codesonar-3-builder:8.1b1 /opt/codesonar-github/. /opt/codesonar-github
COPY --from=codesecurese/codesonar-3-builder:8.1b1 /opt/codesonar-gitlab/. /opt/codesonar-gitlab
ENV PATH="/opt/codesonar/codesonar/bin:${PATH}"

RUN groupadd --gid 1000 user\
    && useradd --uid 1000 --gid 1000 -m user

USER user
