def Floyd(v, D):
    for k in range(0, v):
        for i in range(0, v):
            for j in range(0, v):
                if (D[i][k] != 0) and (D[k][j] != 0) and (i != j):
                    if (D[i][k]+D[k][j] < D[i][j]) or (D[i][j] == 0):
                        D[i][j] = D[i][k] + D[k][j]
    return v, D


def ReadData():
    f = open('input.txt', 'r')
    l = [line.strip() for line in f]
    v = int(l[0])
    D=[]
    for i in range(1, v+1):
        print (l[i])
        sD=[]
        v1, v2, v3 = map(int, l[i].split())
        sD.append(v1)
        sD.append(v2)
        sD.append(v3)
        D.append(sD)       
    f.close
    return v,  D
    

def WriteData(v, D):
    f = open('output.txt', 'w')
    for i in range(0, v):
        for j in range(0, v):
            f.write(str(D[i][j])+" ")
        f.write('\n')
    f.close


# main block
v, D = ReadData()
v, D = Floyd(v, D)
WriteData(v, D)
