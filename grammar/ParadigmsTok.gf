resource ParadigmsTok = MiniatureGrammarTok [N, V, A] **
  open ResTok, MiniatureGrammarTok, Prelude in {

oper

  mkN : Str -> N
    = \n -> lin N (mkNoun n) ;

  mkA : Str -> Adj
    = \a -> lin Adj (mkAdj a) ;

}
