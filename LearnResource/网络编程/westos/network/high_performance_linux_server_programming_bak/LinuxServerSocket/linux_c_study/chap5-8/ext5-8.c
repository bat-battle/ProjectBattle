#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>

//处理打印 状态的函数
void h_exit(int status)
{
    if(WIFEXITED(status)){
        printf("normal termination,exit status=%d \n", WEXITSTATUS(status));
    }else if(WIFSIGNALED(status)){

        printf("abnormal termination,signal number = %d %s\n", WTERMSIG(status),

        #ifdef WCOREDUMP
            WCOREDUMP(status)? ")":"(core file generated)");
        #else
            ")");
        #endif
    }
}


int main()
{
    pid_t pid;
    int status;

    if( (pid = fork()) < 0){
        printf("fork error\n");
        exit(0);
    }
    else if(pid == 0){
        exit(7);
    }


    //等待子进程
    if(wait(&status) != pid){
        printf("wait error\n");
        exit(0);
    }

    h_exit(status);

    //子进程abort 终止
    if( (pid = fork()) < 0 )
    {
        printf("fork error\n");
        exit(0);
    }else if(pid == 0){
        abort();
    }

    if(wait(&status) != pid)
    {
        printf("wait error\n");
        exit(0);
    }

    h_exit(status);

    //子进程除零终止
    if( (pid=fork()) < 0){
        printf("fork error\n");
        exit(0);
    }
    else if(pid == 0){
        status /= 0;
    }

    // 除数为0 产生 SIGFPE
    if( wait(&status) != pid){
        printf("wati error\n");
        exit(0);
    }
    h_exit(status);

    return 0;
}
