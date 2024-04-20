
FROM codesecurese/curl-builder:latest


ARG CODESONAR_VERSION=8.1p0



# Add CodeSonar from the latest CodeSonar release
COPY --from=codesecurese/codesonar-c-builder:8.1p0 /opt/codesonar/. /opt/codesonar
COPY --from=codesecurese/codesonar-c-builder:8.1p0 /opt/codesonar-github/. /opt/codesonar-github
COPY --from=codesecurese/codesonar-c-builder:8.1p0 /opt/codesonar-gitlab/. /opt/codesonar-gitlab

ENV PATH="/opt/codesonar/codesonar/bin:${PATH}"
RUN apt-get update && apt-get -y install gosu time gridsite-clients python3 python3-pip locales && apt-get clean
RUN pip3 install csv2md

# to fix perl issue
RUN export LC_ALL=en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN locale-gen en_US.UTF-8

RUN groupadd --gid 1000 user\
    && useradd --uid 1000 --gid 1000 -m user

USER user

