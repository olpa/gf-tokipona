resource Paradigms = Grammar [N, V, A, IJ] **
  open Resources, Grammar in {

oper

  mkN : Str -> N
    = \n -> lin N (mkNoun n) ;

  mkA : Str -> Adj
    = \a -> lin Adj (mkAdj a) ;

  mkV : Str -> V
    = \v -> lin V (mkVerb v) ;

  mkPrep : Str -> Prep
    = \p -> lin Prep (mkPreposition p) ;

  mkIj : Str -> Interj
    = \i -> lin Interj (mkInterjection i) ;

  mkNum : Str -> Num
    = \n -> lin Num (mkNumber n) ;

  mkPreV : Str -> preVerb
    = \pv -> lin preVerb (mkPreVerb pv) ;

}
