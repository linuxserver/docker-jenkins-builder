#! /bin/bash

cat /build_version

if [[ -z "${CI_RUN}" ]]; then
    ansible-playbook generate.yml "$@"
else
    echo '[ls.io-init] done.'
fi
