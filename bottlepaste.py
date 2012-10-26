import hashlib
import json
import time
from bottle import route, run, request, response, abort
from pymongo import Connection

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
COLLECTION = 'paste_collection'


class Database(object):

    def __init__(self):
        try:
            # try to init mongodb connection
            mongodburi = CREDS['MONGOLAB']['MONGOLAB_URI']
            self._init_mongo(mongodburi)
        # fallback to simple storage if not possible
        except (KeyError):
            self._init_dict()

    def _init_mongo(self, mongodburi):
        self.description = 'mongo'
        db_name = mongodburi[mongodburi.rfind('/') + 1:]
        self._mongo = Connection(mongodburi)[db_name][COLLECTION]
        self.get = self._get_mongo
        self.put = self._put_mongo

    def _get_mongo(self, uid):
        entry = self._mongo.find_one(uid)
        if entry is None:
            raise KeyError()
        else:
            return entry['code']

    def _put_mongo(self, code):
        return self._mongo.insert(make_ds(code), safe=True)

    def _init_dict(self):
        self.description = 'dict'
        self._dict = {}
        self.get = self._get_dict
        self.put = self._put_dict

    def _get_dict(self, uid):
        return self._dict[uid]['code']

    def _put_dict(self, code):
        ds = make_ds(code)
        self._dict[ds['_id']] = ds
        return ds['_id']

    def __str__(self):
        return self.description

storage = Database()


def hash(str_):
    return hashlib.sha224(str_).hexdigest()[:7]


def make_ds(code):
    return {"_id": hash(code), "code": code,
            "date": time.time()}


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
