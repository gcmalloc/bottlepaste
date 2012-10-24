#!/bin/sh

set +x

git push github master &&
git co custom &&
git rebase master &&
git push -f github custom  &&
git push -f cloud custom:master &&
cctrlapp bottlepaste/default deploy &&
git co master
