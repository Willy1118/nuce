#include<stdio.h>
#include<stdlib.h>
int main()
{
	int score1,score2;
	char name[10],dep;
	float average;
	
	printf("please input your name.... ");
	scanf("%s%*c",name);
	
	printf("please select your department....(a:資工 b:電機 c:電子)");
	scanf("%c%*c",&dep);
	
	printf("please input your score on test1....");
	scanf("%d",&score1);
	
	printf("please input your score on test2....");
	scanf("%d",&score2);
	
	average = ((float)score1+score2)/2;
	
	printf("|----------|----------|------|------|-------|\n");
	printf("|   Name   |Department|Test 1|Test 2|Average|\n");
	printf("|----------|----------|------|------|-------|\n");
	printf("|%-10s|%-10c|%6d|%6d|%7.2f|\n",name,dep,score1,score2,average);
	printf("|----------|----------|------|------|-------|\n");
	
	return 0;
}
