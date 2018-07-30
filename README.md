# linuxserver/config-manager

You will need docker. Edit the `NAME` variable to match the `container-*` file in vars.

    docker run --rm -e NAME=airsonic -v ${PWD}/readme:/ansible/readme config-manager:latest

Then look under the `readme/project_name` directory.