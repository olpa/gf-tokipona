resource ParadigmsTok = MiniatureGrammarTok [N, V, A] **
  open ResTok, MiniatureGrammarTok, Prelude in {

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

}
