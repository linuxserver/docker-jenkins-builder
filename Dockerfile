FROM alpine:3.8

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="ironicbadger"

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache \
   ansible

COPY . /ansible
WORKDIR /ansible

CMD [ "ansible-playbook", "generate.yml" ]
