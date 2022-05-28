#!/usr/bin/python3

n,t = [int(i) for i in input().split()]
words = input().split()

print(words[(t-1)%n])
