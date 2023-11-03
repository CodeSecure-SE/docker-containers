FROM canuckmh/nginx-builder:latest

RUN apt-get update && apt-get -y install gosu time gridsite-clients python3 python3-pip autoconf libtool automake
RUN pip3 install csv2md

# Add CodeSonar from the latest CodeSonar release
COPY --from=canuckmh/codesonar-c-builder:7.4p0 /opt/codesonar/. /opt/codesonar
COPY --from=canuckmh/codesonar-c-builder:7.4p0 /opt/codesonar-github/. /opt/codesonar-github
COPY --from=canuckmh/codesonar-c-builder:7.4p0 /opt/codesonar-gitlab/. /opt/codesonar-gitlab
ENV PATH="/opt/codesonar/codesonar/bin:${PATH}"

# This is to adjust the user in the container to a local user
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
