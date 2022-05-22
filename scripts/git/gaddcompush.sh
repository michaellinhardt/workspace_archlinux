#!/bin/bash

git add -A

sh $PATH_WORKSPACE/scripts/git/gcommit.sh $*
[[ $? != 0 ]] && exit 1;
sh $PATH_WORKSPACE/scripts/git/gpush.sh
[[ $? != 0 ]] && exit 1;

exit 0
