FROM ubuntu:22.04


# install build toolchain
RUN apt-get update && apt-get install -y build-essential libssl-dev vim git autoconf automake libtool m4 curl zip nodejs python3 python3-pip libpsl-dev
# some of these are for mbedtls, not curl
RUN pip install jsonschema ninja2 python-mbedtls

