#! /bin/bash

if [[ -z "${CI_RUN}" ]]; then
    cd /ansible
    ansible-playbook generate.yml ${EXTRA_PLAYBOOK_PARAM}
else
    echo '[ls.io-init] done.'
    python3 /ansible/server.py
fi
