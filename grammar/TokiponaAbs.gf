abstract TokiponaAbs = {
  flags startcat = Cl;
  cat
    S; Cl; Subject; Predicate; N;
  fun
    MkS: Cl -> S;
    Clause: Subject -> Predicate -> Cl;
    SubjN: N -> Subject;
    PredN: N -> Predicate;
    --
    Ijo_N: N;
    Jan_N: N;
    Kili_N: N;
    Lipu_N: N;
    Meli_N: N;
    Ni_N: N;
    Soweli_N: N;
}
