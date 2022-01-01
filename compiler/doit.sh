#!/bin/bash

# This is a hacky script to parse an Ivy file at some path.  Ivy requires that
# all .ivy files need to be in the current working directory, and there isn't a
# way of parsing a file without either calling into the checker or extraction
# to C++.  So, this ensures we change into the directory that the file is
# contained within, and, we stomp over $PATH so g++ is a no-op now.  To avoid
# stomping over any files in the user's Ivy file's directory, everything happens
# inside a tempdir.

filepath=$1

# Add this script's directory to $PATH so when ivyc calls g++ it calls our
# no-op script.
SOURCE=$(realpath $(dirname ${BASH_SOURCE[0]}))
export PATH="$SOURCE:$PATH"

olddir=$(dirname $filepath)
fname=$(basename $filepath)

newdir=$(mktemp -d /tmp/${fname}.XXXXXX || exit 1)
cp ${olddir}/*.ivy $newdir
cd $newdir

# Note the gnarly hack in our use of sed: because Ivy will only report the
# filename and not the full path (and because we copied it to a tempdir
# anyway), we have to resubstitute the original absolute file in its place so
# QuickFix can find it.  Unfortunately, this will very likely cause weirdness
# if the error is in another file (i.e. module instantiation), so, the right
# solution is for Ivy to give us a target=parse option so Vim can call ivyc
# directly.
ivyc target=test $fname \
    | grep ': error: '  \
    | sed -e "s:^${fname}:${filepath}:g"

rm -r $newdir
