from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
  return '¡Hola, bienvenido a nuestra API!'

app.run(host='0.0.0.0', port=6000)