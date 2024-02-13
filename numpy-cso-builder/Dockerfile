FROM ubuntu:22.04

RUN apt-get update && apt-get -y install gosu time git gridsite-clients python3 python3-venv python3-pip locales && apt-get clean

# Add CodeSonar from the latest CodeSonar release
COPY --from=codesecurese/codesonar-full-builder:8.1b0 /opt/codesonar/. /opt/codesonar
COPY --from=codesecurese/codesonar-full-builder:8.1b0 opt/codesonar-github/. /opt/codesonar-github
COPY --from=codesecurese/codesonar-full-builder:8.1b0 opt/codesonar-gitlab/. /opt/codesonar-gitlab
ENV PATH="/opt/codesonar/codesonar/bin:${PATH}"

# to fix perl issue
RUN export LC_ALL=en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN locale-gen en_US.UTF-8

RUN pip3 install pylint


RUN groupadd --gid 1000 user\
    && useradd --uid 1000 --gid 1000 -m user

USER user

