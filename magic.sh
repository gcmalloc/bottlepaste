#!/bin/sh

set +x
rst2html.py --stylesheet-path=bottlepaste.css,vs.css  index.rst index.tpl &&
git add index.tpl &&
git commit -m "Autocommit index.tpl"
git push github master &&
git co custom &&
git rebase master &&
git push -f github custom  &&
git push -f cloud custom:master &&
cctrlapp bottlepaste/default deploy &&
git co master
