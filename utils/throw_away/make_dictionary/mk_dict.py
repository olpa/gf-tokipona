"""
TPgrammar is taken from
http://zach.tomaszewski.name/uh/ics661/source/
"""

inf = 'TPgrammar.txt'

def load_words(l):
    (_, all_words) = l.split('->')
    words = all_words.split('|')
    return [w.strip() for w in words]

with open(inf) as h:
    for l in h:
        if l.startswith('V -'):
            V = load_words(l)
        elif l.startswith('N_'):
            N = load_words(l)
        elif l.startswith('Mod'):
            A = load_words(l)
        elif l.startswith('Prep'):
            P = load_words(l)
        elif l.startswith('Inter'):
            I = load_words(l)

N.remove('Name')
I.remove('a a')
I.remove('a a a')

for_out = [
        ['N', N],
        ['V', V],
        ['A', A],
        ['Prep', P],
        ['Interj', I],
        ]

def loop_over_data(on_word):
    for [class_, words] in for_out:
        suffix = class_
        if suffix == 'Interj':
            suffix = 'Ij'
        words.sort()
        for word in words:
            on_word(word, suffix, class_)
        print()

def declare(word, suffix, class_):
    print('    {}_{} : {} ;'.format(word.capitalize(), suffix, class_))

loop_over_data(declare)

def define(word, suffix, class_):
    print('    {}_{} = mk{} "{}" ;'.format(word.capitalize(), suffix, suffix, word))

loop_over_data(define)
