abstract TokiponaAbs = {
  flags startcat = Cl;
  cat
    A; S; Cl; NP; VP; N;
  fun
    MkS: Cl -> S;
    MkCl: NP -> VP -> Cl;
    MkNP: N -> NP;
    MkNPna: N -> A -> NP;
    MkVPn: N -> VP;
    MkVPa: A -> VP;
    MkVPvpa: VP -> A -> VP;
    MkVPvpn: VP -> N -> VP;
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
    Ni_A: A;
}
