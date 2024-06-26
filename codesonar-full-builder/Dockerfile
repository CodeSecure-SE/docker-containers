# This Dockerfile adds a CodeSonar installation to a Docker image.
# For the most part, the only thing it actually does is untar the
# CodeSonar tarball and accept the EULA without an interactive prompt.
# It can also optionally delete chunks of the CodeSonar installation
# if your use case permits.
# 
# GrammaTech does not recommend running CodeSonar analyses inside
# Docker unless the software being analyzed is normally built inside
# Docker.  If you do not already possess a Docker image for building
# your software, then this file is unlikely to be useful.
#
# This Dockerfile installs no compiler toolchains.  Therefore, it is
# unlikely it can compile your software.  Assuming you already have a
# docker image suitable for building your software, you should compose
# it with this Dockerfile by specifying your image's name for
#   --build-arg BASE_IMAGE=imagename
# on the "docker build" command line.
#
# If you do analyze your software inside a container, then special
# measures must be taken to make the .conf and .prj_files directory
# available to the hub after the analysis completes:
#  1) The -foreground switch must be used for "codesonar analyze"
#  2) The prj_files directory must be stashed somewhere it can stay
#     long-term after the container ceases to exist (consider using
#     docker bind mounts and keeping the prj_files on the host)
#  3) "codesonar relocate" must be executed on the prj_files directory
#     once it has moved to its long-term home, on the machine or
#     container that will survive long term.  An alternative to using
#     "codesonar relocate" is to execute "codesonar build" inside the
#     container and "codesonar analyze" (without -foreground) outside
#     the container.
#
# It is also possible to run hubs in Docker.  Do not do so unless you
# are familiar with using Docker and have a compelling reason to run
# your hub inside it.  Using Docker for hubs introduces some
# challenges:
#   1) License management is more complicated, perhaps necessitating a
#      license server hosted on a physical machine.  --network host
#      mitigates this.
#   2) If the hub directory is stored inside the container, it can
#      easily be lost when the hub terminates.  Be sure to use a bind
#      mount or volume.
#   3) By default, the hub's listening port will not be exposed.  Use
#      Docker's -p switch.


# Example "docker build" line:
#    docker build . --tag codesonar --build-arg CODESONAR_PACKAGE=codesonar-5.3p0.20200327-x86_64-pc-linux.tar.gz --build-arg TELEMETRY=1
# 
# This Dockerfile takes a number of --build-arg arguments:
#   Mandatory:
#     CODESONAR_PACKAGE=codesonar-...-x86_64-pc-linux.tar.gz
#                          Basename of the CodeSonar package tarball downloaded from GrammaTech, 
#                          saved to this directory (the docker context directory)
#     TELEMETRY=1|0        Enable or disable anonymous usage statistics
#   Optional:
#     BASE_IMAGE           Base image to be used in FROM line.  
#                          Must be glibc-based; cannot be alpine.
#                          Should likely be the image normally used
#                          for building your software.
#     HUB=0                Delete components required for running hubs
#     JAVA_ANALYSIS=0      Delete components required for analyzing Java and C#
#     PYTHON_ANALYSIS=0    Delete components required for analyzing Python
#     JAVA_API=0           Delete components required for building/running CodeSonar plugins implemented in Java
#     CSHARP_API=0         Delete components required for building/running CodeSonar plugins implemented in C#
#     PYTHON_API=0         Delete components required for building/running CodeSonar plugins implemented in Python
#     ECLIPSE=0            Delete components required for Eclipse IDE integration
#     CONFIG_TOOL=0        Delete components required for 'codesonar config'
#     GENERATE_CERT=0      Delete components required for 'codesonar generate-hub-cert'
#     CMDLINE_UTILITIES=0  Delete command line utilities that some users find handy for scripting
# 
# Example: If you don't intend to run a hub with this codesonar
# installation, then specifying --build-arg HUB=0 will delete parts
# of the installation that would only be needed for running hubs.
#
# An image supporting minimal features (only analyzing c/c++ code)
# would use a command line like:
# 
#    docker build . --tag codesonar_c_analysis --build-arg CODESONAR_PACKAGE=codesonar-5.3p0.20200327-x86_64-pc-linux.tar.gz --build-arg TELEMETRY=1 --build-arg HUB=0 --build-arg JAVA_ANALYSIS=0 --build-arg PYTHON_ANALYSIS=0 --build-arg JAVA_API=0 --build-arg CSHARP_API=0 --build-arg PYTHON_API=0 --build-arg ECLIPSE=0 --build-arg CMDLINE_UTILITIES=0 --build-arg CONFIG_TOOL=0 --build-arg GENERATE_CERT=0
#
# The resulting image is about one tenth the size of a full-featured image.
#
# CodeSonar may fail in very unfriendly ways if you attempt to use a
# feature after deleting parts of the CodeSonar installation required
# by that feature.  If you encounter problems, please try using a
# full-featured image.
#
# Here's an example "docker run" line:
#   echo 'int main(){ return 1/0; }' > /home/alex/foo.c
#   docker run -v /home/alex:/home/alex codesonar_c_analysis /opt/codesonar/codesonar/bin/codesonar analyze /home/alex/foo -foreground riddle2:6325 /opt/codesonar/codesonar/bin/null-cc -c /home/alex/foo.c
# 
# This example uses null-cc because no compiler toolchains are
# installed in the base image.  However, null-cc is very unlikely to
# work for any real program: Please install and use the compiler you
# normally use to build your software.

