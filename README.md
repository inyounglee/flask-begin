# flask 시작하기

## flask 설치까지 한번에

1. 가상환경 만들기 python3 -m venv venv
2. 가상환경 실행 source venv/bin/activate
3. flask 설치 pip install flask

위의 과정을 다음의 .bat 파일로 한번에 수행할 수 있다.

```bash
> init_project.bat

or

$ ./init_project.sh
```

## flask 실행

```bash
$ export FLASK_APP=flask_app.py
$ flask run

or 

> flask --app .\flask_app.py run
```

## flask를 이용한 정말 간단한 페이지

아래의 코드를 수행하면 "Hello World!"라는 문구가 나오는 페이지를 볼 수 있다.

flask_app.py

```python
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello, World!'

@app.route('/hello')
def hello():
    name = request.args.get('name', 'Guest')
    return f'Hello, {name}!'

@app.route('/about')
def about():
    return render_template('about.html')

if __name__ == '__main__':
    app.run()
```

실행하면 다음과 같은 로그를 확인할 수 있다.

```console
(.venv) PS D:\works\git-remote\flask-test> flask --app .\flask_app.py run
 * Serving Flask app '.\flask_app.py'
 * Debug mode: off
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on http://127.0.0.1:5000
Press CTRL+C to quit
127.0.0.1 - - [27/Mar/2023 12:12:01] "GET / HTTP/1.1" 200 -
127.0.0.1 - - [27/Mar/2023 12:12:17] "GET /about HTTP/1.1" 200 -
```

## 위의 예제에서 로그에 User-Agent 출력하기

```python
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def index():
    user_agent = request.headers.get('User-Agent')
    return f'Hello, World! {user_agent}'
```

### before_request 를 이용한 예제

```python
from flask import Flask, render_template, request

app = Flask(__name__)

@app.before_request
def log_request_info():
    app.logger.info(f"Request: {request.method} {request.url} {request.headers.get('User-Agent')}")
```

***TODO: 위의 예제는 로그가 출력되지 않음. 확인 필요. by 이인영, 2023-03-27***

## flask 코드 수정 후 자동으로 재시작하기

```bash
$ export FLASK_ENV=development
$ flask run

or on windows CMD (Not PowerShell)

> set FLASK_ENV=development && flask run
```

또는

```bash
    app.run(debug=True)
```

***Note) 위의 재시작하기 예제가 잘 안됨. by 이인영, 2023-03-27***
