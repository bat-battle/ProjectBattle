/*************************************************************************
	> File Name: io.h
	> Author: 
	> Mail: 
	> Created Time: 2017年08月27日 22时45分41秒 PDT
 ************************************************************************/

#ifndef _IO_H
#define _IO_H

#include<sys/select.h>
#define MAX 20
struct Sock
{
    char username[MAX];
    int port;
    char ip[20];
};
struct SerMsg
{
    int OP;
    char username[20];
    char buf[1024];
}SERVER[FD_SETSIZE];
#endif
