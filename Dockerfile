FROM ghcr.io/linuxserver/baseimage-alpine:3.13

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="homer, thelamer"

RUN \
  echo "**** install build packages ****" && \
  apk add --no-cache --upgrade \
    ansible \
    bash 

COPY . /ansible

ENTRYPOINT [ "/ansible/entrypoint.sh" ]
