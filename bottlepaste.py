import hashlib
from bottle import route, run, request, response

storage = {}
BASE_URL = 'http://localhost:8080/'

DESCRIPTION = """
NAME
    bottlepaste: command line pastebin based on bottle.py

SYNOPSIS
    <command> | curl -F 'bp=<-' %s
""" % BASE_URL


def hash(str_):
    return hashlib.sha224(str_).hexdigest()


@route('/')
def index():
    response.content_type = 'text/plain; charset=utf-8'
    return DESCRIPTION


@route('/<uid>')
def show(uid):
    response.content_type = 'text/plain; charset=utf-8'
    return storage[uid]


@route('/', method='POST')
def upload():
    code = request.forms.get("bp")
    digest = hash(code)[:7]
    storage[digest] = code
    return "%s/%s\n" % (BASE_URL, digest)

run(host='localhost', port=8080)
