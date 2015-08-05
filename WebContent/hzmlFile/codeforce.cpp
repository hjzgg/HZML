#include<iostream> 
#include<cstring>
#include<cstdio>
#include<algorithm>
#define N 100005 
using namespace std;

int g[505][505];
int row[505];
int main(){
	int n, m, q;
	scanf("%d%d%d", &n, &m, &q) ;
	for(int i=1; i<=n; ++i){
		int maxN = 0;
		int cnt = 0;
		for(int j=1; j<=m; ++j){
			scanf("%d", &g[i][j]);
			if(g[i][j]==1)
				++cnt;
			else{
				if(maxN < cnt) maxN = cnt;
				cnt = 0;
			}
		}
		if(maxN < cnt) maxN = cnt;
		row[i] = maxN;
	}
	while(q--){
		int x, y;
		scanf("%d%d", &x, &y);
		g[x][y] = !g[x][y];
		int cnt = 0;
		int maxN = 0;
		for(int j=1; j<=m; ++j)
			if(g[x][j]==1)
				++cnt;
			else{ 
			 	if(maxN < cnt) maxN = cnt;
				cnt = 0; 
			} 
		if(maxN < cnt) maxN = cnt;
		row[x] = maxN;
		printf("%d\n", *max_element(row+1, row+n+1));
	}
  
	return 0; 
} 

/*

5 4 5
0 1 1 0
1 0 0 1
0 1 1 0
1 0 0 1
0 0 0 0
1 1
1 1
1 4
4 2
4 3
*/

