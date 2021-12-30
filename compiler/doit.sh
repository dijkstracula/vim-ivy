#!/bin/bash

# This is a hacky script to parse an Ivy file at some path.  Ivy requires that
# all .ivy files need to be in the current working directory, and there isn't a
# way of parsing a file without either calling into the checker or extraction
# to C++.  So, this ensures we change into the directory that the file is
# contained within, and, we stomp over $PATH so g++ is a no-op now.

filepath=$1

SOURCE=$(dirname ${BASH_SOURCE[0]})

olddir=$(PWD)
newdir=$(dirname $filepath)
fname=$(basename $filepath)

cd $newdir

export PATH="$SOURCE:$PATH"
ivyc target=test $fname \
    | grep ': error: '  \
    | sed -e "s:^${fname}:${filepath}:g"

# Note the gnarly hack in our use of sed: because Ivy will only report the
# filename and not the path, we have to resubstitute the original absolute file 
# in its place so QuickFix can find it.  Unfortunately, this will very likely
# cause weirdness if the error is in another file, so, the right solution is
# for Ivy to either give us the absolute path or let us specify files not 
# in the current working directory...
