import sys
import common

fin = sys.argv[1]
fout = sys.argv[2]
j = common.load_treebank(fin)
common.save_treebank(j, fout)
