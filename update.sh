#!/bin/bash -x

errCode=1

function incErrCode()
{
  errCode=$(( errCode++ ))
}

function error()
{
  [[ $# -eq 1 ]] && msg=${1}
  if [[ -n ${msg} ]]
  then
    echo "${msg}" >> /tmp/ap-err.txt
  fi
  exit ${errCode}
}


cp proj-*.service /usr/lib/systemd/system/.
[[ $? -eq 0 ]] || error
incErrCode


echo "*********************************************"
echo "*                                           *"
echo "*     Update complete.  Please reboot       *"
echo "*                                           *"
echo "*********************************************"
