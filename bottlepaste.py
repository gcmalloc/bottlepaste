import hashlib
from bottle import route, run, request, response, abort

storage = {}
BASE_URL = 'http://localhost:8080'

with open('INDEX.rst') as readme:
    DESCRIPTION = readme.read()
DESCRIPTION = DESCRIPTION.replace("$DEPLOYMENT_URL", BASE_URL)


def hash(str_):
    return hashlib.sha224(str_).hexdigest()


@route('/')
def index():
    response.content_type = 'text/plain; charset=utf-8'
    return DESCRIPTION


@route('/<uid>')
def show(uid):
    response.content_type = 'text/plain; charset=utf-8'
    try:
        return storage[uid]
    except KeyError:
        abort(404, "Sorry, paste: '%s' Not found." % uid)

@route('/', method='POST')
def upload():
    code = request.forms.get("bp")
    digest = hash(code)[:7]
    storage[digest] = code
    return "%s/%s\n" % (BASE_URL, digest)

run(host='localhost', port=8080)
