FROM ubuntu:22.04
RUN apt-get update ; apt-get install -y --no-install-recommends tzdata curl wget ca-certificates fontconfig locales p11-kit binutils  \
RUN apt-get update ; apt-get install -y time gosu gridsite-clients python3 git  maven openjdk-11-jdk && apt-get clean

COPY --from=codesecure-se/codesonar-j-builder:8.0p0 /opt/codesonar/. /opt/codesonar
COPY --from=codesecure-se/codesonar-j-builder:8.0p0 /opt/codesonar-github/. /opt/codesonar-github
COPY --from=codesecure-se/codesonar-j-builder:8.0p0 /opt/codesonar-gitlab/. /opt/codesonar-gitlab
ENV PATH="/opt/codesonar/codesonar/bin:${PATH}"

RUN groupadd --gid 1000 user\
    && useradd --uid 1000 --gid 1000 -m user

USER user
