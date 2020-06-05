The source of `treebank.txt` is:
https://gist.github.com/increpare/10d94b6d7f223dd0f07c73b10dadc020
COPYRIGHT NOTICE these sentences are covered under CC-BY 4.0 by jan Sonja.
Thanks [increpare](https://github.com/increpare/) for the data!

Generate GF script:

    cat treebank.txt | python3 convert.py >treebank.gf

Parse phrases using the treebank-script:

    gf ../../grammar/Tokipona.gf <./treebank.gf >parsed

* Open `parsed` for manual review.
* To check if there are errors, search for the word `failed`
