#!/usr/bin/python
#-*- coding:utf-8 -*-

from datetime import datetime, timedelta
import urllib2
import time
import re
import sys

def iterate(iter, func):
	while True:
		try:
			m = iter.next()
			func(m)
		except StopIteration as e:
			break

def replace_time(url, time_template, time):
	print time
	print time_template
	splitted = url.split(time_template, 1)
	url = ''.join([splitted[0][:(len(splitted[0])-2)] + time + splitted[1][2:]])

	return url

def replace_date(url, date_template, date):
	splitted = url.split(date_template, 1)
	url = ''.join([splitted[0][:(len(splitted[0])-8)] + date + date_template + splitted[1]])

	return url

def for_each_match(match):
		match_list.append(match.end() + 3)

def add_ab_an(mess, i):
	if mess[i-65] == 'a':
		return mess[i-65:i-63] + " "
	else:
		return mess[i-64:i-62] + " "

def craft_output():
	global out, time, time_now, date

	if match_list == []:
		out = '\n' + time + " checked at " + time_now.strftime('%X') + " "  + date + '\n' + "No Matches"
	else:
		out += '\n' + time + " checked at " + time_now.strftime('%X') + " " + date

	for i in match_list:
		match_time =  mess[i-33-5:i-33] + ' '
		if mess[i:i+3] == "ca.":
			if mess[i+11] == '<':
				out += '\n' + add_ab_an(mess, i) + match_time + mess[i:i+3] + mess[i+9:i+11]
				#print out
			else:
				out += '\n' + add_ab_an(mess, i) + match_time + mess[i:i+3] + mess[i+9:i+12]
				#print out
		elif mess[i+2] == '<':
			out += '\n' + add_ab_an(mess, i) + match_time + mess[i:i+2]
			#print out
		elif mess[i+3] == '<':
			out += '\n' + add_ab_an(mess, i) + match_time + mess[i:i+3]
			#print out


def modify_url():
	global url, url_template, time_template, time, date

	url = replace_time(url_template, time_template, time)
	url = replace_date(url, date_template, date)

def get_http_from_url():
	global url

	req = urllib2.Request(url)
	try:
		resp = urllib2.urlopen(req, timeout = 10)
		return resp.read()
	except urllib2.URLError as e:
		out = "urllib2.URLError"
		return ''

def set_time_and_date():
	global time_now, time, date

	try:
		time = sys.argv[1] + "%3A" + sys.argv[2]
	except:
		time_lookup = time_now + timedelta(hours=1)
		time = time_lookup.strftime("%H") + "%3A" + time_now.strftime("%M")
		date = time_lookup.strftime("%d.%m.%y")

# Variables
time_now = datetime.now()
url_template = 'http://reiseauskunft.bahn.de/bin/query.exe/dn?revia=yes&existOptimizePrice=1&country=DEU&dbkanal_007=L01_S01_D001_KIN0001_qf-bahn_LZ003&ignoreTypeCheck=yes&S=D%FCsseldorf+Hbf&REQ0JourneyStopsSID=&REQ0JourneyStopsS0A=7&Z=G%FCtersloh+Hbf&REQ0JourneyStopsZID=&REQ0JourneyStopsZ0A=7&trip-type=single&date=Mo%2C+07.12.15&time=10%3A42&timesel=arrive&returnTimesel=depart&optimize=0&travelProfile=-1&adult-number=1&children-number=0&infant-number=0&tariffTravellerType.1=E&tariffTravellerReductionClass.1=0&tariffTravellerAge.1=&qf-trav-bday-1=&tariffTravellerReductionClass.2=0&tariffTravellerReductionClass.3=0&tariffTravellerReductionClass.4=0&tariffTravellerReductionClass.5=0&tariffClass=2&start=1&qf.bahn.button.suchen='
#url_template = 'http://reiseauskunft.bahn.de/bin/query.exe/dn?revia=yes&existOptimizePrice=1&country=DEU&dbkanal_007=L01_S01_D001_KIN0001_qf-bahn_LZ003&ignoreTypeCheck=yes&S=D%FCsseldorf+Hbf&REQ0JourneyStopsSID=&REQ0JourneyStopsS0A=7&Z=G%FCtersloh+Hbf&REQ0JourneyStopsZID=&REQ0JourneyStopsZ0A=7&trip-type=single&date=So%2C+06.12.15&time=15%3A00&timesel=arrive&returnTimesel=depart&optimize=0&travelProfile=-1&adult-number=1&children-number=0&infant-number=0&tariffTravellerType.1=E&tariffTravellerReductionClass.1=0&tariffTravellerAge.1=&qf-trav-bday-1=&tariffTravellerReductionClass.2=0&tariffTravellerReductionClass.3=0&tariffTravellerReductionClass.4=0&tariffTravellerReductionClass.5=0&tariffClass=2&start=1&qf.bahn.button.suchen='
time_template = "%3A"
date_template = "&time"
toolate_pattern = 'color:#f00'
out = ""
match_list = []

# Main Functionality
set_time_and_date()

print "checking " + time + " at " + date

modify_url()
#url = url_template

mess = get_http_from_url()

## Find matches and create the match list
match_iter = re.finditer(toolate_pattern, mess)
iterate(match_iter, for_each_match)

print match_list

craft_output()

if out is not None:
	f = open('out_httpcheck', 'a')
	f.write(out + '\n')
	f.close()
