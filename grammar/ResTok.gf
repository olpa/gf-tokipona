resource ResTok = open Prelude in {

  oper

  Noun: Type = {s: Str} ;

  mkNoun : Str -> Noun
    = \n -> {s = n};

  Adj: Type = {s: Str} ;

  mkAdj : Str -> Adj
    = \a -> {s = a};

  Verb: Type = {s: Str} ;

  mkVerb : Str -> Verb
    = \v -> {s = v};

  Preposition: Type = {s: Str} ;

  mkPreposition : Str -> Preposition
    = \p -> {s = p} ;

  Interjection: Type = {s:  Str} ;

  mkInterjection : Str -> Interjection
    = \i -> {s = i} ;

  Number: Type = {s: Str} ;

  mkNumber : Str -> Number
    = \n -> {s = n} ;

  preVerb: Type = {s: Str} ;

  mkPreVerb : Str -> preVerb
    = \pv -> {s = pv };
}
