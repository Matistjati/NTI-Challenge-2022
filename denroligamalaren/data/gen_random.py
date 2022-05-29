#!/usr/bin/python3


import sys
import random
import math
import copy

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    if default is None:
        print("missing parameter", name)
        exit(1)
    return default

alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z','A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

random.seed(int(cmdlinearg('seed')))
r = int(cmdlinearg('r'))
c = int(cmdlinearg('c'))
two_chars = int(cmdlinearg('two_chars'))
error_rate = float(cmdlinearg('error_rate'))

if two_chars:
    alphabet = ['.', '#']

print(r,c)

start = []
for i in range(r):
    row = []
    for j in range(c):
        row.append(random.choice(alphabet))
        print(row[j],end="")
    print("")
    start.append(row)

seen = set()

goal = copy.deepcopy(start)

for i in range(int(error_rate*r*c)):
    while True:
        coord = (random.randint(0,r-1),random.randint(0,c-1))
        if coord not in seen:
            seen.add(coord)
            goal[coord[0]][coord[1]] = random.choice(alphabet)
            break

for i in range(r):
    for j in range(c):
        print(goal[i][j],end="")
    print("")