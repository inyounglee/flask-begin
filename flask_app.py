
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def index():
    user_agent = request.headers.get('User-Agent')
    return f'Hello, World! <div>{user_agent}</div>'

@app.route('/hello')
def hello():
    name = request.args.get('name', 'Guest')
    return f'Hello, {name}!'

@app.route('/about')
def about():
    return render_template('about.html')

@app.before_request
def log_request_info():
    app.logger.info(f"Request: {request.method} {request.url} {request.headers.get('User-Agent')}")

if __name__ == '__main__':
    app.run(debug=True)