#include <stdio.h>

int main(){

	int k = 0;
	int m = 0;
	int i = 0;
	int j = 0;

	for(i = 0; i<61440; i++){
		for(j = 0; j<4096; j++)
			k++;
		m++;
	}

	printf("m = %d\n", m);

	return 1;
}