# Any glibc-based distro will work.  Alpine will not.
ARG BASE_IMAGE=ubuntu:22.04

FROM $BASE_IMAGE as codesonar_install_staging

# The user must specify the name of the codesonar package tarball.
ARG CODESONAR_PACKAGE

# Sanity check CODESONAR_PACKAGE
RUN test "x$CODESONAR_PACKAGE" '!=' x || \
    (echo "Please copy your codesonar package tarball to the same directory as the Dockerfile and specify --build-arg CODESONAR_PACKAGE=codesonar-5.3p0....-x86_64-pc-linux.tar.gz" && false)

# Untar codesonar
ADD $CODESONAR_PACKAGE /opt/
RUN ln -s /opt/codesonar-* /opt/codesonar
ADD codesonar-github-integration-1.2p0.tar.gz /opt2/
ADD codesonar-gitlab-integration-1.6p0.tar.gz /opt3/

# Accept the EULA
RUN rm /opt/codesonar/UNACCEPTED_LICENSE.txt

# Telemetry should either be on or off.  This parameter is mandatory.
ARG TELEMETRY

# Sanity check TELEMETRY
RUN test "x$TELEMETRY" = x0 || test "x$TELEMETRY" = x1 \
   || (echo "Please use --build-arg TELEMETRY=1 to enable anonymous usage statistics or use --build-arg TELEMETRY=0 to disable anonymous usage statistics" && false)

# Set telemetry mode
RUN touch /opt/codesonar/TELEMETRY_$(test "x$TELEMETRY" = x1 && echo ENABLED || echo DISABLED)

# Sanity check that we didn't forget anything above--this will fail if we did.
RUN /opt/codesonar/codesonar/bin/codesonar activate

# Various optional arguments for deleting chunks of the install
ARG HUB=1
ARG JAVA_ANALYSIS=1
ARG PYTHON_ANALYSIS=1
ARG JAVA_API=1
ARG CSHARP_API=1
ARG PYTHON_API=1
ARG ECLIPSE=1
ARG CMDLINE_UTILITIES=1
ARG CONFIG_TOOL=1
ARG GENERATE_CERT=1


RUN test "x$JAVA_ANALYSIS" '!=' x0 || ( cd /opt/codesonar && rm -fr \
third-party/jdt-4.5.2 \
julia \
csurf/lib/codesonarj-cli-pp \
csurf/lib/codesonarj-resources \
csurf/lib/codesonarj-runtimes \
csurf/lib/jfe-libs \
csurf/lib/jfe.jar \
java-commons \
)

