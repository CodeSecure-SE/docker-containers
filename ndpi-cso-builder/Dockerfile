FROM canuckmh/ndpi-builder:latest

RUN apt-get update && apt-get -y install gosu time gridsite-clients python3

# Add CodeSonar from the latest CodeSonar release
COPY --from=canuckmh/codesonar-c-builder:8.1p0 /opt/codesonar/. /opt/codesonar
COPY --from=canuckmh/codesonar-c-builder:8.1p0 /opt/codesonar-github/. /opt/codesonar-github
COPY --from=canuckmh/codesonar-c-builder:8.1p0 /opt/codesonar-gitlab/. /opt/codesonar-gitlab
ENV PATH="/opt/codesonar/codesonar/bin:${PATH}"

# This is to adjust the user in the container to a local user
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
