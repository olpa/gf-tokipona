abstract TokiponaAbs = {
  flags startcat = Cl;
  cat
    A; S; Cl; Subject; Predicate; N;
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
    Telo_N: N;
    Tomo_N: N;

    Lili_A: A;
    Pona_A: A;
    Suli_A: A;
}
