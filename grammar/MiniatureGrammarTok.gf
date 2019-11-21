concrete MiniatureGrammarTok of MiniatureGrammar = open ResTok, Prelude in {
  lincat
    S = {s: Str} ;
    NP = {s: Str} ;
    VP = {s: Str} ;
    AP = {s: Str} ;
  lin
    UseCl cl = {s = cl.s ++ "." } ;
    UseN n = {s = n.s};
    UseA a = {s = a.s};
    PredNP np1 np2 = {s = np1.s ++ "li" ++ np2.s} ;
    PredAP np ap = {s = np.s ++ "li" ++ ap.s} ;
    AdjNP ap np = {s = np.s ++ ap.s} ;
    AdjnpNP anp np = {s = np.s ++ anp.s} ;
    Mi_Pron = {s = "mi"} ;
    Sina_Pron = {s = "sina"} ;
}
