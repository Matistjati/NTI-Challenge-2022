#!/usr/bin/python3

n,l,h = [int(i) for i in input().split()]

s = 0
num = 0
for i in [int(i) for i in input().split()]:
    if i >= l and i <= h:
        s+=i
        num+=1

print(s/num)