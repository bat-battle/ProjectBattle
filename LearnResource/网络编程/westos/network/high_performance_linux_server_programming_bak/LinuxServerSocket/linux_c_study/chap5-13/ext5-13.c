#include <sys/types.h>
#include <stdio.h>

int main(int argc, char* argv[])
{
    if(argc <= 1)
    {
        fprintf(stderr,"usage: %s command [arg ...] \n",argv[0]);
        exit(1);
    }

    argv++;argc--;
    if(fork() == 0)
    {
        setpgrp();
        execvp(*argv,argv);
        printf("%s is not execute \n",*argv);
        exit(0);
    }else{
        exit(0);
    }

}
