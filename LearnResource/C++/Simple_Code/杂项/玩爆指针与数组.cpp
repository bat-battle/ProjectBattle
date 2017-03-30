#include<stdio.h>
#include<iostream>
using namespace std;
#define LINE __LINE__<<": "

int main()
{
    //freopen("answer.txt","w",stdout);
    /**判断下列每个输出是否合法。2686703=0x28feef
     *不合法请说明理由;合法请写出输出结果*/
    char str[16] = "abc""123";
    cout<<"(1):\n"
        <<LINE<<str         <<"\n"
        <<LINE<<*&str       <<"\n"
        <<LINE<<&*str       <<"\n"
        <<LINE<<&str[0]     <<"\n"
        <<LINE<<(&str)[0]   <<"\n"
        <<LINE<<&(str[0])   <<"\n"
        <<LINE<<&str[1]     <<"\n"
        <<LINE<<&(str[1])   <<"\n"
        <<LINE<<(&str)[1]   <<"\n"
        <<LINE<<(&str)+1    <<"\n"<<endl;/*(1)*/

    cout<<"(2):\n"
        <<LINE<<*str        <<"\n"
        <<LINE<<str[0]      <<"\n"
        <<LINE<<*(&str[0])  <<"\n"<<endl;/*(2)*/

    cout<<"(3):\n"
        <<LINE<<(int)(str)  <<"\n"
        <<LINE<<(int)(&*str)<<"\n"
        <<LINE<<(int)(*&str)<<"\n"
        <<LINE<<(int)(&str) <<"\n"
        <<LINE<<(int)(*str) <<"\n"
        <<endl
        <<LINE<<(int)(*&str+1)      <<"\n"
        <<LINE<<(int)*(&str+1)      <<"\n"
        <<LINE<<(int)*(&str[1])     <<"\n"
        <<LINE<<(int)*((&str)[1])   <<"\n"
        <<LINE<<(int)(*&*str)       <<"\n"
        <<LINE<<(int)(**&str)       <<"\n"<<endl;/*(3)*/

    cout<<"(4):\n"
        <<LINE<<str+1       <<"\n"
        <<LINE<<*str+1      <<"\n"
        <<LINE<<&str        <<"\n"
        <<LINE<<&str+1      <<"\n"  //2 ?
        <<LINE<<*&str+1     <<"\n"  //2 ?
        <<LINE<<*(str+1)    <<"\n"  //2 ?
        <<LINE<<*(&str[1])  <<"\n"  //[2] ?
        <<LINE<<*((&str)[1])<<"\n"  //[2] ?
        <<LINE<<*(&str+1)   <<"\n"  //[2] ?
        <<LINE<<&(*(str+1)) <<"\n"  //[2] ?
        //<<LINE<<&(*str+1) <<"\n"
        <<endl;/*(4)*/

    printf("(5):\n1: %s \n2: %s \n3: %s \n4: %s \n5: %s \n"
           ,str,&str,&(str[0]),&str[0],(&str)[0]);/*(5)*/

    printf("(6):\n%c\n%c\n%c\n",*str,str[0],*&str[0]);/*(6)*/
    //printf("\n%c\n",&*str[0]);/*(7)*/

    char *p1 = str;
    //char *p2 = &str;      /*(8)*/
    //char**p3 = &str;      /*(9)*/
    //char *p4[16] = &str;  /*(10)*/
    //p4 = &str;            /*(11)*/
    char (*p5)[16] = &str;  /*(12)*/
    typedef char Array[16];
    Array *p6 = &str;       /*(13)*/

    cin.get();
    return 0;
}
