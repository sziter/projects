from nose.tools import *
from server.server import testserver

def test_server():
	testserver_i = testserver()
	testserver_i.app.run('0.0.0.0')
