#!/usr/bin/python3

n = int(input())

points = [[int(i) for i in input().split()] for j in range(n)]

ans = 0
for i in range(1,n):
    ans += abs(points[i][0]-points[i-1][0])+abs(points[i][1]-points[i-1][1])

print(ans)