FROM ubuntu:22.04
RUN apt-get update ; apt-get install -y --no-install-recommends tzdata curl wget ca-certificates fontconfig locales p11-kit binutils  \
RUN apt-get update ; apt-get install -y time gosu gridsite-clients python3  maven

COPY --from=canuckmh/codesonar-j-builder:7.4p0 /opt/codesonar/. /opt/codesonar
COPY --from=canuckmh/codesonar-j-builder:7.4p0 /opt/codesonar-github/. /opt/codesonar-github
COPY --from=canuckmh/codesonar-j-builder:7.4p0 /opt/codesonar-gitlab/. /opt/codesonar-gitlab
ENV PATH="/opt/codesonar/codesonar/bin:${PATH}"


