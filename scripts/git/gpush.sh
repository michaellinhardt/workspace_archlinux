#!/usr/bin/env bash

sh $PATH_WORKSPACE/scripts/git/gsetup.sh
[[ $? != 0 ]] && exit 1;
sh $PATH_WORKSPACE/scripts/git/gstatus.sh
# Si aucun argument transmit on push et c'est tout
echo $CW8"git push"$CWH
git push
echo $COK"Done!"$CWH
exit 0
