#!/bin/bash

ARCHIVE=$1
FILE=$2

# old xargs implementation
#grep -v '^\s*$' $FILE | xargs -d'\n' -I{} ia download $ARCHIVE {}

# new parallel implementation

# grep ARGUMENTS

# -v        Exclude matches
# '^\s*$'   Match any empty lines

# parallel ARGUMENTS

# --line-buffer               show output while working
# --rpl "{} s:^\s+|\s+$::"    remove leading and trailing whitespaces from entry
# --halt now,fail=1           exit on any error
# -k                          keep order

grep -v '^\s*$' $FILE | parallel --line-buffer --rpl "{} s:^\s+|\s+$::" --halt now,fail=1 -k ia download $ARCHIVE {}

