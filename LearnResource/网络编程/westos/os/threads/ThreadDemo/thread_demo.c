#include <pthread.h>
#include <stdio.h>
#include<unistd.h>
#include <sys/time.h>
#include <string.h>

#define MAX 10
pthread_t thread[2];
int number=0;

void *thread1()
{
    printf ("thread1 : I'm thread 1\n");
    int i;
    for (i = 0; i < MAX; i++)
    {
        sleep(1);
        //大家要及时复习我们讲的概念，一些心得技术名词课后也要再去查查
        //代码需要做多种修改，然后去证实自己的理解和推测，实践很重要。
        printf("thread1 : number[%d] = %d\n",i, number);
        number++;
    }
    printf("thread1 :主函数在等我完成任务吗？\n");
    pthread_exit(NULL);
}
void *thread2()
{
    printf("thread2 : I'm thread 2\n");
    int i;
    for (i = 0; i < MAX; i++)
    {
        printf("thread2 : number[%d] = %d\n",i, number);
        number++;
        sleep(1);
    }
    printf("thread2 :主函数在等我完成任务吗？\n");
    pthread_exit(NULL);
}
void thread_create(void)
{
        int temp;
        memset(&thread, 0, sizeof(thread));          
        /*创建线程*/
        if((temp = pthread_create(&thread[1], NULL, thread2, NULL)) != 0)  
                printf("线程2创建失败");
        else
                printf("线程2被创建\n");
        if((temp = pthread_create(&thread[0], NULL, thread1, NULL)) != 0)       
                printf("线程1创建失败!\n");
        else
                printf("线程1被创建\n");
}
void thread_wait(void)
{
        /*等待线程结束*/
        if(thread[0] !=0) {                   
                pthread_join(thread[0],NULL);
                printf("线程1已经结束\n");
        }
        if(thread[1] !=0) {               
                pthread_join(thread[1],NULL);
                printf("线程2已经结束\n");
       }
}
int main()
{
        printf("我是主函数，我正在创建线程。\n");
        thread_create();
        printf("我是主函数，我正在等待线程完成任务阿。\n");
        thread_wait();
        return 0;
}
