FROM ubuntu:latest

LABEL maintainer="Phillip Maree <phillip.maree@volue.com>"

ARG OPENDSS_URL='https://svn.code.sf.net/p/electricdss/code/trunk/Version8/Source'
ARG KLUSOLVE_URL='https://svn.code.sf.net/p/klusolve/code/'

ARG SOURCE_PATH='src/'
ARG LIBRARY_PATH='lib/'
ARG INCLUDE_PATH='inc/'

ARG OPENDSS_DIR=${SOURCE_PATH}'opendss/'
ARG KLUSOLVE_DIR=${SOURCE_PATH}'klusolve/'

ARG OPENDSS_BUILD_DIR=${OPENDSS_DIR}'CMD/'
ARG KLUSOLVE_BUILD_DIR=${KLUSOLVE_DIR}'build/'

WORKDIR /tmp

ENV TZ=Europe/Oslo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get upgrade  -y
RUN apt-get -y install lazarus subversion cmake unzip

RUN svn checkout ${KLUSOLVE_URL} ${KLUSOLVE_DIR}
RUN mkdir -p ${KLUSOLVE_BUILD_DIR} \
    && cd ${KLUSOLVE_BUILD_DIR} \
    && cmake -DCMAKE_BUILD_TYPE=Release .. \
    && make \
    && make install

RUN svn checkout ${OPENDSS_URL} ${OPENDSS_DIR}
RUN ln -s /tmp/src/opendss/CMD/lib/liblinenoise.so /usr/lib/liblinenoise.so \
    && ln -s /usr/local/lib/libklusolve.so /usr/lib/libklusolve.so \
    && cd ${OPENDSS_BUILD_DIR} && mkdir -p units \
    && bash build.sh






