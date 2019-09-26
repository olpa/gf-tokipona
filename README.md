# gf-tokipona
Describe Toki Pona using Grammatical Framework

The current progress is in the file `treebank.json`. To check the conversion:

```
$ make test
```

or individually:

```
$ make test-parse
$ make test-linearize # or just test-lin
```

Use a regular expression in `--grep` to check a specific example:

```
python3 utils/check_parse.py --grep "L02"
python3 utils/check_linearize.py --grep "L02"
```
