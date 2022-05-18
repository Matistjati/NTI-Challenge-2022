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
n_wrong = int(cmdlinearg('wrong'))

code = [str(random.randint(0,9)) for i in range(4)]

seen = set()
done = 0
while done < n_wrong:
    i = random.randint(0,3)
    if i not in seen:
        code[i] = '.'
        seen.add(i)
        done += 1

print("".join(code))