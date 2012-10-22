import hashlib
from bottle import route, run, request

storage = {}

def hash(str_):
    return hashlib.sha224(str_).hexdigest()

@route('/')
def index():
    return '<b>Hello World</b>!'


@route('/', method='POST')
def upload():
    code = request.forms.get("bp")
    digest = hash(code)
    storage[digest] = code

run(host='localhost', port=8080)
