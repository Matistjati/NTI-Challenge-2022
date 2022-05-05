#!/usr/bin/python3

n,t = [int(i) for i in input().split()]
words = input().split()

index = 0
for i in range(t-1):
    index += 1
    if index == n:
        index = 0

print(words[index])
