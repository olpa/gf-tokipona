concrete Grammar of GrammarBase = open Resources in {
  lincat
    S, Cl, Fragment = {s: Str} ;
    NP = {s: Str; isPronomen: Bool} ;
    VP, A, PrepP = {s: Str} ;
    W, PreV, Prep, Interj, Num, Pred, PredInfix, VCList = {s: Str} ;
  oper
    mkLi : Bool -> Str
      = \b -> table { True => []; _ => "li" } ! b ;
  lin

    Clause np pred = {s = np.s
      ++ mkLi np.isPronomen
      ++ pred.s
      } ;
    UseN n = {s = n.s; isPronomen = False} ;
    PredNP np = {s = np.s} ;

    UseA a = {s = a.s};
    AdjNP np ap = {s = np.s ++ ap.s; isPronomen = False} ;

    PiNP np anp = {s = np.s ++ "pi" ++ anp.s; isPronomen = False} ;

    UseV v = {s = v.s};
    AdjVP vp ap = {s = vp.s ++ ap.s} ;

    Mi_Pron = {s = "mi"; isPronomen = True} ;
    Sina_Pron = {s = "sina"; isPronomen = True} ;
    Ona_Pron = {s = "ona"; isPronomen = False} ;

    ComplV vp np = {s = vp.s ++ "e" ++ np.s} ;

    WithPreV v prev = {s = prev.s ++ v.s} ;

    PredL p1 infix p2 = {s = p1.s ++ infix.s ++ p2.s} ;
    PredPrepL p1 p2 = {s = p1.s ++ p2.s} ;
    PredInfixNot = {s = "ala"} ;
    PredInfixOr = {s = "anu"} ;
    PredInfixAnd = {s = "li"} ;
    PredInfixCAnd = {s = "," ++ "li"} ;
    PredPrep p = {s = p.s} ;

    ClausePred pred = {s = pred.s} ;

    OrNP np1 np2 = {s = np1.s ++ "anu" ++ np2.s; isPronomen = False} ;

    ComplPrep pp np = {s = pp.s ++ np.s} ;
    UsePrep prep = {s = prep.s} ;

    Name lit = {s = "Nimi" ++ lit.s} ;
    NameNP lit = {s = "Nimi" ++ lit.s; isPronomen = False} ;

    IjAlone ij = {s = ij.s} ;
    PostfixIjCl cl ij = {s = cl.s ++ ij.s} ;
    IjNP np ij = {s = np.s ++ ij.s ; isPronomen = np.isPronomen} ;
    IjExt base attr = {s = base.s ++ attr.s} ;
    PrefixIjCl cl ij = {s = ij.s ++ cl.s} ;

    Vocative np = {s = np.s ++ "o"} ;
    Command pred = {s = "o" ++ pred.s} ;
    Wish np pred = {s = np.s ++ "o" ++ pred.s} ;

    GrowNum base ext = {s = base.s ++ ext.s} ;
    Number n = {s = n.s} ;
    OrdinalNP n = {s = "nanpa" ++ n.s; isPronomen = False} ;
    OrdinalA n = {s = "nanpa" ++ n.s} ;

    FragmentNP f = {s = f.s} ;
    FragmentVP f = {s = f.s} ;
    FragmentCl f = {s = f.s} ;
    WithContext cl ctx = {s = ctx.s ++ "la" ++ cl.s} ;
    WithContextCLa cl ctx = {s = ctx.s ++ "," ++ "la" ++ cl.s} ;
    WithContextC cl ctx = {s = ctx.s ++ "," ++ cl.s} ;
    WithContextSc cl ctx = {s = ctx.s ++ ":" ++ cl.s} ;

    AndNP np1 np2 = {s = np1.s ++ "en" ++ np2.s; isPronomen = False} ;

    ComplVL vp vcl = {s = vp.s ++ "e" ++ vcl.s} ;
    VCListPair np1 np2 = {s = np1.s ++ "e" ++ np2.s} ;
    VCListGrow vcl np = {s = vcl.s ++ "e" ++ np.s} ;

    UseCl cl = {s = cl.s ++ "."} ;
    ExclUseCl cl = {s = cl.s ++ "!"} ;
    QuestUseCl cl = {s = cl.s ++ "?"} ;
}
