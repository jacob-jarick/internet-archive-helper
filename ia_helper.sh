#!/bin/bash

ARCHIVE=$1
FILE=$2

# old xargs implementation
#grep -v '^\s*$' $FILE | xargs -d'\n' -I{} ia download $ARCHIVE {}

# new parallel implementation
grep -v -e '^\s*$' $FILE | parallel --halt now,fail=1 -k ia download $ARCHIVE {}

