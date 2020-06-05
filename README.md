# gf-tokipona

Describe [Toki Pona](https://tokipona.org/) using [Grammatical Framework](https://www.grammaticalframework.org/).

All the features described in the official Toki Pona book (ISBN 978-0-9782923-0-0) are implemented.

## Fast start


```
$ gf Tokipona.gf

         *  *  *
      *           *
    *               *
   *
   *
   *        * * * * * *
   *        *         *
    *       * * * *  *
      *     *      *
         *  *  *
...


Test> linearize UseCl (Clause Sina_Pron (PredNP (AdjNP (UseN Mije_W) (UseA Sona_W))))
sina mije sona .


Test> parse "sina mije sona ."
UseCl (Clause Sina_Pron (PredNP (AdjNP (UseN Mije_W) (UseA Sona_W))))
UseCl (ClausePred (PredNP (AdjNP (AdjNP Sina_Pron (UseA Mije_W)) (UseA Sona_W))))
UseCl (ClausePred (PredNP (AdjNP (AdjNP (UseN Sina_W) (UseA Mije_W)) (UseA Sona_W))))
```

## Explanation

### Example

Consider the following parse tree:

```
"sina mije sona ." ->

UseCl (Clause
          Sina_Pron
          (PredNP
              (AdjNP (UseN Mije_W) (UseA Sona_W))))
```

A `Clause` consists of a subject and a predicate. The subject is the pronomen `sina`. The predicate `PredNP` is a noun phrase predicate `mije sona`, which is a noun `mije` with adjective `sona`.

The constructor `UseCl cl` makes a sentence by adding a dot at the end of the clause.

All the constructors are commented in the file [grammar/GrammarBase.gf](grammar/GrammarBase.gf).

### Read the treebank

Toki Pona examples and corresponding parse trees can be found in [treebank.json](./treebank.json). If a feature is explained in chapter `NN`, then the corresponding entries are under ID `tplangLNN*`.

A sample entry from the treebank:

```
  {
    "en": "This is a person.",
    "gf": "UseCl (Clause (UseN Ni_W) (PredNP (UseN Jan_W)))",
    "id": "tplangL02E01",
    "tp": "ni li jan ."
  },
```

Each entry has:

- unique `id`,
- `en`: English phrase,
- `tp`: Toki Pona equivalent of the English phrase,
- `gf`: preferred parse tree for the Toke Pona phrase.

#### PU treebank

The file `./external/pu_phrases/treebank.txt` contains all the phrases from the official Toki Pona book.

## Test

The file `treebank.json` is a test fixture.  To check the conversion:

```
$ make test
```

or individually:

```
$ make test-parse
$ make test-linearize # or just test-lin
$ make test-pu-parse
```

Use a regular expression in `--grep` to check a specific example:

```
python3 utils/check_parse.py --grep "L02"
python3 utils/check_linearize.py --grep "L02"
```

## License

See [LICENSE.md](./LICENSE.md)

## Author

Oleg Parashchenko, olpa@[uucode.com](http://uucode.com/).

gf-tokipona home page: [https://github.com/olpa/gf-tokipona](https://github.com/olpa/gf-tokipona).
