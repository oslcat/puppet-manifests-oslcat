#!/bin/sh

puppet apply --modulepath=modules --verbose $* nodes/*.pp 2> puppet_error.log
