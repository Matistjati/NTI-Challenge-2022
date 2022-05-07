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
    if abs(controls[i]-sources[j])<ans[i][1]:
            ans[i] = [j,abs(controls[i]-sources[j])]
        
    if controls[i]>sources[j] and i+1<n:
        i+=1
    elif j+1<m:
        j+=1
    elif i+1<n:
        i+=1
    else:
        break

    
i = 0
j = 0

# To the left
while True:
    #print(i,j)
    if abs(controls[i]-sources[j])<ans[i][1]:
            ans[i] = [j,abs(controls[i]-sources[j])]
            
    if controls[i]<sources[j] and i+1 < n:
        i+=1
        
    elif j+1<m:
        j+=1
    elif i+1<n:
        i+=1
    else:
        break


for i in range(n):
    print(ans[i][0], end=" ")
print("")

