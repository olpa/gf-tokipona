test: test-parse test-linearize test-pu-parse

test-parse:
	python3 ./utils/check_parse.py

test-lin: test-linearize

test-linearize:
	python3 ./utils/check_linearize.py

test-pu-parse:
	(gf ./grammar/Tokipona.gf <./external/pu_phrases/treebank.gf | grep failed); test $$? -eq 1
