FROM codesecurese/curl-builder:latest

RUN apt-get update && apt-get -y install gosu time gridsite-clients python3 locales && apt-get clean

# Add CodeSonar from the latest CodeSonar release
COPY --from=codesecurese/codesonar-c-builder:8.0p0 /opt/codesonar/. /opt/codesonar
COPY --from=codesecurese/codesonar-c-builder:8.0p0 /opt/codesonar-github/. /opt/codesonar-github
COPY --from=codesecurese/codesonar-c-builder:8.0p0 /opt/codesonar-gitlab/. /opt/codesonar-gitlab
ENV PATH="/opt/codesonar/codesonar/bin:${PATH}"

# to fix perl issue
RUN export LC_ALL=en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN locale-gen en_US.UTF-8

RUN groupadd --gid 1000 user\
    && useradd --uid 1000 --gid 1000 -m user

USER user

