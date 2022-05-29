#!/usr/bin/python3

r,c = [int(i) for i in input().split()]

start = []
goal = []
for i in range(r):
    start.append(input())
for i in range(r):
    goal.append(input())

differences = 0
for i in range(r):
    for j in range(c):
        if start[i][j] != goal[i][j]:
            differences += 1

print(differences)
