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


random.seed(int(cmdlinearg('seed')))
r = int(cmdlinearg('r'))
c = int(cmdlinearg('c'))
percent_trees = float(cmdlinearg('percent_trees'))

print(r,c)

grid = [['.' for i in range(c)] for j in range(r)]

seen = set()

for i in range(int(percent_trees*r*c)):
    while True:
        coord = (random.randint(0,r-1),random.randint(0,c-1))
        if coord not in seen:
            seen.add(coord)
            grid[coord[0]][coord[1]] = '#'
            break

for i in range(r):
    for j in range(c):
        print(grid[i][j],end="")
    print("")