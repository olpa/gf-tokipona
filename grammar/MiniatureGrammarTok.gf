concrete MiniatureGrammarTok of MiniatureGrammar = open ResTok, Prelude in {
  lincat
    S = {s: Str} ;
    NP = {s: Str; isPronomen: Bool} ;
    VP = {s: Str} ;
    AP = {s: Str} ;
  oper
    mkLi : Bool -> Str
      = \b -> table { True => []; _ => "li" } ! b ;
  lin
    UseCl cl = {s = cl.s ++ "." } ;
    UseN n = {s = n.s; isPronomen = False};
    UseA a = {s = a.s};
    UseV v = {s = v.s};

    PredNP np1 np2 = {s = np1.s
      ++ mkLi np1.isPronomen
      ++ np2.s} ;
    PredAP np ap = {s = np.s
      ++ mkLi np.isPronomen
      ++ ap.s} ;
    PredVP np vp = {s = np.s
      ++ mkLi np.isPronomen
      ++ vp.s} ;

    AdjNP ap np = {s = np.s ++ ap.s; isPronomen = False} ;
    AdjnpNP anp np = {s = np.s ++ anp.s; isPronomen = False} ;
    Mi_Pron = {s = "mi"; isPronomen = True} ;
    Sina_Pron = {s = "sina"; isPronomen = True} ;
}
