#!/usr/bin/python3

import sys

n = int(input())
b = [1 if i == 'U' else 0 for i in input()]

moves = []
parity = b[0]
for pointer in range(len(b) - 1):
    if b[pointer] != b[pointer + 1]:
        moves.append(pointer+1)
        parity = not parity
if not parity:
    moves.append(len(b))

print(len(moves))
print(" ".join([str(i) for i in moves]))