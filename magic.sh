#!/bin/sh

set +x
rst2html.py --stylesheet-path=bottlepaste.css,vs.css  INDEX.rst INDEX.html &&
git add INDEX.html &&
git commit -m "Autocommit INDEX.html"
git push github master &&
git co custom &&
git rebase master &&
git push -f github custom  &&
git push -f cloud custom:master &&
cctrlapp bottlepaste/default deploy &&
git co master
