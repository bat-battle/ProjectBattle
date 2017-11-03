#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{

    pid_t pid;
    printf("start\n");

    pid = fork();

    if(pid==0){
        printf("this is child parent is %d\n",pid);
    }else{
        printf("this is parent child is %d\n",pid);
    }

    printf("end\n");

    return 0;
}
