import re
import sys

re_split = re.compile('[.?!]+')
re_punkt = re.compile('([.?!:,])')

names = "Apu Apika Sonko Epawam Pelin Inli Kepelitepe Mosima Towano Melani Mawijo Sili Mawijo Sulu Tosi Sonko Sisikaka Lisa Kanata Ali Isale Isa Kuwin Linkan Tuki Pelu Mewika"

re_names = set([re.compile('\\b(' + name + ')\\b') for name in names.split()])

def drop_direct_speech(l):
    return l.replace('"', '')

def tokenize_punktuation(l):
    return re_punkt.sub(' \\1', l)

def mark_names(l):
    for re_name in re_names:
        l = re_name.sub('Nimi \\1', l)
    return l

def fix_typos(l):
    l = l.replace('muku li pona', 'moku li pona')
    l = l.replace('sina kamo jo', 'sina kama jo')
    return l

def convert(l):
    print('put_string "parse: {}"'.format(l.strip()))
    l = drop_direct_speech(l)
    l = tokenize_punktuation(l)
    l = fix_typos(l)
    ss = re_split.split(l)
    ps = re_split.findall(l)
    for (s, p) in zip(ss, ps):
        s = s.strip()
        if not s:
            continue
        s = mark_names(s)
        print('parse "  {} {}"'.format(s, p))

for l in sys.stdin:
    convert(l.strip())
