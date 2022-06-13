#include<stdio.h>
#include<string.h>

void Encrypt(char *num);

int main()
{
    char num[501];
    scanf("%s",num);
    Encrypt(num);
    printf("%s\n",num);

    return 0;
}

void Encrypt(char *num)
{
    for(int i=0;i<strlen(num);i++)
    {
        if(i%2 == 0)
        {
            num[i] = num[i] - '0' + 'A';
        }
        else
        {
            switch(num[i])
            {
                case '0':
                    num[i] = '!';
                    break;
                case '1':
                    num[i] = '#';
                    break;
                case '2':
                    num[i] = '/';
                    break;
                case '3':
                    num[i] = '~';
                    break;
                case '4':
                    num[i] = '=';
                    break;
                case '5':
                    num[i] = '`';
                    break;
                case '6':
                    num[i] = '\\';
                    break;
                case '7':
                    num[i] = '>';
                    break;
                case '8':
                    num[i] = '.';
                    break;
                case '9':
                    num[i] = ',';
                    break;
            }
        }
    }
}