#!/bin/bash

ARCHIVE=$1
FILE=$2
PREFIX=$3 # optional internet archive directory prefix

# grep ARGUMENTS

# -v        Exclude matches
# '^\s*$'   Match any empty lines

# parallel ARGUMENTS

# --line-buffer               show output while working
# --trim lr                   remove leading and trailing whitespaces from entry
# --halt now,fail=1           exit on any error
# -k                          keep order

grep -v -e '^\s*$' -e '^#' $FILE | parallel --line-buffer --trim lr --halt now,fail=1 -k ia download $ARCHIVE "$PREFIX{}"