RUN test "x$JAVA_API" '!=' x0 || ( cd /opt/codesonar && rm -fr \
codesonar/classes \
codesonar/src/api/java \
)

RUN test "x$CSHARP_API" '!=' x0 || ( cd /opt/codesonar && rm -fr \
codesonar/src/api/csharp \
)

RUN test "x$PYTHON_API" '!=' x0 || test "x$JAVA_ANALYSIS" '!=' x0 || ( cd /opt/codesonar && rm -fr \
codesonar/src/api/python \
)

RUN test "x$PYTHON_ANALYSIS" '!=' x0 || ( cd /opt/codesonar && rm -fr \
third-party/pylint-sarif \
)

RUN test "x$HUB" '!=' x0 || ( cd /opt/codesonar && rm -fr \
codesonar/doc \
codesonar/py/hub \
codesonar/py/processors \
codesonar/src/api/javadoc \
codevice \
csurf/doc \
csurf/src/api/javadoc \
csurf/src/feir/api/javadoc \
third-party/boost \
third-party/jquery \
third-party/postgresql \
third-party/postgresql-8.3 \
third-party/postgresql-8.4 \
third-party/postgresql-9.0 \
third-party/postgresql-9.1 \
third-party/postgresql-9.2 \
third-party/postgresql-9.3 \
third-party/postgresql-9.6 \
third-party/postgresql-12 \
third-party/postgresql-13 \
third-party/postgresql-14 \
third-party/sqlalchemy \
win32-fetcher \
)

RUN test "x$JAVA_ANALYSIS" '!=' x0 || test "x$HUB" '!=' x0 ||  ( cd /opt/codesonar && rm -fr \
third-party/gson \
)

RUN test "x$ECLIPSE" '!=' x0 || ( cd /opt/codesonar && rm -fr \
csonar-eclipse \
)

RUN test "x$CMDLINE_UTILITIES" '!=' x0 || ( cd /opt/codesonar && rm -fr \
third-party/curl \
)

RUN test "x$CMDLINE_UTILITIES" '!=' x0 || test "x$HUB" '!=' x0 || test "x$GENERATE_CERT" '!=' x0 ||  ( cd /opt/codesonar && rm -fr \
third-party/openssl \
)

RUN test "x$CONFIG_TOOL" '!=' x0 || ( cd /opt/codesonar && rm -fr \
codesonar/py/config \
)

RUN test "x$PYTHON_API" '!=' x0 || test "x$PYTHON_ANALYSIS" '!=' x0 || test "x$CONFIG_TOOL" '!=' x0 || test "x$HUB" '!=' x0 ||  test "x$JAVA_ANALYSIS" '!=' x0 || ( cd /opt/codesonar && rm -fr \
third-party/python \
)

# Now that we've shrunk the installation with all those rm commands,
# start a new stage so the image can actually reclaim the space.  Note
# that Docker 17.05 is required for this to work.  If this line gives
# you trouble, delete it and the rest of the file.  The --build-arg
# FOOBAR=0 arguments will not save any disk space if these lines are
# deleted.
FROM $BASE_IMAGE
COPY --from=codesonar_install_staging /opt/codesonar/. /opt/codesonar
COPY --from=codesonar_install_staging /opt2/codesonar-github-integration-1.2p0/distro-image/codesonar-github/. /opt/codesonar-github
COPY --from=codesonar_install_staging /opt3/codesonar-gitlab-integration-1.6p0/distro-image/. /opt/codesonar-gitlab

ENV PATH="/opt/codesonar/codesonar/bin:${PATH}"

ENV TZ=America/New_York 
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get -y install build-essential git vim cmake libssl-dev tclsh time libz-dev libpcre3-dev gridsite-clients

RUN useradd codesonar -d /home/codesonar -s /bin/bash -m
