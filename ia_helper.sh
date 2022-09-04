#!/bin/bash

ARCHIVE=$1
FILE=$2

grep -v '^\s*$' $FILE | xargs -d'\n' -I{} ia download $ARCHIVE {}
