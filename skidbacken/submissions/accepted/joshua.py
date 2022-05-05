#!/usr/bin/python3

r,c = [int(i) for i in input().split()]

grid = []
for i in range(r):
    grid.append(input())

lanes = 0
for i in range(c):
    works = True
    for j in range(r):
        if grid[j][i] == '#':
            works = False
    
    if works:
        lanes += 1
            
print(lanes)
