#! /bin/bash

if [[ -z "${CI_RUN}" ]]; then
    cd /ansible
    ansible-playbook generate.yml
else
    echo '[services.d] done.'
    python3 /ansible/server.py
fi
