FROM ubuntu:22.04


RUN apt-get update && apt-get install -y nodejs npm && apt-get clean
RUN npm install eslint --global

COPY --from=codesecurese/codesonar-3-builder:8.1b0 /opt/codesonar/. /opt/codesonar
COPY --from=codesecurese/codesonar-3-builder:8.1b0 /opt/codesonar-github/. /opt/codesonar-github
COPY --from=codesecurese/codesonar-3-builder:8.1b0 /opt/codesonar-gitlab/. /opt/codesonar-gitlab
ENV PATH="/opt/codesonar/codesonar/bin:${PATH}"

RUN groupadd --gid 1000 user\
    && useradd --uid 1000 --gid 1000 -m user

USER user