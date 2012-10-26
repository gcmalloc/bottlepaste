bottlepaste
-----------

A command line pastebin akin to `sprunge.us <http://sprunge.us/>`_ but using
`bottle.py <http://bottlepy.org/docs/dev/bottle.py>`_.

Synposis
--------
::

    <command> | curl -F 'bp=<-' $DEPLOYMENT_URLs

Example
-------

Use curl to paste::

    $ cat bottlepaste.py | curl -F 'bp=<-' $DEPLOYMENT_URL
    $DEPLOYMENT_URL/f2eee88
