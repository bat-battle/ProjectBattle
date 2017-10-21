/*************************************************************************
	> File Name: forkDemo.c
	> Author: 
	> Mail: 
	> Created Time: 六 11/26 20:49:11 2016
 ************************************************************************/
#include <unistd.h>  
#include <sys/types.h>
#include <stdio.h>   
#include<stdlib.h>

int fork0()   
{   
    pid_t fpid; //fpid表示fork函数返回的值  
    int count=0;  
//    printf("only in father......????\n");
    fpid=fork();   
    printf("only in father......????\n");
    if (fpid < 0)   
        printf("error in fork!");   
    else if (fpid == 0) {  
        printf("i am the child process, my process id is %d \n",getpid());   
        printf("我是爹的儿子\n"); 
        count++;  
        exit(0);
    }  
    else {  
        printf("i am the parent process, my process id is %d\n",getpid());   
        printf("我是孩子他爹\n");  
        count++;  
    }  
    printf("统计结果是: %d\n",count);  
    int tag = wait(fpid);
    printf("exit status is : %d\n", tag);
    return 0;  
}  


int fork1(){

    int i=0;  
    printf("i son/pa ppid pid  fpid\n");  
    //ppid指当前进程的父进程pid  
    //pid指当前进程的pid,  
    //fpid指fork返回给当前进程的值  
    for(i=0;i<2;i++){  
        pid_t fpid=fork();  
        if(fpid==0)  
            printf("%d child  %4d %4d %4d\n",i,getppid(),getpid(),fpid);  
        else  
            printf("%d parent %4d %4d %4d\n",i,getppid(),getpid(),fpid);  
    }  
    return 0; 

}

int fork2()
{
    int i=0;  
    for(i=0;i<3;i++){  
        pid_t fpid=fork();  
        if(fpid==0)  
            printf("i am son\n");  
        else  
            printf("father\n");  
    }  
    return 0;  
}

int fork3()
{
    pid_t fpid;//fpid表示fork函数返回的值  
    //printf("fork!");  
    printf("fork!\n");  
    fpid = fork();  
    if (fpid < 0)  
        printf("error in fork!");  
    else if (fpid == 0)  
        printf("I am the child process, my process id is %d\n", getpid());  
    else  
        printf("I am the parent process, my process id is %d\n", getpid());  
    return 0; 
}
int vfork0()
{
    int i=0;
　　pid_t pid;
　　printf("还没创建子进程\n");
　　i++;
　　printf("-----i=%d-----\n",i);
　　pid = vfork();
　　if(pid==-1)
　　{
　　　　printf("fork error!\n");
　　}
　　else if(pid==0)
　　{
　　　　i++;
　　　　printf("我是子进程,id%d\n",getpid());
　　　　printf("我的父亲是id:%d\n",getppid());
　　　　printf("-----i=%d-----\n",i);
　　}
　　else
　　{
　　　　i++;
　　　　printf("我是父进程,id:%d\n",getpid());
　　　　printf("-----i=%d-----\n",i);
　　}
　　return(0);
}

int exit0()
{
    printf("this process will exit!\n");
    //exit系统调用带有一个整数类型的参数status，我们可以利用这个参数传递进程结束时的状态，
    //比如说，该进程是正常结束的，还是出现某种意外而结束的，一般来说，0表示没
    //有意外的正常结束；其他的数值表示出现了错误，进程非正常结束。我们在实际编程时，
    //可以用wait系统调用接收子进程的返回值，从而针对不同的情况进行不同的处理。
    exit(0);
    printf("never be displayed!\n");
}

int _exit0()
{
    printf("output begin\n");
    printf("content in buffer");
    /*
     * _exit()函数的作用最为简单：直接使进程停止运行，清除其使用的内存空间，
     * 并销毁其在内核中的各种数据结构；exit()函数则在这些基础上作了一些包装，在执行退出之前加了若干道工序.
     * exit()函数与_exit()函数最大的区别就在于exit()函数在调用exit系统调用之前要检
     * 查文件的打开情况，把文件缓冲区中的内容写回文件
     *
     */
    _exit(0);
}
int main(void)
{
//    fork0();
//    fork1();
//    fork2();
//    fork3();
//    vfork0();
}
