FROM ubuntu:22.04

RUN apt update && apt -y install gosu time git gridsite-clients curl zip unzip default-jdk locales && apt clean

# Add CodeSonar from the latest CodeSonar release
COPY --from=codesecurese/codesonar-3-builder:8.1p0 /opt/codesonar/. /opt/codesonar
COPY --from=codesecurese/codesonar-3-builder:8.1p0 opt/codesonar-github/. /opt/codesonar-github
COPY --from=codesecurese/codesonar-3-builder:8.1p0 opt/codesonar-gitlab/. /opt/codesonar-gitlab
ENV PATH="/opt/codesonar/codesonar/bin:${PATH}"

# to fix perl issue
RUN export LC_ALL=en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN locale-gen en_US.UTF-8

# To install kotlin
RUN curl -s "https://get.sdkman.io" | /bin/bash

# this SHELL command is needed to allow using source
SHELL ["/bin/bash", "-c"]  
RUN source "$HOME/.sdkman/bin/sdkman-init.sh" $$ sdk install kotlin

RUN groupadd --gid 1000 user\
    && useradd --uid 1000 --gid 1000 -m user

USER user

