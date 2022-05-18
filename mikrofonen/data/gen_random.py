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
n = int(cmdlinearg('n'))
l = int(cmdlinearg('l'))
h = int(cmdlinearg('h'))
within = int(cmdlinearg('within'))

print(n,l,h)

nums = [int((l+h)/2)]

length = (h-l)
if within:
    length = 0

while len(nums)<n:
    nums.append(random.randint(l-length,h+length))

for i in nums:
    print(i, end=" ")
print("")