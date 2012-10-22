from bottle import route, run, request


@route('/')
def index():
    return '<b>Hello World</b>!'


@route('/', method='POST')
def upload():
    code = request.forms.get("bp")
    return code

run(host='localhost', port=8080)
