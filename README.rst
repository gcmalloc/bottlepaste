bottlepaste
-----------

A command line pastebin akin to ''http://sprunge.us/'' but using ''bottle.py''.

The authors deploys it on ''http://cc.bp.cloudcontrolled.com/''.

Synposis
--------

Use curl to paste::

    $ cat bottlepaste.py | curl -F 'bp=<-'  $DEPLOYMENT_URL
    $ $DEPLOYMENT_URL/6e5da45

Stability
---------

This software is in alpha stage. Don't depend in any way on the links.

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