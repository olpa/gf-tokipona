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

    -- To build a simple sentence in TokiPona, follow the model:
    --   NOUN + li + NOUN
    PredNP  : NP -> NP -> Cl ;
    -- An adjective is a word that describes a noun.
    -- This can be a complete sentence:
    --   NOUN + li + ADJECTIVE
    PredAP  : NP -> AP -> Cl ;

    -- An adjective can also be added after a noun to describe it.
    AdjNP   : NP -> AP -> NP ;
    -- A second noun can also fill the role of the adjective.
    -- This is similar to using the word 'of' in English.
    AdjnpNP : NP -> NP -> NP ;
    -- An adjective can also be used directly after a verb
    -- to modify it.
    AdjVP   : VP -> AP -> VP ;
    -- An adjective can also modify another adjective.
    AdjAP   : AP -> AP -> AP ;

    -- The words 'mi' ('me, we') and 'sina' ('you') are special.
    -- When 'mi' or 'sina' is used alone as the subject,
    -- no 'li' is used after it.
    Mi_Pron : NP ;
    Sina_Pron : NP ;
    Ona_Pron : NP ;

    -- To form a sentence with a verb, follow this model:
    --   NOUN + li + VERB + e + NOUN
    -- You can omit the object of a verb.
    ComplV  : VP -> NP -> VP ;
    PredVP  : NP -> VP -> Cl ;

    -- There are two ways to ask a yes-or-no question.
    -- The first is to add the phrase 'anu seme' at the end.
    AnuCl   : Cl -> Cl ;
    -- The other way is to repeat the word being
    -- used as a verb, adding 'ala' in between
    QuestV : V -> VP ;
    -- To reply 'yes', repeat the verb.
    AnswerYes : V -> S ;
    -- To reply 'no', repeat the verb with 'ala'
    -- or use 'ala' alone
    AnswerNo : V -> S ;
    AnswerAla : S ;

    -- Prepositions often introduce a new noun.
    -- A preposition can be used at the end of a sentence.
    PrepCl  : Cl -> Prep -> NP -> Cl ;
    -- A sentence can also use a preposition
    -- without a regular verb.
    PrepNP  : NP -> Prep -> NP -> Cl ;

    -- To greet someone.
    -- Greetings are often not complete sentences.
    Greeting : NP -> Cl ;

    -- The particle 'a' adds emothion or emphasis.
    -- It can be used:
    -- 1. alone,
    IjAlone : Interj -> Cl ;
    -- 2. at the end of a sentence, or
    PostfixIjCl  : Cl -> Interj -> Cl ;
    -- 3. at the end of a noun phrase
    IjNP    : NP -> Interj -> NP ;
    -- Not mentioned in grammar, but used in examples
    IjExt   : Interj -> Interj -> Interj ;
    PrefixIjCl   : Cl -> Interj -> Cl ;

    -- The particle 'o' has three uses:
    -- 1. after a noun phrase to show who is being called
    --    addressed,
    AddressCl : NP -> Cl -> Cl ;
    -- 2. before a verb to express a command or request,
    CommandVP : VP -> Cl ;
    -- 3. after the subject (and replacing 'li') to express
    --    a wish or desire.
    CommandPredVP : NP -> VP -> Cl ;

    PredAndVP  : Cl -> VP -> Cl ;
    PredAndNP  : Cl -> NP -> Cl ;
    PredAndAP  : Cl -> AP -> Cl ;
    AndNP   : NP -> NP -> NP;
    AndComplNP  : NP -> NP -> NP ;
    AndAP   : AP -> AP -> AP;

    UseV : V -> VP ;
    UseN : N -> NP ;
    UseA : A -> AP ;
    WithPreV : V -> PreV -> VP ;

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
}
