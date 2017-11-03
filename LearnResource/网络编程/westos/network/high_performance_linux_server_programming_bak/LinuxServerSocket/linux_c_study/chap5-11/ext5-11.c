/**
    进程的用户标识
        实际用户标识   运行进程的用户
        有效用户标识

        下面这个例子 设置新的用户id  到 进程 用户标识  成功返回0 失败-1

*/
#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>

int main(int argc, char* argv[])
{
    int i,ret;
    if(argc != 2)
    {
        printf("Usage %s num \n", argv[0]);
        exit(0);
    }

    i = atoi(argv[1]);

    printf("before uid = %d euid=%d\n",getuid(), geteuid());

    ret = setuid(i);

    printf("After uid=%d, euid=%d\n", getuid(), geteuid());
    printf("ret=%d\n",ret);

    exit(0);
}
