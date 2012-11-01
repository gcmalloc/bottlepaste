bottlepaste
===========

A command line pastebin akin to `sprunge.us <http://sprunge.us/>`_ but using
`bottle.py <http://bottlepy.org/docs/dev/bottle.py>`_.

Synposis
--------

.. code:: sh

    <command> | curl -F 'bp=<-' [-F 'uid=<uid>'] $DEPLOYMENT_URL

Example
-------

Use curl to paste:

.. code:: sh

    $ cat bottlepaste.py | curl -F 'bp=<-' $DEPLOYMENT_URL
    $DEPLOYMENT_URL/ec42eda

If you want a custom uid, use:

.. code:: sh

    $ cat bottlepaste.py | curl -F 'bp=<-' -F 'uid=bottlepaste.py' $DEPLOYMENT_URL
    $DEPLOYMENT_URL/bottlepaste.py

The ``uid`` is goverend by the following regex: ``'^[a-zA-Z0-9_\-\.]{3,23}$``

See Also
--------

* `github repository <https://github.com/esc/bottlepaste>`_

.. footer:: © 2012 Valentin Haenel and proudly hosted on `cloudControl <https://cloudcontrol.com>`_
