FROM codesecurese/curl-builder:latest

RUN apt-get update && apt-get -y install curl gosu time gridsite-clients python3 locales build-essential && apt-get clean

# Add CodeSonar from the latest CodeSonar release
COPY --from=codesecurese/codesonar-3-builder:8.1b0 /opt/codesonar/. /opt/codesonar
COPY --from=codesecurese/codesonar-3-builder:8.1b0 opt/codesonar-github/. /opt/codesonar-github
COPY --from=codesecurese/codesonar-3-builder:8.1b0 opt/codesonar-gitlab/. /opt/codesonar-gitlab
ENV PATH="/opt/codesonar/codesonar/bin:${PATH}"

# to fix perl issue
RUN export LC_ALL=en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN locale-gen en_US.UTF-8


RUN groupadd --gid 1000 user\
    && useradd --uid 1000 --gid 1000 -m user

USER user

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > /tmp/install.sh && chmod +x /tmp/install.sh && /tmp/install.sh -y && rm /tmp/install.sh
RUN /home/user/.cargo/bin/cargo install clippy-sarif

