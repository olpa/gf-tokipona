abstract MiniatureGrammar = {

  flags startcat = S;

  cat
    S ; Cl ; NP ; VP ; AP ; CN ;
    Det ; N ; A ; V ; V2 ; AdA ; Tense ;
  fun
    UseCl   : Tense -> Cl -> S ;
    PredVP  : NP -> VP -> Cl ;
    ComplV2 : V2 -> NP -> VP ;
    DetCN   : Det -> CN -> NP ;
    AdjCN   : AP -> CN -> CN ;
    CompAP  : AP -> VP ;
    AdAP    : AdA -> AP -> AP ;

    UseV : V -> VP ;
    UseN : N -> NP ;
    UseA : A -> AP ;

    Pres, Perf : Tense ;

    a_Det, every_Det, the_Det : Det ;
    this_Det, these_Det : Det ;
    that_Det, those_Det : Det ;
    i_NP, she_NP, we_NP : NP ;
    very_AdA : AdA ;

  -- coordination
  cat Conj ;
  fun
    ConjS  : Conj -> S -> S -> S ;
    ConjNP : Conj -> NP -> NP -> NP ;
    and_Conj, or_Conj : Conj ;
}
