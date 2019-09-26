import json
import os
import re
import subprocess
import sys
from io import StringIO

import common

TREEBANK_FILE_NAME = "../treebank.json"
gf_cmd = "gf"
gf_args = ["--run", "TokiponaAbs.gf", "Tokipona.gf"]
gf_env = { "GF_LIB_PATH": "../grammar" }

re_filter = None
try:
    i = sys.argv.index('--grep')
    s_filter = sys.argv[i + 1]
    re_filter = re.compile(s_filter)
except ValueError:
    pass

def grep_treebank(jtb, re_filter):
    return [j for j in jtb if re_filter.search(j["id"])]

def execute_gf(s_script):
    gf_run = [gf_cmd, *gf_args]
    use_env = os.environ.copy()
    use_env.update(gf_env)
    s_out = subprocess.check_output(
            gf_run,
            env = use_env,
            input = bytes(s_script, "utf-8"),
            )
    return s_out.decode()

def mk_script(i2c):
    scr = StringIO()
    for (cmd_id, cmd) in i2c.items():
        print('ps "# %s"' % cmd_id, file=scr)
        print(cmd, file=scr)
    return scr.getvalue()

# h: file
# output: Map(id: string, result: string[]>
def parse_gf_output(h):
    id_to_result = {}
    cur_id = None
    cur_res = None
    def commit():
        if cur_id:
            id_to_result[cur_id] = cur_res
    for s in h:
        s = s.strip()
        if not s:
            continue
        if '#' == s[0]:
            commit()
            cur_id = s[1:].strip()
            cur_res = []
            continue
        assert cur_id
        cur_res.append(s)
    commit()
    return id_to_result

def collect_field(jtb, field):
    i2f = {}
    for j in jtb:
        val = j.get(field, None)
        if val is not None:
            i2f[j["id"]] = val
    return i2f

def collect_tokipona(jtb):
    return collect_field(jtb, "tp")

def collect_parses(jtb):
    return collect_field(jtb, "gf")

def check_expected_vs_result(expected, gf):
    n_of_fails = 0
    for (test_id, expected_result) in expected.items():
        prefix = "test " + test_id
        gf_results = gf.get(test_id, None)
        if not gf_results:
            n_of_fails += 1
            print("{}: not found in gf results".format(prefix))
            continue
        if len(gf_results) != 1:
            n_of_fails += 1
            print("{}: only one gf result is supported".format(prefix))
            continue
        gf_result = gf_results[0]
        if expected_result != gf_result:
            n_of_fails += 1
            print("{}: {} expected to be {}".format(prefix, gf_result, expected_result))
            continue
        print(prefix + ": ok")
    expected_keys = set(expected.keys())
    result_keys = set(gf.keys())
    orphan_keys = result_keys.difference(expected_keys)
    for key in orphan_keys:
        n_of_fails += 1
        result = gf[key][0]
        print("test {}: {} but an expected value is not provided".format(key, result))
    return n_of_fails

def load_treebank():
    fname = os.path.dirname(__file__)
    fname = os.path.join(fname, TREEBANK_FILE_NAME)
    jtb = common.load_treebank(fname)
    if re_filter:
        jtb = grep_treebank(jtb, re_filter)
    return jtb

def collect_tp_gf(jtb):
    i2tp = collect_tokipona(jtb)
    i2gf = collect_parses(jtb)
    return (i2tp, i2gf)

def run_gf_and_parse_output(cmds):
    script = mk_script(cmds)
    gfout = execute_gf(script)
    return parse_gf_output(StringIO(gfout))
