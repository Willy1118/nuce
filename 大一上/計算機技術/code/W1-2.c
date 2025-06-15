#include<stdio.h>
#include<stdlib.h>
int main()
{
	int num;
	
	printf("please input a positive number integer:");
	scanf("%d",&num);
	
	if(num<=0) printf("%d is not a positive integer",num);
	
	else if ( num>=1 && num<=9 ) printf("%d is a small integer",num);
	
	else if ( num>=10 && num<=99 ) 
	{
		printf("%d 的十位數是 %d\n",num,num/10);
		printf("%d 的個位數是 %d",num,num%10);
	}
	
	else 
	{
		printf("%d is a large integer\n",num);
		
		if( num%5 == 0 ) printf("%d is divisible by 5",num);
		
		else if( num%5 == 1 ) printf("%d+5=%d",num,num+5);
		
		else if( num%5 == 2 ) printf("%d-5=%d",num,num-5);
		
		else if( num%5 == 3 ) printf("%d*5=%d",num,num*5);
		
		else printf("%d/5=%.2f",num,(float)num/5); 
	}
	
	return 0;
} 
