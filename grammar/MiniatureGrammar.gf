abstract MiniatureGrammar = {

  flags startcat = S;

  cat
    S ; Cl ; NP ; VP ; AP ; CN ;
    Det ; N ; A ; V ; V2 ; AdA ;
    Prep ; Interj ; Num ;
  fun
    UseCl   : Cl -> S ;
    QuestUseCl   : Cl -> S ;
    ExclUseCl    : Cl -> S ;
    PredVP  : NP -> VP -> Cl ;
    PredNP  : NP -> NP -> Cl ;
    PredAP  : NP -> AP -> Cl ;
    ComplV  : VP -> NP -> VP ;
    PrepCl  : Cl -> Prep -> NP -> Cl ;
    PrepNP  : NP -> Prep -> NP -> Cl ;
    AnuCl   : Cl -> Cl ;
    DetCN   : Det -> CN -> NP ;
    AdjCN   : CN -> AP -> CN ;
    AdjNP   : NP -> AP -> NP ;
    AdjAP   : AP -> AP -> AP ;
    AdjVP   : VP -> AP -> VP ;
    AdjnpNP : NP -> NP -> NP ;
    CompAP  : AP -> VP ;
    AdAP    : AdA -> AP -> AP ;

    UseV : V -> VP ;
    UseN : N -> NP ;
    UseA : A -> AP ;
    QuestV : V -> VP ;

    AnswerYes : V -> S ;
    AnswerNo : V -> S ;
    AnswerAla : S ;

    a_Det, every_Det, the_Det : Det ;
    this_Det, these_Det : Det ;
    that_Det, those_Det : Det ;
    Mi_Pron, Sina_Pron, Ona_Pron : NP ;
    very_AdA : AdA ;

    IjAlone : Interj -> Cl ;
    IjExt   : Interj -> Interj -> Interj ;
    IjCl    : Cl -> Interj -> Cl ;
    IjNP    : NP -> Interj -> NP ;

    AddressCl : NP -> Cl -> Cl ;
    CommandVP : VP -> Cl ;
    CommandPredVP : NP -> VP -> Cl ;
    Greeting : NP -> Cl ;

    PiNP : NP -> NP -> NP ;

    GrowNum : Num -> Num -> Num ;
    NumberNP : Num -> NP ;
    NumberAP : Num -> AP ;

  -- coordination
  cat Conj ;
  fun
    ConjS  : Conj -> S -> S -> S ;
    ConjNP : Conj -> NP -> NP -> NP ;
    and_Conj, or_Conj : Conj ;
}
