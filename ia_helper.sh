#!/bin/bash

ARCHIVE=$1
FILE=$2

grep -v -e '^\s*$' $FILE | xargs -0 -d'\n' -I{} ia download $ARCHIVE {}
