#!/bin/sh

if [[ ${SUDO} == 'NO' ]]; then
    SUDO=""
else
    SUDO="sudo"
fi

${SUDO} puppet apply --modulepath=modules --verbose $* manifests/site.pp
