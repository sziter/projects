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

parent_ids = {"parent":("first", "second", "third"), "second_parent":("first", "fourth")}
ids = {"first":(-2, 2), "third":(5, 1), "second":(-5, 3), "fourth":(0, 2)}

text = "this is ein test wobei ich als first das hier teste und second teste was second getestet werden muss ... als drittes also (third) muss auch noch was getestet werden"
key_matches_dict = {}

for keys in parent_ids["parent"]:
	key_matches_dict[keys] = []
	iter = re.finditer(keys, text)
	iterate(iter, do_for_each_match, keys)

for keys in key_matches_dict:
	print keys + ' ' + ' '.join(map(str, key_matches_dict[keys]))

for keys in key_matches_dict:
	print keys
	for matches in key_matches_dict[keys]:
		start = matches + ids[keys][0]
		to = start + ids[keys][1]
		print text[start:to]
