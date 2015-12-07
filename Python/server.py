from flask import Flask
import hashlib

app = Flask("__name__")

@app.route("/")
def hello():
	return "Hello World!"

@app.route("/<input>")
def myfunc(input):
	return "%d" % sum([ord(c) for c in input])

@app.route("/sha/<input>")
def sha(input):
	return "%s" % hashlib.sha1(input).hexdigest()

if __name__ == "__main__":
	app.run("0.0.0.0")
