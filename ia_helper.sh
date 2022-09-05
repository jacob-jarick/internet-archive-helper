#!/bin/bash

REVISION=3

echo ""
echo IA Helper Rev $REVISION
echo ""

if [[ -z "$1" ]]; then
  echo ERROR: no filename provided.
  exit
fi

# set job count
if [[ -z "$PJOBS" ]]; then
  echo setting jobs to default value 2
  echo ""
  PJOBS=2
fi

FILE=$1
PREFIX=$2 # optional internet archive directory prefix

# check $FILE exists
if [[ ! -f $FILE ]]; then
  echo ERROR: file \""$FILE"\" does not exist, exiting
  exit
fi

echo "Max Jobs: $PJOBS"
echo "File:     $FILE"

# get archive name from filename

ARCHIVE=$(basename "$FILE" | sed 's/\.txt$//i')

echo "Archive:  $ARCHIVE"

# if PREFIX is defined do some sanitizing
if [[ -n "$PREFIX" ]]; then
  PREFIX=$PREFIX/;                          # Add / to end of dir prefix
  PREFIX=$(echo "$PREFIX" | tr -s /);         # swap '//' for '/'
  PREFIX=$(echo "$PREFIX" | sed 's/^\///');   # remove (if exists) / from start of PREFIX

  echo "Dir:      $PREFIX"
fi

echo ""

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

grep -v -e '^\s*$' -e '^#' "$FILE" | parallel --jobs "$PJOBS" --line-buffer --trim lr --halt now,fail=1 -k ia download "$ARCHIVE" "$PREFIX{}"
