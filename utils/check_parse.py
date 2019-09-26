import sys
from check_common import load_treebank, collect_tp_gf, run_gf_and_parse_output, check_expected_vs_result

def prepare_for_parse(i2tp):
    i2c = {}
    for (id_, tp) in i2tp.items():
        i2c[id_] = 'parse "%s"' % tp
    return i2c

jtb = load_treebank()
(i2tp, i2gf) = collect_tp_gf(jtb)
cmds = prepare_for_parse(i2tp)
i2r = run_gf_and_parse_output(cmds)
nerr = check_expected_vs_result(i2gf, i2r)
sys.exit(nerr)
