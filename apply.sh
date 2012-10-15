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

if [ -f $HOME/.puppet/hiera.yaml ]; then
    HIERA="--confdir=$HOME/.puppet"
    echo OSLCAT: warning: using $HOME/.puppet for hiera
else
    HIERA=""
fi

${SUDO} puppet apply --modulepath=modules ${HIERA} --verbose $* ${ENVIRONMENT}
