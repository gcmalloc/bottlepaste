import hashlib
from bottle import route, run, request, response, abort

BASE_URL = 'http://localhost:8080'


def description(filename='INDEX.rst'):
    with open(filename) as readme:
        return readme.read().replace("$DEPLOYMENT_URL", BASE_URL)

DESCRIPTION = description()


class Database(object):

    def __init__(self):
        self._dict = {}
        self.get = self._get_dict
        self.put = self._put_dict

    def _get_dict(self, uid):
        return self._dict[uid]

    def _put_dict(self, uid, code):
        self._dict[uid] = code
        return True

storage = Database()


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
        return storage.get(uid)
    except KeyError:
        abort(404, "Sorry, paste: '%s' Not found." % uid)


@route('/', method='POST')
def upload():
    code = request.forms.get("bp")
    uid = hash(code)[:7]
    storage.put(uid, code)
    return "%s/%s\n" % (BASE_URL, uid)

run(host='localhost', port=8080)
