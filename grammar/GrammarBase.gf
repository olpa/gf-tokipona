abstract GrammarBase = {
  flags startcat = S;
  cat
    S ; Cl ; Fragment ;
    NP ; VP ; A ; PrepP ;
    W ; PreV ; Prep ; Interj ; Num ; Pred ; PredInfix ;
  fun

    --
    -- A comments with prefix `PU` is a cite
    -- from the official Toki Pona book.
    --

    --
    -- A clause. Not exaclty:
    --
    --PU-- To build a simple sentence in TokiPona, follow the model:
    --PU--   NOUN + `li` + NOUN
    --
    -- Instead: in the grammar, a clause is:
    --
    --   NP (noun phrase) + `li` + Predicate
    --
    -- For example,
    --   "ni li jan"
    -- is
    --   (Clause (UseN Ni_W) (PredNP (UseN Jan_W)))
    --
    Clause : NP -> Pred -> Cl ;
    UseN : W -> NP ;
    PredNP : NP -> Pred ;

    --
    -- An adjective.
    --
    --PU-- An adjective is a word that describes a noun.
    --PU-- An adjective can also be added after a noun to describe it.

    UseA : W -> A ;
    AdjNP : NP -> A -> NP ;

    --
    -- Not:
    --
    --PU-- This can be a complete sentence:
    --PU--   NOUN + li + ADJECTIVE
    --
    -- Instead: in the grammar, there are no adjective predicates.
    --
    -- The reason is that a Tokipona word can be anything:
    -- an adjective, a noun or a verb. Consider the phrase:
    --
    --   mi sona.
    --
    -- A translation can be:
    --
    --   I am knowledge
    --   I am wise
    --   I know
    --
    -- To avoid a combinatoric explosure of parses, the rule is that
    -- the predicate is always a noun phrase (unless definitely not).
    --

    --
    -- Not:
    --
    --PU-- A second noun can also fill the role of the adjective.
    --PU-- This is similar to using the word 'of' in English.
    --
    -- Skip it to avoid combinatoric explosure.
    --

    --
    --PU-- The particle 'pi' is used to divide a second noun group
    --PU-- that describes a first noun group.
    --
    PiNP : NP -> NP -> NP ;

    --
    --PU-- An adjective can also be used directly after a verb
    --PU-- to modify it.
    --
    UseV : W -> VP ;
    AdjVP : VP -> A -> VP ;

    --
    -- Not exactly:
    --
    --PU-- An adjective can also modify another adjective.
    --
    -- In the grammar:
    --
    -- An adjective can be added to a noun phrase or to a verb phrase
    -- and then another adjective can be added as well.
    --

    --
    --PU-- The words 'mi' ('me, we') and 'sina' ('you') are special.
    --PU-- When 'mi' or 'sina' is used alone as the subject,
    --PU-- no 'li' is used after it.
    --
    Mi_Pron : NP ;
    Sina_Pron : NP ;
    Ona_Pron : NP ;

    --
    --PU-- To form a sentence with a verb, follow this model:
    --PU--   NOUN + li + VERB + e + NOUN
    --
    -- Not:
    --
    --PU-- You can omit the object of a verb.
    --
    -- Skip it to avoid combinatoric explosure.
    --
    ComplV : VP -> NP -> Pred ;

    --
    --PU-- A pre-verb can be added before a main verb
    --
    WithPreV : W -> PreV -> VP ;

    --
    -- A clause can have several predicated
    --
    -- To simplify the grammar, it is convenient to represent
    -- prepositions and `ala`/`anu` constructions as predicates.
    --
    PredL : Pred -> PredInfix -> Pred -> Pred ;
    PredPrepL : Pred -> PrepP -> Pred ;

    PredInfixNot : PredInfix ; -- ala
    PredInfixOr : PredInfix ; -- anu
    PredInfixAnd : PredInfix ; -- li
    PredInfixCAnd : PredInfix ; -- , li
    PredPrep : PrepP -> Pred ;

    --
    --PU-- There are two ways to ask a yes-or-no question.
    --PU-- The first is to add the phrase 'anu seme' at the end.
    --
    --PU-- The other way is to repeat the word being
    --PU-- used as a verb, adding 'ala' in between
    --
    -- In the grammar:
    --   something anu/ala seme
    -- represented as a predicate list:
    --   (Predicate for something) PredInfixAnu (Predicate for seme)
    --   (Predicate for something) PredInfixAla (Predicate for the verb)
    --

    --
    --PU-- To reply 'yes', repeat the verb.
    --PU-- To reply 'no', repeat the verb with 'ala'
    --PU-- or use 'ala' alone
    --
    ClausePred : Pred -> Cl ;

    --
    --PU-- `anu` can be used as `or` for noun phrases.
    --PU-- It is not described in the book, but seen in examples
    --
    OrNP : NP -> NP -> NP ;

    --
    --PU-- Prepositions often introduce a new noun.
    --
    ComplPrep : Prep -> NP -> PrepP ;
    UsePrep: Prep -> PrepP ;
    --
    --PU-- A preposition can be used at the end of a sentence.
    --
    --PU-- A sentence can also use a preposition
    --PU-- without a regular verb.
    --
    -- Grammer: Use `ClausePred`

    --
    --PU-- Proper names behave as adjectives.
    --PU-- Use them after a noun that describes what they are.
    --
    -- To mark a word as name, prefix it with 'Nimi':
    -- 'ma tomo Nimi Isanpu' is 'Istanbul'.
    --
    Name : String -> A ;
    NameNP : String -> NP ;

    --
    --PU-- To greet someone.
    --PU-- Greetings are often not complete sentences.
    --
    -- Grammar: Use `ClausePred`
    --

    --
    --PU-- The particle 'a' adds emothion or emphasis.
    --PU-- It can be used:
    --PU--
    --PU-- 1. alone,
    --
    IjAlone : Interj -> Cl ;

    --
    --PU-- 2. at the end of a sentence
    --
    PostfixIjCl : Cl -> Interj -> Cl ;

    --
    --PU-- 3. at the end of a noun phrase
    --
    IjNP : NP -> Interj -> NP ;

    --
    -- Not mentioned in the grammar, but used in examples:
    -- . several interjections in a raw
    -- . interjection at the beginning of a sentence
    --
    IjExt : Interj -> Interj -> Interj ;
    PrefixIjCl : Cl -> Interj -> Cl ;

    --
    --PU-- The particle 'o' has three uses:
    --PU-- 1. after a noun phrase to show who is being called
    --PU--    addressed,
    --
    Vocative : NP -> Fragment ;

    --
    --PU-- 2. before a verb to express a command or request,
    --
    Command : Pred -> Cl ;

    --
    --PU-- 3. after the subject (and replacing 'li') to express
    --PU--    a wish or desire.
    --
    Wish : NP -> Pred -> Cl ;

    --
    --PU-- The simplest number system uses five basic adjectives.
    --PU-- Add them one after another.
    --
    GrowNum : Num -> Num -> Num ;
    Number : Num -> A ;

    --
    --PU-- For ordinal numbers, add the particle 'nanpa' before
    --PU-- the number.
    --
    OrdinalNP : Num -> NP ;
    OrdinalA : Num -> A ;

    --
    --PU-- The particle 'la' allows to link two sentences,
    --PU-- or link a fragment to a sentence.
    --
    FragmentNP : NP -> Fragment ;
    FragmentVP : VP -> Fragment ;
    FragmentCl : Cl -> Fragment ;
    WithContext : Cl -> Fragment -> Cl ;
    --
    -- Versions with different context separators
    --
    WithContextC : Cl -> Fragment -> Cl   ; -- ','
    WithContextCLa : Cl -> Fragment -> Cl ; -- ', la'
    WithContextSc : Cl -> Fragment -> Cl  ; -- ':'

    --
    --PU-- There are many ways to translate 'and'
    --PU-- 1. Join multiple subjects with 'en'
    --
    AndNP : NP -> NP -> NP;

    --
    --PU-- 2. Join multiple verbs by repeating 'li'
    --
    -- Use `PredInfixAnd`

    --
    --PU-- 3. Join multiple direct objects by repeating 'e'
    --
    AndComplNP : NP -> NP -> NP ;

    --
    -- To build a sentence, add '.', '?' or '!' to a clause.
    --
    UseCl : Cl -> S ;
    QuestUseCl : Cl -> S ;
    ExclUseCl : Cl -> S ;
}
