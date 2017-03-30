#include<stdio.h>

int getNums(char* str,int *arr)
{
    int count = 0;
    while(1) {
        int num = 0;
        if(*str >= '0' && *str <= '9') {
            num* = 10;
            num += *str - '0';
        } else if(num > 0) {
            *arr++ = num;
            ++count;
            num = 0;
        }
        if(*str=='\0') break;
        ++str;
    }
    return count;
}

int main()
{
    char * str = "sdf23432 edf354 54 dgfdg456 54678";
    int arr[10] = {0};
    int total=getNums(str, arr);
    for(int i=0; i<total; i++) {
        printf("%d\n", arr);
    }
    return 0;
}
