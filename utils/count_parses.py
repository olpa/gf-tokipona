import sys
from check_parse import parse

# For each example of `treebank.json`
# display the number of the alternative parses
#
# $ python3 utils/count_parses.py --grep L17
#  504  tplangL17StoryComma
# 1176  tplangL17G01
# 4368  tplangL17StoryMuAsWord

i2r = parse()
parsed = i2r[1]
counted = { k: len(parsed[k]) for k in parsed.keys() }

keys = list(counted.keys())
keys.sort(key = lambda k: counted[k])

for key in keys:
    print('{:> 5}  {}'.format(counted[key], key))
