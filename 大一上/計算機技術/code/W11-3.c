#include<stdio.h>

int main()
{
	int people, first, second ,third, forth, count=0, cost, min=0;
	int new_first, new_second, new_third, new_forth;

	printf("人數:");
	scanf("%d",&people);

	first = people/4 + 1;
	second = people/7 + 1;
	third = people/13 + 1;
	forth = people/16 + 1;

	//printf("%d",first);
	for(int a=0 ; a<=first ; a++)
	{
		for(int b=0 ; b<=second ; b++)
		{
			for(int c=0 ; c<=third ; c++)
			{
				for(int d=0 ; d<=forth ; d++)
				{
					if(a*4+b*7+c*13+d*16 >= people)
					{
						count += 1;
						cost = a*2500 + b*3800 + c*6400 + d*7500;
						//printf("a=%d b=%d c=%d d=%d cost=%d\n",a,b,c,d,cost);
						//printf("%d %d ",min,cost);
						if(count == 1) 
						{
							min=cost;
							new_first = a;
							new_second = b;
							new_third = c;
							new_forth = d;
						}
						else if(cost<min)
						{
							//printf("in\n");
							min=cost;
							new_first = a;
							new_second = b;
							new_third = c;
							new_forth = d;
						}						
					}
				}
			}
		}
	}
	printf("最少需要 %d 元\n",min);
	printf("四門車房 %d 台\n",new_first);
	printf("商務休旅車 %d 台\n",new_second);
	printf("小型巴士 %d 台\n",new_third);
	printf("中型巴士 %d 台",new_forth);

	return 0;
}