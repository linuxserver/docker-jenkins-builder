#!/bin/bash

# initialize variables
ALL_SHELL_FILES=()
EXECUTABLE_FILES=()
MOUNT_OPTIONS=()
NON_EXECUTABLE_FILES=()
SHELLCHECK_ENTRYPOINT="/bin/shellcheck"
SHELLCHECK_IMAGE="koalaman/shellcheck:stable"
SHELLCHECK_OPTIONS=("--exclude=SC1008" "--format=checkstyle" "--shell=bash")
SHELLCHECK_WORKDIR="/mnt"
TEST_AREA=()

# clear preexising checkstyle files
echo "<?xml version='1.0' encoding='UTF-8'?><checkstyle version='4.3'></checkstyle>" >"${WORKSPACE}"/shellcheck-result.xml

if [[ -d "${WORKSPACE}"/init ]]; then
    MOUNT_OPTIONS+=("-v" "${WORKSPACE}/init:${SHELLCHECK_WORKDIR}/init")
    TEST_AREA+=("init")
fi

if [[ -d "${WORKSPACE}"/services ]]; then
    MOUNT_OPTIONS+=("-v" "${WORKSPACE}/services:${SHELLCHECK_WORKDIR}/services")
    TEST_AREA+=("services")
fi

if [[ -d "${WORKSPACE}"/root/etc/cont-init.d ]]; then
    MOUNT_OPTIONS+=("-v" "${WORKSPACE}/root/etc/cont-init.d:${SHELLCHECK_WORKDIR}/root/etc/cont-init.d")
    TEST_AREA+=("root/etc/cont-init.d")
fi

if [[ -d "${WORKSPACE}"/root/etc/services.d ]]; then
    MOUNT_OPTIONS+=("-v" "${WORKSPACE}/root/etc/services.d:${SHELLCHECK_WORKDIR}/root/etc/services.d")
    TEST_AREA+=("root/etc/services.d")
fi

if [[ -d "${WORKSPACE}"/root/etc/s6-overlay/s6-rc.d ]]; then
    MOUNT_OPTIONS+=("-v" "${WORKSPACE}/root/etc/s6-overlay/s6-rc.d:${SHELLCHECK_WORKDIR}/root/etc/s6-overlay/s6-rc.d")
    TEST_AREA+=("root/etc/s6-overlay/s6-rc.d")
fi

# exit gracefully if no TEST_AREA are found
if [[ ${#TEST_AREA[@]} -eq 0 ]]; then
    echo "no common folders found, linting not required"
    exit 0
fi

# check test area for executable files
while IFS= read -r -d '' file; do
    if head -n1 "${file}" | grep -q -E -w "sh|bash|dash|ksh"; then
        ALL_SHELL_FILES+=("${file}")
        if [[ -x "${file}" ]]; then
            EXECUTABLE_FILES+=("${file}")
        else
            NON_EXECUTABLE_FILES+=("${file}")
        fi
    fi
done < <(find "${TEST_AREA[@]}" -type f -print0)

# exit with error if non executable shell scripts are found
if [[ ${#NON_EXECUTABLE_FILES[@]} -ne 0 ]]; then
    echo "the following shell scripts are not executable:"
    printf "'%s'\n" "${NON_EXECUTABLE_FILES[@]}"
    #exit 1 # errors for non executable files are reported by https://github.com/linuxserver/github-workflows/blob/v1/.github/workflows/init-svc-executable-permissions.yml
fi

# exit gracefully if no ALL_SHELL_FILES are found
if [[ ${#ALL_SHELL_FILES[@]} -eq 0 ]]; then
    echo "no common files found, linting not required"
    exit 0
fi

# run shellcheck
docker pull "${SHELLCHECK_IMAGE}"
docker run --rm -t \
    "${SHELLCHECK_IMAGE}" \
    shellcheck --version
find "${ALL_SHELL_FILES[@]}" -exec \
    docker run --rm -t \
    --entrypoint "${SHELLCHECK_ENTRYPOINT}" \
    --workdir "${SHELLCHECK_WORKDIR}" \
    "${MOUNT_OPTIONS[@]}" \
    "${SHELLCHECK_IMAGE}" \
    "${SHELLCHECK_OPTIONS[@]}" {} + \
    >"${WORKSPACE}"/shellcheck-result.xml

# exit gracefully
exit 0
