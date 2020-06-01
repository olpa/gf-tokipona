resource Resources = {

  param Bool = False | True ;

  oper

  Word: Type = {s: Str} ;

  mkWord : Str -> Word
    = \w -> {s = w};

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
