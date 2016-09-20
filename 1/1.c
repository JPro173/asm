#include <stdio.h>

int main(){
	int x;
	scanf("%d", &x);
    if (x % 2 == 0){
    	printf("fuck");
    }else{
        printf("ABCTF{Wi%c%c%c%c}", 64, 65, 66, 67);
    }
	return 0;
}
