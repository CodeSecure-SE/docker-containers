FROM canuckmh/nginx-builder:latest

RUN apt-get update && apt-get install gosu

# Add CodeSonar from the latest CodeSonar release
COPY --from=canuckmh/codesonar-c-builder:7.4p0 /opt/codesonar/. /opt/codesonar
COPY --from=canuckmh/codesonar-c-builder:7.4p0 /opt/codesonar-github/. /opt/codesonar-github

# This is to adjust the user in the container to a local user
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
