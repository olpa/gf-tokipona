import json

def load_treebank(fname):
    with open(fname) as h:
        j = json.load(h)
    return j

def save_treebank(j, fname):
    with open(fname, "w") as h:
        json.dump(j, h, sort_keys=True, indent=2)
        h.write('\n')
