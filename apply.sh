#!/bin/sh

sudo puppet apply --modulepath=modules --verbose $* nodes/*.pp
