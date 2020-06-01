resource Paradigms = Grammar **
  open Resources in {

oper

  mkW : Str -> W
    = \w -> lin W (mkWord w) ;

  mkPrep : Str -> Prep
    = \p -> lin Prep (mkPreposition p) ;

  mkIj : Str -> Interj
    = \i -> lin Interj (mkInterjection i) ;

  mkNum : Str -> Num
    = \n -> lin Num (mkNumber n) ;

  mkPreV : Str -> preVerb
    = \pv -> lin preVerb (mkPreVerb pv) ;

}
