import hashlib
from bottle import route, run, request, response, abort

BASE_URL = 'http://localhost:8080'


def description(filename='INDEX.rst'):
    with open(filename) as readme:
        return readme.read().replace("$DEPLOYMENT_URL", BASE_URL)


def creds():
    """ Try to obatin the credentials dictionary. """
    try:
        # get name of file from env
        cred_file = os.environ.get('CRED_FILE', '')
        # read file contents
        with open(cred_file, 'r') as cred_fp:
            cred_str = cred_fp.read()
    # in case the file doesn't exist
    except IOError:
        return {}
    try:
        # try to convert from json to dict
        return json.loads(cred_str)
    # in case the file contains nothing or garbage
    except ValueError:
        return {}


DESCRIPTION = description()
CREDS = creds()


class Database(object):

    def __init__(self):
        self._dict = {}
        self.get = self._get_dict
        self.put = self._put_dict

    def _get_dict(self, uid):
        return self._dict[uid]

    def _put_dict(self, code):
        uid = hash(code)
        self._dict[uid] = code
        return uid


storage = Database()


def hash(str_):
    return hashlib.sha224(str_).hexdigest()[:7]


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
    uid = storage.put(code)
    return "%s/%s\n" % (BASE_URL, uid)

run(host='localhost', port=8080)
