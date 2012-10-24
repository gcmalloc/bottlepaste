bottlepaste
-----------

A command line pastebin akin to `sprunge.us <http://sprunge.us/>`_ but using
`bottle.py <http://bottlepy.org/docs/dev/bottle.py>`_.

The author deploys it on `cloudControl <https://www.cloudcontrol.com/>`_ as:
`bottlepaste <http://bottlepaste.cloudcontrolled.com/>`_

Stability
---------

This software is in alpha stage. Don't depend in any way on the links.

Deployment
----------

The cloudControl specific customizations and files  are stored in the
``custom`` branch. When deploying, the ``custom`` branch is rebased onto the
local master, then pushed to ``master`` on the remote side and then deployed as
the ``default`` deployment. See the ``magic.sh`` script for how it's done.
Incidentally, since cloudControl uses ``buildpacks`` you *should* be able tp
deploy this app to heroku too.

Copyright
---------

© 2012 Valentin Haenel

bottlepaste is licensed under the terms of the MIT License.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
