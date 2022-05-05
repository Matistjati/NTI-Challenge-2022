#!/usr/bin/python3

n,m = [int(i) for i in input().split()]

controls = sorted([int(i) for i in input().split()])
sources = sorted([int(i) for i in input().split()])

ans = [[-1,int(2e9)] for i in range(n)]

i = 0
j = 0


# To the right
while True:
    #print(i,j)
    if controls[i]<=sources[j]:
        if abs(controls[i]-sources[j])<ans[i][1]:
            ans[i] = [j,abs(controls[i]-sources[j])]

        
        i+=1
        if i >= n:
            break
    else:
        j+=1
        if j>=m:
            break

    
i = 0
j = 0

# To the left
while True:
    #print(i,j)
    if controls[i]>=sources[j]:
        if abs(controls[i]-sources[j])<ans[i][1]:
            ans[i] = [j,abs(controls[i]-sources[j])]

        
        j+=1
        if j >= m:
            break
        
    else:
        i+=1
        if i>=n:
            break


for i in range(n):
    print(ans[i][0], end=" ")
print("")

