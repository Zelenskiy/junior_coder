#include <vector>
#include <fstream>
#include <iostream>

const int16_t MAXN = 100; 

int64_t GR [MAXN][MAXN];
bool visited [MAXN];
int64_t distance [MAXN];
int64_t inf = 999999999999;
int64_t n, start; 

void Dijkstra(){
    int64_t min, index, u;
    distance[0] = inf;
    visited[0] = false;   

    for (auto i=1; i<=n; i++){
         distance[i] = inf;
         visited[i] = false;
    }
    distance[start] = 0;
    for (auto count=1; count<=n; count++){
        min = inf;
        for (auto i=1; i<=n; i++){
            if ((not visited[i]) and distance[i] <= min){
                min = distance[i];
                index = i;
            }
        }
        u = index;
        visited[u] = true;
        for (auto i=1; i<=n; i++){
            if ((not visited[i]) and (GR[u][i] != 0) and 
                (distance[u] != inf) and 
                (distance[u]+GR[u][i] < distance[i])){
                    distance[i] = distance[u]+GR[u][i];
            }                
        }         
    }
}

void ReadData(){
    using namespace std;
    int64_t m, v1, v2, weight;
    ifstream fin("input.txt");
    fin >> n >> m >> start;
    for (auto i=1; i<=m; i++){
        fin >> v1 >> v2 >> weight;
        GR[v1][v2] = weight;
        GR[v2][v1] = weight;
    }
    fin.close();
}

void WriteData(){
    std::ofstream fout("output.txt");
    for (auto i=1; i<=n; i++){

        if (distance[i] != inf){
            fout << start << " > " << i << " > " << distance[i] << std::endl;
        } else
        {
            fout << start << " > " << i << " > " << " = no" << std::endl;
        }
    }
    fout.close();
}


int main(){
    ReadData();
    Dijkstra();
    WriteData();
    return 0;
}
