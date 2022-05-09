#!/usr/bin/python3


import sys
import random
import math
import copy

def uniform_magnitude(magnitude):
    nums = random.randint(0,int(1e9))
    nums /= 10**len(str(nums))
    length = random.randint(1,magnitude)
    return int(nums*(10**length))

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    if default is None:
        print("missing parameter", name)
        exit(1)
    return default


random.seed(int(cmdlinearg('seed')))
n = int(cmdlinearg('n'))
mi = int(cmdlinearg('min'))
ma = int(cmdlinearg('max'))
y0 = int(cmdlinearg("y_zero"))

print(n)


for i in range(n):
    y = random.randint(mi, ma)
    if y0:
        y = 0
    print(random.randint(mi,ma), y)


