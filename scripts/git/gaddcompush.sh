#!/usr/bin/env bash

git add -A

sh /home/teazyou/workspace_archlinux/scripts/git/gcommit.sh $*
[[ $? != 0 ]] && exit 1;
sh /home/teazyou/workspace_archlinux/scripts/git/gpush.sh
[[ $? != 0 ]] && exit 1;

exit 0
