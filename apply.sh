#!/bin/sh

sudo puppet apply --modulepath=modules --verbose $* manifests/site.pp
