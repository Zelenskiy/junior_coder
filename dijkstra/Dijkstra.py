def Dijkstra(n, start, GR):
    inf = 9999999999999999999
    distance = [inf]
    visited = [False]
    for i in range(1, n+1):
        distance.append(inf)
        visited.append(False)
    distance[start] = 0
    for count in range(1,n):
        min = inf
        for i in range(1, n+1):
            if (not visited[i]) and distance[i] <= min:
                min = distance[i]
                index = i
        u = index
        visited[u] = True
        for i in range(1, n+1):
            if (not visited[i]) and (GR[u][i] != 0) and (distance[u] != inf) and (distance[u]+GR[u][i] < distance[i]):
                distance[i] = distance[u]+GR[u][i]
    return n, start, distance



def ReadData():
    f = open('input.txt', 'r')
    l = [line.strip() for line in f]
    n, m, start = map(int, l[0].split())
    GR = [[0]*(n+1)]*(n+1)
    # visited = [0]+(n+1)
    for i in range(1, m+1):
        v1, v2, weight = map(int, l[i].split())
        GR[v1][v2] = weight
        GR[v2][v1] = weight
    f.close
    return n, start, GR
    

def WriteData(n, start, distance):
    inf = 9999999999999999999
    f = open('output.txt', 'w')
    for i in range(1, n+1):
        if distance[i] != inf:
            f.write(str(start) + ' > ' + str(i) + ' = ' + str(distance[i]) +'\n')
        else:
            f.write(str(start) + ' > ' + str(i) + ' = no' + '\n')
    f.write('\n')
    f.close

# main block

n, start, GR = ReadData()
n, start, distance= Dijkstra(n, start, GR)
WriteData(n, start, distance)
