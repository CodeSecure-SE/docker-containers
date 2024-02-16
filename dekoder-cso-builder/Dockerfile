FROM ubuntu:22.04

RUN apt update && apt -y install gosu time git gridsite-clients curl wget zip unzip default-jdk kotlin locales && apt clean

# To install Gradle
SHELL ["/bin/bash", "-c"]  
RUN cd /opt && wget https://services.gradle.org/distributions/gradle-8.6-bin.zip && unzip gradle-8.6-bin.zip && mv gradle-8.6 gradle
ENV GRADLE_HOME=/opt/gradle
ENV PATH=$PATH:$GRADLE_HOME/bin 

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



# this SHELL command is needed to allow using source
#SHELL ["/bin/bash", "-c"]  
#RUN source "$HOME/.sdkman/bin/sdkman-init.sh" 
#RUN sdk install kotlin