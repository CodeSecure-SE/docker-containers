FROM canuckmh/aosp-builder:latest

RUN apt-get update && apt-get -y install gosu time gridsite-clients python3

# Add CodeSonar from the latest CodeSonar release
COPY --from=canuckmh/codesonar-c-builder:7.4p0 /opt/codesonar/. /opt/codesonar
COPY --from=canuckmh/codesonar-c-builder:7.4p0 /opt/codesonar-github/. /opt/codesonar-github
COPY --from=canuckmh/codesonar-c-builder:7.4p0 /opt/codesonar-gitlab/. /opt/codesonar-gitlab
ENV PATH="/opt/codesonar/codesonar/bin:${PATH}"

