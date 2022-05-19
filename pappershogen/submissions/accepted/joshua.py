#!/usr/bin/python3

import sys

n = int(input())

pile = input()

if n == 1:
    if pile[0] == 'U':
        print(0)
    else:
        print(1)
        print(1)
    sys.exit(0)

parity = pile[0]=='U'

moves = []

for i in range(1, len(pile)):
    if pile[i] != pile[i-1]:
        moves.append(i)
        parity = pile[i-1] == 'N'

if not parity:
    moves.append(len(pile))


print(len(moves))
print(" ".join([str(i) for i in moves]))