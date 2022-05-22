#!/bin/bash

git add -A

sh $PATH_WORKSPACE/sh/git/gcommit.sh $*
[[ $? != 0 ]] && exit 1;
sh $PATH_WORKSPACE/sh/git/gpush.sh
[[ $? != 0 ]] && exit 1;

exit 0
