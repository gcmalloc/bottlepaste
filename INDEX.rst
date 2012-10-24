bottlepase
----------

A command line pastebin akin to `sprunge.us <http://sprunge.us/>`_ but using
`bottle.py <http://bottlepy.org/docs/dev/bottle.py>`_.

Synposis
--------

Use curl to paste::

    $ cat bottlepaste.py | curl -F 'bp=<-'  $DEPLOYMENT_URL
    $DEPLOYMENT_URL/6e5da45
