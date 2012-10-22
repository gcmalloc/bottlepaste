import hashlib
from bottle import route, run, request

storage = {}
BASE_URL='http://localhost:8080/'

DESCRIPTION = """
NAME
    sprunge: command line pastebin.

SYNOPSIS
    <command> | curl -F 'sprunge=<-' %s
""" % BASE_URL

def hash(str_):
    return hashlib.sha224(str_).hexdigest()

@route('/')
def index():
    return DESCRIPTION

@route('/<uid>')
def show(uid):
    return storage[uid]

@route('/', method='POST')
def upload():
    code = request.forms.get("bp")
    digest = hash(code)[:7]
    storage[digest] = code
    return "http://localhost:8080/%s\n" % digest

run(host='localhost', port=8080)
