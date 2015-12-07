#include <stdio.h>

int main(){

	int j = 0;

	for(int i = 0; i < 4096; i++)
		j++;

	printf("j = %d\n", j);

	return 1;
}
