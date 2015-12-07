import re

def iterate(iter, func, key):
	while True:
		try:
			m = iter.next()
			func(m, key)
		except StopIteration as e:
			break

def do_for_each_match(match, key):
	key_matches_dict[key].append(match.start())

ids = {"first":(-2, 2), "third":(5, 1), "second":(-5, 3), "fourth":(0, 2)}

text = "this is ein test wobei ich als first das hier teste und second teste was second getestet werden muss ... als drittes also (third) muss auch noch was getestet werden"
key_matches_dict = {}

for keys in ids:
	key_matches_dict[keys] = []
	iter = re.finditer(keys, text)
	iterate(iter, do_for_each_match, keys)

for keys in ids:
	print keys
	for matches in key_matches_dict[keys]:
		start = matches + ids[keys][0]
		print start
		to = start + ids[keys][1]
		print to
		print text[start:to]
