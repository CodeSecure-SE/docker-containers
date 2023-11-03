FROM canuckmh/nginx-builder:latest

RUN apt-get update && apt-get -y install gosu time gridsite-clients python3

# Add CodeSonar from the latest CodeSonar release
COPY --from=canuckmh/codesonar-c-builder:7.4p0 /opt/codesonar/. /opt/codesonar
COPY --from=canuckmh/codesonar-c-builder:7.4p0 /opt/codesonar-github/. /opt/codesonar-github
COPY --from=canuckmh/codesonar-c-builder:7.4p0 /opt/codesonar-gitlab/. /opt/codesonar-gitlab
ENV PATH="/opt/codesonar/codesonar/bin:${PATH}"

# This is to adjust the user in the container to a local user
ARG USERNAME=user
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME
