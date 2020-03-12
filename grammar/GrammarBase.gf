abstract GrammarBase = {

  flags startcat = S;

  cat
    S ; Cl ; Fragment ;
    NP ; VP ; AP ; CN ; AdA ;
    N ; A ; V ; V2 ; PreV ; Prep ; Interj ; Num ;
  fun
    UseCl   : Cl -> S ;
    QuestUseCl   : Cl -> S ;
    ExclUseCl    : Cl -> S ;
    PredVP  : NP -> VP -> Cl ;
    PredNP  : NP -> NP -> Cl ;
    PredAP  : NP -> AP -> Cl ;
    PredAndVP  : Cl -> VP -> Cl ;
    PredAndNP  : Cl -> NP -> Cl ;
    PredAndAP  : Cl -> AP -> Cl ;
    ComplV  : VP -> NP -> VP ;
    PrepCl  : Cl -> Prep -> NP -> Cl ;
    PrepNP  : NP -> Prep -> NP -> Cl ;
    AndNP   : NP -> NP -> NP;
    AndComplNP  : NP -> NP -> NP ;
    AndAP   : AP -> AP -> AP;
    AnuCl   : Cl -> Cl ;
    AdjNP   : NP -> AP -> NP ;
    AdjAP   : AP -> AP -> AP ;
    AdjVP   : VP -> AP -> VP ;
    AdjnpNP : NP -> NP -> NP ;

    UseV : V -> VP ;
    UseN : N -> NP ;
    UseA : A -> AP ;
    QuestV : V -> VP ;
    WithPreV : V -> PreV -> VP ;

    AnswerYes : V -> S ;
    AnswerNo : V -> S ;
    AnswerAla : S ;

    IjAlone : Interj -> Cl ;
    IjExt   : Interj -> Interj -> Interj ;
    PrefixIjCl   : Cl -> Interj -> Cl ;
    PostfixIjCl  : Cl -> Interj -> Cl ;
    IjNP    : NP -> Interj -> NP ;

    AddressCl : NP -> Cl -> Cl ;
    CommandVP : VP -> Cl ;
    CommandPredVP : NP -> VP -> Cl ;
    Greeting : NP -> Cl ;

    PiNP : NP -> NP -> NP ;

    GrowNum : Num -> Num -> Num ;
    NumberNP : Num -> NP ;
    NumberAP : Num -> AP ;

    FragmentNP : NP -> Fragment ;
    FragmentVP : VP -> Fragment ;
    FragmentAP : AP -> Fragment ;
    FragmentCl : Cl -> Fragment ;
    WithContextLa : Cl -> Fragment -> Cl ;
    WithContextCLa : Cl -> Fragment -> Cl ;
    WithContextSc : Cl -> Fragment -> Cl ;

    Mi_Pron : NP ;
    Sina_Pron : NP ;
    Ona_Pron : NP ;
}
