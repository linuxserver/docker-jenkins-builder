# linuxserver/doc-builder

Expects to run as part of the LSIO CI process. Not for public consumption.

    docker run --rm -e CONTAINER_NAME=${CONTAINER_NAME} -v ${TEMPDIR}:/ansible/readme linuxserver/doc-builder:latest