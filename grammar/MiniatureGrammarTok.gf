concrete MiniatureGrammarTok of MiniatureGrammar = open ResTok, Prelude in {
  lincat
    S = {s: Str} ;
    NP = {s: Str} ;
    VP = {s: Str} ;
  lin
    UseCl cl = {s = cl.s ++ "." } ;
    UseN n = {s = n.s};
    PredNP np1 np2 = {s = np1.s ++ "li" ++ np2.s} ;
}
