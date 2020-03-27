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


Test> linearize UseCl (PredNP Sina_Pron (AdjNP (UseN Mije_N) (UseA Sona_A)))
sina mije sona .


Test> parse "sina mije sona ."
UseCl (Greeting (AdjNP Sina_Pron (AdjAP (UseA Mije_A) (UseA Sona_A))))
...
UseCl (PredAP Sina_Pron (AdjAP (UseA Mije_A) (UseA Sona_A)))
UseCl (PredNP Sina_Pron (AdjNP (UseN Mije_N) (UseA Sona_A)))
UseCl (PredNP Sina_Pron (AdjnpNP (UseN Mije_N) (UseN Sona_N)))
```

## Explanation

### Example

Consider the following parse tree:

```
UseCl (PredNP
          Sina_Pron
          (AdjNP (UseN Mije_N) (UseA Sona_A)))
```

The book says: "to build a simple sentence in Toki Pona, follow the model: NOUN + li + NOUN". The corresponding constructor is `PredNP np1 np2` where `np1` and `np2` are two noun phrases.

The first noun phrase is the pronomen "sina".

The second noun phrase is given by the constructor `AdjNP np adj`, which implements this rule: "an adjective can also be added after a noun to describe it".

The constructor `UseCl cl` makes a sentence by adding a dot at the end of the clause.

All the constructors are commented in the file [grammar/GrammarBase.gf](grammar/GrammarBase.gf).

### Read the treebank

Toki Pona examples and corresponding parse trees can be found in [treebank.json](./treebank.json). If a feature is explained in chapter `NN`, then the corresponding entries are under ID `tplangLNN*`.

A sample entry from the treebank:

```
  {
    "en": "This is a person.",
    "gf": "UseCl (PredNP (UseN Ni_N) (UseN Jan_N))",
    "id": "tplangL02E01",
    "tp": "ni li jan ."
  },
```

Each entry has:

- unique `id`,
- `en`: English phrase,
- `tp`: Toki Pona equivalent of the English phrase,
- `gf`: preferred parse tree for the Toke Pona phrase.

## Test

The file `treebank.json` is a test fixture.  To check the conversion:

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

## License

See [LICENSE.md](./LICENSE.md)

## Author

Oleg Parashchenko, olpa@[uucode.com](http://uucode.com/).

gf-tokipona home page: [https://github.com/olpa/gf-tokipona](https://github.com/olpa/gf-tokipona).
