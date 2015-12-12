#include <stdio.h>

int func(int l, int o){

	int k = 0;
	int m = 0;
	int i = 0;
	int j = 0;

	for(i = 0; i<l; i++){
		for(j = 0; j<o; j++)
			k++;
		m++;
	}
	return m;
}
