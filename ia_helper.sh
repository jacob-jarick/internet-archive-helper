#!/bin/bash

ARCHIVE=$1
FILE=$2
PREFIX=$3 # optional internet archive directory prefix

# if PREFIX is defined do some sanitizing
if [ ! -z "$PREFIX" ];
  then
    PREFIX=$(echo $PREFIX | sed 's/^\///');   # remove (if exists) / from start of PREFIX
    PREFIX=$(echo $PREFIX/ | tr -s /);        # Add / to end of dir prefix and swap '//' for '/'
fi

# grep ARGUMENTS

# -v          Exclude matches
# -e '^\s*$'  Match any empty lines
# -e '^#'     Match lines beginning with #

# parallel ARGUMENTS

# --jobs 2            run up to 2 downloads in parallel
# --line-buffer       show output while working
# --trim lr           remove leading and trailing whitespaces from entry
# --halt now,fail=1   exit on any error
# -k                  keep order

grep -v -e '^\s*$' -e '^#' $FILE | parallel --jobs 2 --line-buffer --trim lr --halt now,fail=1 -k ia download $ARCHIVE "$PREFIX{}"
