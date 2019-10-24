test: test-parse test-linearize

test-parse:
	python3 ./utils/check_parse.py

test-lin: test-linearize

test-linearize:
	python3 ./utils/check_linearize.py
