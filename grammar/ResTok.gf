resource ResTok = open Prelude in {

  oper

  Noun: Type = {s: Str} ;

  mkNoun : Str -> Noun
    = \n -> {s = n};

  Adj: Type = {s: Str} ;

  mkAdj : Str -> Adj
    = \a -> {s = a};
}
