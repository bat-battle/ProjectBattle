#include <pthread.h>
#include <stdio.h>
#include<unistd.h>
#include <sys/time.h>
#include <string.h>

#define MAX 10

pthread_t thread[3];
pthread_mutex_t mut;
int number=0, i, j;

void *thread0()
{
        printf ("thread0 : I'm thread 0\n");
//        int i;
        for (i = 0; i < MAX; i++)
        {
//                pthread_mutex_lock(&mut);
                number++;
//                sleep(2);
                printf("thread0 :  number = %d\n",number);
//                pthread_mutex_unlock(&mut);
        }
        printf("thread0 :主函数在等我完成任务吗？\n");
        pthread_exit(NULL);
}
void *thread1()
{
        printf ("thread1 : I'm thread 1\n");
//        int i;
        for (i = 0; i < MAX; i++)
        {
//                pthread_mutex_lock(&mut);
                number++;
//                sleep(2);
                printf("thread1 :  number = %d\n",number);
//                pthread_mutex_unlock(&mut);
        }
        printf("thread1 :主函数在等我完成任务吗？\n");
        pthread_exit(NULL);
}
void *thread2()
{
        printf("thread2 : I'm thread 2\n");
        int i;
        pthread_mutex_lock(&mut);
        for (i = 0; i < MAX; i++)
        {
                number++;
                printf("thread2 :  number = %d\n",number);
//                sleep(1);
        }
        pthread_mutex_unlock(&mut);
        printf("thread2 :主函数在等我完成任务吗？\n");
        pthread_exit(NULL);
}
void thread_create(void)
{
        int temp;
        memset(&thread, 0, sizeof(thread));          
        /*创建线程*/
        if((temp = pthread_create(&thread[0], NULL, thread0, NULL)) != 0)       
                printf("线程0创建失败!\n");
        else
                printf("线程0被创建\n");
        if((temp = pthread_create(&thread[1], NULL, thread1, NULL)) != 0)  
                printf("线程1创建失败");
        else
                printf("线程1被创建\n");
        if((temp = pthread_create(&thread[2], NULL, thread2, NULL)) != 0)  
                printf("线程2创建失败");
        else
                printf("线程2被创建\n");
}
void thread_wait(void)
{
        /*等待线程结束*/
        if(thread[0] !=0) {               
                pthread_join(thread[0],NULL);
                printf("线程1已经结束\n");
       }
        if(thread[1] !=0) {                   
                printf("wait thread1...\n");
                pthread_join(thread[1],NULL);
                printf("线程2已经结束\n");
        }
        if(thread[2] !=0) {               
                pthread_join(thread[0],NULL);
                printf("线程3已经结束\n");
       }
}
int main()
{
//        int a[1024][10];
        /*用默认属性初始化互斥锁*/
        pthread_mutex_init(&mut,NULL);
        printf("我是主函数，我正在创建线程。\n");
        thread_create();
        printf("我是主函数，我正在等待线程完成任务阿。\n");
        thread_wait();

        return 0;

}
