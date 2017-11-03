#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

#define PORT 3333
#define MAXLINE 4096

int main(int argc,char ** argv){
    int sockfd, num;
    char send_buff[MAXLINE], read_buff[MAXLINE];
    struct hostent *he;
    struct sockaddr_in server;
    if(argc != 2){
        printf("Usage: ./<IP Address>\n");
        exit(1);
    }
    he = gethostbyname(argv[1]);
    if(he == NULL){
        printf("gethostbyname error\n");
        exit(1);
    }
    sockfd = socket(AF_INET,SOCK_STREAM,0);
    if(sockfd == -1){
        printf("socket error\n");
        exit(1);
    }
    bzero(&server,sizeof(server));
    server.sin_family = AF_INET;
    server.sin_port = htons(PORT);
    server.sin_addr = *((struct in_addr*)he->h_addr);
    if(connect(sockfd,(struct sockaddr *)&server,sizeof(server))== -1){
        printf("connect error\n");
        exit(1);
    }
    
    if(fork() == 0){
        printf("send msg to server: \n");
        while(1){
            memset(send_buff, '\0', MAXLINE);
            printf("input: ");
            fgets(send_buff,MAXLINE,stdin);
            if(write(sockfd,send_buff,strlen(send_buff)) == -1){
                printf("send msg error: %s \n",strerror(errno));
                exit(1);
            }
        }
        close(sockfd);
    }
    if(fork() == 0){
        while(1){
            if(read(sockfd,read_buff,strlen(read_buff)) == -1){
                printf("read msg error: %s \n",strerror(errno));
                exit(1);
            }
            prinf("read from cli: %s\n", read_buff);
        }
        close(sockfd);
    }
    close(sockfd);

    return 0;
}
