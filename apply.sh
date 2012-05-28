#!/bin/bash

if [[ ${SUDO} == 'NO' ]]; then
    SUDO=""
else
    SUDO="sudo"
fi

if [[ ${SETUP} == 'YES' ]]; then
    ENVIRONMENT="setup_env/manifests/site.pp"
else
    ENVIRONMENT="manifests/site.pp"
fi

${SUDO} puppet apply --modulepath=modules --verbose $* ${ENVIRONMENT}
