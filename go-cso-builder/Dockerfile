FROM ubuntu:22.04

RUN apt-get update && apt-get -y install curl git python3 locales build-essential wget && apt-get clean

RUN wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
RUN tar xvzf go1.22.0.linux-amd64.tar.gz
RUN rm go1.22.0.linux-amd64.tar.gz
RUN mv go /usr/local
ENV GOPATH="/usr/local/go"
RUN /usr/local/go/bin/go install honnef.co/go/tools/cmd/staticcheck@2023.1.6

# Add CodeSonar from the latest CodeSonar release
COPY --from=codesecurese/codesonar-3-builder:8.1b1 /opt/codesonar/. /opt/codesonar
COPY --from=codesecurese/codesonar-3-builder:8.1b1 opt/codesonar-github/. /opt/codesonar-github
COPY --from=codesecurese/codesonar-3-builder:8.1b1 opt/codesonar-gitlab/. /opt/codesonar-gitlab
ENV PATH="/opt/codesonar/codesonar/bin:/usr/local/go/bin:${PATH}"

# to fix perl issue
RUN export LC_ALL=en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN locale-gen en_US.UTF-8


RUN groupadd --gid 1000 user\
    && useradd --uid 1000 --gid 1000 -m user
RUN mkdir /home/user/go ; chown user /home/user/go
ENV GOPATH="/home/user/go"
USER user


