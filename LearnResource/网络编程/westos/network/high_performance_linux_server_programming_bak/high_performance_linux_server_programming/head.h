#ifndef HEADER_H
#define HEADER_H

#include <sys/socket.h>
// #include <netinet/in.h>
#include <arpa/inet.h>
#include <assert.h>
#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include <libgen.h>     /* for basename() */

/* 定义bool类型 */
typedef int bool;
#define TRUE 1;
#define FALSE 0;

#endif