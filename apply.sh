#!/bin/sh

puppet apply --modulepath=modules --verbose $* nodes/*.pp
