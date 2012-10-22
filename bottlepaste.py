import hashlib
from bottle import route, run, request

storage = {}

def hash(str_):
    return hashlib.sha224(str_).hexdigest()

@route('/')
def index():
    return "</br>".join(storage.keys())

@route('/<uid>')
def show(uid):
    return storage[uid]

@route('/', method='POST')
def upload():
    code = request.forms.get("bp")
    digest = hash(code)
    storage[digest] = code

run(host='localhost', port=8080)
