from nose.tools import *
from ex47.game import myclass

def test_first():
	testclass = myclass()
	testclass.print_in('HALLO')

def test_second():
	testclass = myclass()
	testclass.print_in_in('HALLO')
