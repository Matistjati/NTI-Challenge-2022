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
m = int(cmdlinearg('m'))
l = int(cmdlinearg('l'))
all_left = int(cmdlinearg('left'))

print(n,m)

def printdata(ppl,cookies):
    ppl = sorted(ppl)
    cookies = sorted(cookies)
    for person in ppl:
        print(person, end=" ")
    print("")
    for cookie in cookies:
        print(cookie, end=" ")
    print("")

ppl = set()
cookies = set()


# Generate lazy, answer will be 0 for every person
if all_left:
    for i in range(n):
        ppl.add(i)
    for i in range(m):
        cookies.add(n+10+i)
    printdata(ppl, cookies)
else:
    while len(ppl) < n:
        p = random.randint(0,l)
        if p not in ppl:
            ppl.add(p)
    while len(cookies) < m:
        c = random.randint(0,l)
        if not c in cookies:
            cookies.add(c)
    printdata(ppl, cookies)


