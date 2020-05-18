abstract GrammarBase = {

  flags startcat = S;

  cat
    S ; Cl ; Fragment ;
    NP ; VP ; AP ; CN ; AdA ; PrepP ;
    N ; A ; V ; V2 ; PreV ; Prep ; Interj ; Num ;
  fun
    -- To build a simple sentence in TokiPona, follow the model:
    --   NOUN + li + NOUN
    UseN : N -> NP ;
    PredNP : NP -> NP -> Cl ;

    -- An adjective is a word that describes a noun.
    -- This can be a complete sentence:
    --   NOUN + li + ADJECTIVE
    UseA : A -> AP ;
    PredAP : NP -> AP -> Cl ;

    -- An adjective can also be added after a noun to describe it.
    AdjNP : NP -> AP -> NP ;
    -- A second noun can also fill the role of the adjective.
    -- This is similar to using the word 'of' in English.
    AdjnpNP : NP -> NP -> NP ;
    -- An adjective can also be used directly after a verb
    -- to modify it.
    UseV : V -> VP ;
    AdjVP : VP -> AP -> VP ;
    -- An adjective can also modify another adjective.
    AdjAP : AP -> AP -> AP ;

    -- The words 'mi' ('me, we') and 'sina' ('you') are special.
    -- When 'mi' or 'sina' is used alone as the subject,
    -- no 'li' is used after it.
    Mi_Pron : NP ;
    Sina_Pron : NP ;
    Ona_Pron : NP ;

    -- To form a sentence with a verb, follow this model:
    --   NOUN + li + VERB + e + NOUN
    -- You can omit the object of a verb.
    ComplV : VP -> NP -> VP ;
    PredVP : NP -> VP -> Cl ;

    -- There are two ways to ask a yes-or-no question.
    -- The first is to add the phrase 'anu seme' at the end.
    AnuCl : Cl -> Cl ;
    -- The other way is to repeat the word being
    -- used as a verb, adding 'ala' in between
    QuestV : V -> VP ;
    -- To reply 'yes', repeat the verb.
    AnswerYes : V -> Cl ;
    -- To reply 'no', repeat the verb with 'ala'
    -- or use 'ala' alone
    AnswerNo : V -> Cl ;
    AnswerAla : Cl ;

    -- Prepositions often introduce a new noun.
    ComplPrep : Prep -> NP -> PrepP ;
    UsePrep: Prep -> PrepP ;
    -- A preposition can be used at the end of a sentence.
    PrepCl : Cl -> PrepP -> Cl ;
    -- A sentence can also use a preposition
    -- without a regular verb.
    PrepNP : NP -> PrepP -> Cl ;

    -- Proper names behave as adjectives.
    -- Use them after a noun that describes what they are.
    -- To mark a word as name, prefix it with 'Nimi':
    -- 'ma tomo Nimi Isanpu' is 'Istanbul'.
    Name : String -> AP ;

    -- To greet someone.
    -- Greetings are often not complete sentences.
    Greeting : NP -> Cl ;

    -- The particle 'a' adds emothion or emphasis.
    -- It can be used:
    -- 1. alone,
    IjAlone : Interj -> Cl ;
    -- 2. at the end of a sentence
    PostfixIjCl : Cl -> Interj -> Cl ;
    -- 3. at the end of a noun phrase
    IjNP : NP -> Interj -> NP ;
    -- Not mentioned in the grammar, but used in examples
    IjExt : Interj -> Interj -> Interj ;
    PrefixIjCl : Cl -> Interj -> Cl ;

    -- The particle 'o' has three uses:
    -- 1. after a noun phrase to show who is being called
    --    addressed,
    AddressCl : NP -> Cl -> Cl ;
    -- 2. before a verb to express a command or request,
    CommandVP : VP -> Cl ;
    -- 3. after the subject (and replacing 'li') to express
    --    a wish or desire.
    CommandPredVP : NP -> VP -> Cl ;

    -- The particle 'pi' is used to divide a second noun group
    -- that describes a first noun group.
    PiNP : NP -> NP -> NP ;

    -- The simplest number system uses five basic adjectives.
    -- Add them one after another.
    GrowNum : Num -> Num -> Num ;
    NumberNP : Num -> NP ;
    -- For ordinal numbers, add the particle 'nanpa' before
    -- the number.
    NumberAP : Num -> AP ;

    -- A pre-verb can be added before a main verb
    WithPreV : V -> PreV -> VP ;

    -- The particle 'la' allows to link two sentences,
    -- or link a fragment to a sentence.
    FragmentNP : NP -> Fragment ;
    FragmentVP : VP -> Fragment ;
    FragmentAP : AP -> Fragment ;
    FragmentCl : Cl -> Fragment ;
    WithContextLa : Cl -> Fragment -> Cl ;
    -- Versions
    WithContextC : Cl -> Fragment -> Cl   ; -- ','
    WithContextCLa : Cl -> Fragment -> Cl ; -- ', la'
    WithContextCTaso : Cl -> Fragment -> Cl ; -- ', taso'
    WithContextSc : Cl -> Fragment -> Cl  ; -- ':'

    -- There are many ways to translate 'and'
    -- 1. Join multiple subjects with 'en'
    AndNP : NP -> NP -> NP;
    AndAP : AP -> AP -> AP;
    -- 2. Join multiple verbs by repeating 'li'
    PredAndVP : Cl -> VP -> Cl ;
    PredAndNP : Cl -> NP -> Cl ;
    PredAndAP : Cl -> AP -> Cl ;
    -- 3. Join multiple direct objects by repeating 'e'
    AndComplNP : NP -> NP -> NP ;

    -- To build a sentence, add '.', '?' or '!' to a clause.
    UseCl : Cl -> S ;
    QuestUseCl : Cl -> S ;
    ExclUseCl : Cl -> S ;
}
