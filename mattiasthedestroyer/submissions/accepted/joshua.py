#!/usr/bin/python3

s,b,k = [int(i) for i in input().split()]

print("Destroyed!" if s*b/60>=k else "Spared for now...")
