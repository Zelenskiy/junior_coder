#include <fstream>
#include <iostream>

const int16_t MAXN = 100; 

int64_t D[MAXN][MAXN];
int64_t V; 

//алгоритм Флойда-Воршелла
void FU()
{
	for (int64_t i=0; i<V; i++) D[i][i]=0; 
	for (int64_t k=0; k<V; k++)
		for (int64_t i=0; i<V; i++)
			for (int64_t j=0; j<V; j++)
				if (D[i][k] && D[k][j] && i!=j)
					if (D[i][k]+D[k][j]<D[i][j] || D[i][j]==0)
						D[i][j]=D[i][k]+D[k][j]; 
}

void ReadData(){
    using namespace std;
    int64_t m, v1, v2, v3;
    ifstream fin("input.txt");
    fin >> V;
    for (int64_t i=1; i<=V; i++){
        fin >> v1 >> v2 >> v3;
        D[i-1][0] = v1;
        D[i-1][1] = v2;
        D[i-1][2] = v3;
    }
    fin.close();
}

void WriteData(){
    std::ofstream fout("output.txt");
    for (int64_t i=0; i<V; i++){
		for (int64_t j=0; j<V; j++){
            fout<<D[i][j]<<" ";
        }
        fout<<"\n";
    }
    fout.close();
}

//Головна функція
int main(){
    ReadData();
    FU();
    WriteData();
    return 0;
}
