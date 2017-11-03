#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>

//waitpid的使用
int main()
{
    pid_t pid;

    if( (pid=fork()) < 0){
        printf("fork error\n");
        exit(0);
    }
    else if( pid ==0)
    {
        if( (pid=fork()) < 0){
            printf("fork error\n");
            exit(0);
        }
        else if(pid > 0){
            exit(0);
        }

        //第2个子进程 能执行的地方
        sleep(2);

        printf("second child,parent pid=%d\n", getppid());

        exit(0);


    }

    // waitpid 返回 与pid相同的 返回值 ř
    if( waitpid(pid, NULL, 0) != pid){
        printf("waitpid error\n");
        exit(0);
    }

    return 0;
}
