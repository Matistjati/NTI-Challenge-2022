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
max_s = int(cmdlinearg('s'))
max_b = int(cmdlinearg('b'))
max_k = int(cmdlinearg('k'))
b120 = int(cmdlinearg('b120'))

b = random.randint(0,max_b)
if b120:
    b = 120

print(random.randint(0,max_s), b, random.randint(0,max_k))

