#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct ponto {
    int x;
    int y;
}Ponto;

float hipo(Ponto *a, Ponto *b);

int main() {
	
	int n;
	
	Ponto *pontos = (Ponto *) calloc(10000, sizeof(Ponto));

	while(1) {

		scanf("%d", &n);

		if(n == 0) break;

		for(int i = 0; i<n; i++) {
			scanf("%d %d", &pontos[i].x, &pontos[i].y);
		}
		
		float minDist = 10000.0;
		for(int i = 1; i < n-1; i++) {
			for(int j = i + 1; j < n; j++) {
				Ponto *p = &pontos[i];
				Ponto *q = &pontos[j];

				if(hipo(p, q) < minDist) {
					minDist = hipo(p, q);
				}
			}
		}

		if(minDist < 10000.0) {
			printf("%.4f\n", minDist);
		}
		else {
			printf("INFINITY\n");
		}
	}
	
    return 0;
}

//Calcula distancia entre dois pontos
float hipo(Ponto *a, Ponto *b) {
	int x = b->x - a->x;
	int y = b->y - a->y;
	
	float dis = sqrt( ( powf((float)x, 2.0) + powf((float)y, 2.0) ) );
	return dis;
}


