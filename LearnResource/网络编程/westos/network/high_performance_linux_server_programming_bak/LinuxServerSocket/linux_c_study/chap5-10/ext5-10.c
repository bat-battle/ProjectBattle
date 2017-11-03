#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>

// system 系统调用测试
int main()
{
    int status;

    if( (status = system("date")) < 0){
        printf("system error\n");
        exit(0);
    }

    printf("exit status %d\n",status);

    if( (status = system("nosuchcommand")) < 0){
        printf("system error\n");
        exit(0);
    }

    printf("exit status %d\n",status);


    if( (status = system("who;exit 44")) < 0){
        printf("system error\n");
        exit(0);
    }

    printf("exit status %d\n",status);


}
