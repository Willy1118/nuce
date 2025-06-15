#include<stdio.h>
#include<string.h>

int value(char c)
{
    if(c == 'I') return 1;
    else if(c == 'V') return 5;
    else if(c == 'X') return 10;
    else if(c == 'L') return 50;
    else if(c == 'C') return 100;
    else if(c == 'D') return 500;
    else if(c == 'M') return 1000;
}

int main()
{
    while(1)
    {
        char Rome[7] = {'I','V','X','L','C','D','M'}, input[15];
        int Rome_numbre[7] = {1, 5, 10, 50, 100, 500, 1000}, save[4]={0};
        int len, sum=0, th=3, l=0;

        printf("請輸入1-3999之間的羅馬數字:");
        scanf("%s%*c", input);

        len=strlen(input);
        //printf("%d",len);
        
        for(int i=0 ; i<len ; i++)
        {
            sum += value(input[i]);
        }
        for(int i=0 ; i<len ; i++)
        {
            if(value(input[i]) < value(input[i+1]))
            {
                sum = sum - 2*value(input[i]);
                i=i+1;
                continue;
            }
            if(input[i] == input[i+1] && value(input[i+1]) < value(input[i+2]))
            {
                i=i+2;
                sum = sum - 4*value(input[i]);
                continue;
            }
            if(input[i] == input[i+1] && input[i+1] == input[i+2] && value(input[i+2]) < value(input[i+3]))
            {
                i=i+3;
                sum = sum - 6*value(input[i]);
                continue;
            }
        }
        printf("%d",sum);
        while(sum>0)
        {
            save[th] += sum%10;
            sum /= 10;
            th--;
        }
        //for(int i=0 ; i<4 ; i++) printf("%d",save[i]); 

        if(save[0] != 0)
            for(int i=0 ; i<save[0] ; i++)
            {
                
                l+=1;
            }
        if(save[1] != 0)
        {
            if(save[1] < 4)
                for(int i=0 ; i<save[1] ; i++)
                {
                    l++;
                    
                }    
            else if(save[1] == 4) 
            {
                
                l+=1;
            }
            else if(save[1] == 5)
            {
                l+=1;
                
            } 
            else if(save[1] >= 6 && save[1] <= 8)
            {
                l+=1;
                
                for(int i=5 ; i<save[1] ; i++)
                {
                    l+=1;
                    
                }        
            }
            else if(save[1] == 9) l+=1;
        }

        if(save[2] != 0)
        {
            if(save[2] < 4)
                for(int i=0 ; i<save[1] ; i++)
                    l+=1;
            else if(save[2] == 4) l+=1;
            else if(save[2] == 5) l+=1;
            else if(save[2] >= 6 && save[2] <= 8)
            {
                l+=1;
                for(int i=5 ; i<save[2] ; i++)
                    l+=1;
            }
            else if(save[2] == 9) l+=1;
        }

        if(save[3] != 0)
        {
            if(save[3] < 4)
                for(int i=0 ; i<save[3] ; i++)
                    l+=1;
            else if(save[3] == 4) l+=1;
            else if(save[3] == 5) l+=1;
            else if(save[3] >= 6 && save[3] <= 8)
            {
                l+=1;
                for(int i=5 ; i<save[3] ; i++)
                    l+=1;
            }
            else if(save[3] == 9) l+=1;
        }
        printf("%d",l);
    }
    
    

    return 0;
}