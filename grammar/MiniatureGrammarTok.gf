concrete MiniatureGrammarTok of MiniatureGrammar = open ResTok, Prelude in {
  lincat
    S = {s: Str} ;
    NP = {s: Str; isPronomen: Bool} ;
    VP = {s: Str} ;
    AP = {s: Str} ;
  lin
    UseCl cl = {s = cl.s ++ "." } ;
    UseN n = {s = n.s; isPronomen = False};
    UseA a = {s = a.s};

    PredNP np1 np2 = {s = np1.s
      ++ (table { True => []; _ => "li" } ! np1.isPronomen)
      ++ np2.s} ;
    PredAP np ap = {s = np.s
      ++ (table { True => []; _ => "li" } ! np.isPronomen)
      ++ ap.s} ;

    AdjNP ap np = {s = np.s ++ ap.s; isPronomen = False} ;
    AdjnpNP anp np = {s = np.s ++ anp.s; isPronomen = False} ;
    Mi_Pron = {s = "mi"; isPronomen = True} ;
    Sina_Pron = {s = "sina"; isPronomen = True} ;
}
