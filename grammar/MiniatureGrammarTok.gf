concrete MiniatureGrammarTok of MiniatureGrammar = open ResTok, Prelude in {
  lincat
    S = {s: Str} ;
    NP = {s: Str; isPronomen: Bool} ;
    VP = {s: Str} ;
    AP = {s: Str} ;
    IJ = {s: Str} ;
  oper
    mkLi : Bool -> Str
      = \b -> table { True => []; _ => "li" } ! b ;
  lin
    UseCl cl = {s = cl.s ++ "."} ;
    ExclUseCl cl = {s = cl.s ++ "!"} ;
    QuestUseCl cl = {s = cl.s ++ "?"} ;
    AnuCl cl = {s = cl.s ++ "anu" ++ "seme"} ;
    UseN n = {s = n.s; isPronomen = False} ;
    UseA a = {s = a.s};
    UseV v = {s = v.s};
    QuestV v = {s = v.s ++ "ala" ++ v.s} ;

    PredNP np1 np2 = {s = np1.s
      ++ mkLi np1.isPronomen
      ++ np2.s} ;
    PredAP np ap = {s = np.s
      ++ mkLi np.isPronomen
      ++ ap.s} ;
    PredVP np vp = {s = np.s
      ++ mkLi np.isPronomen
      ++ vp.s} ;

    ComplV vp np = {s = vp.s ++ "e" ++ np.s} ;

    AnswerYes v = {s = v.s ++ "."} ;
    AnswerNo v = {s = v.s ++ "ala" ++ "."} ;
    AnswerAla = {s = "ala" ++ "."} ;

    AdjAP apBase ap = {s = apBase.s ++ ap.s} ;
    AdjVP vp ap = {s = vp.s ++ ap.s} ;
    AdjNP np ap = {s = np.s ++ ap.s; isPronomen = False} ;
    AdjnpNP np anp = {s = np.s ++ anp.s; isPronomen = False} ;
    Mi_Pron = {s = "mi"; isPronomen = True} ;
    Sina_Pron = {s = "sina"; isPronomen = True} ;
    Ona_Pron = {s = "ona"; isPronomen = False} ;

    PrepCl cl prep np = {s = cl.s ++ prep.s ++ np.s} ;
    PrepNP np prep prepNp = {s = np.s
      ++ mkLi np.isPronomen ++ prep.s ++ prepNp.s} ;

    IjAlone ij = {s = ij.s} ;
    IjExt base attr = {s = base.s ++ attr.s} ;
    IjCl cl ij = {s = cl.s ++ ij.s} ;
    IjNP np ij = {s = np.s ++ ij.s ; isPronomen = np.isPronomen} ;

    AddressCl np cl = {s = np.s ++ "o" ++ "," ++ cl.s} ;
    CommandVP vp = {s = "o" ++ vp.s} ;
    CommandPredVP np vp = {s = np.s ++ "o" ++ vp.s} ;
    Greeting np = {s = np.s} ;

    PiNP np anp = {s = np.s ++ "pi" ++ anp.s; isPronomen = False} ;

    GrowNum base ext = {s = base.s ++ ext.s} ;
    NumberNP n = {s = n.s; isPronomen = False} ;
    NumberAP n = {s = "nanpa" ++ n.s} ;

    WithPreV v prev = {s = prev.s ++ v.s} ;

    FragmentNP f = {s = f.s} ;
    FragmentVP f = {s = f.s} ;
    FragmentAP f = {s = f.s} ;
    FragmentCl f = {s = f.s} ;
    WithContextLa cl ctx = {s = ctx.s ++ "la" ++ cl.s} ;
    WithContextCLa cl ctx = {s = ctx.s ++ "," ++ "la" ++ cl.s} ;
}
