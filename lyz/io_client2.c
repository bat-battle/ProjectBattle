/*************************************************************************
	> File Name: io_client2.c
	> Author: 
	> Mail: 
	> Created Time: 2017年08月27日 23时10分05秒 PDT
 ************************************************************************/

#include "/home/lyz2wtt/io复用/include/io_select.h"
#include"/home/lyz2wtt/io复用/include/io.h"
int main(int argc, char *argv[])
{
    int connectfd;
    struct sockaddr_in seraddr;//服务器网络地址结构体
    struct Sock mysock;
    char sendbuff[1024] = {0};
    char recvbuff[1024] = {0};
    memset(sendbuff, 0, sizeof(sendbuff));
    /*int port;
    char ip[20];
    char username[20] = {0};*/
    printf("Please input the username\n");
    scanf("%s", mysock.username); 
    printf("Prease input the ip:\n");
    scanf("%s", mysock.ip);
    printf("Please input the port:\n");
    scanf("%d",&mysock.port);

    bzero(&seraddr, sizeof(seraddr));
    seraddr.sin_family = AF_INET;
    seraddr.sin_port = htons(mysock.port);
    inet_aton(mysock.ip, &seraddr.sin_addr);

    connectfd = socket(AF_INET, SOCK_STREAM, 0);
    assert(connectfd != -1);
    
    int conn = connect(connectfd, (struct sockaddr*)&seraddr, sizeof(struct sockaddr));
    if(conn == -1)
    {
        perror("connect!");
        return 1;
    }
    send(connectfd, mysock.username, sizeof(mysock.username), 0);

    fd_set rset;
    FD_ZERO(&rset);
    int nready = 0;
    int maxfd;
    int std = fileno(stdin);
    if(connectfd > std)
    {
        maxfd = connectfd;
    }
    else
    {
        maxfd = std;
    }
    while(1)
    {
        FD_SET(connectfd, &rset);
        FD_SET(std, &rset);
        nready = select(maxfd+1, &rset, NULL, NULL, NULL);
        if(nready == -1)
        {
            perror("select!");
        }
        if(nready == 0)
        {
            continue;
        }
        if(FD_ISSET(connectfd, &rset))
        {
           /* int userbytes = recv(connectfd, recvname, sizeof(recvname), 0);
            fputs(recvname, stdout);
            printf("@:");
            memset(recvname, 0, sizeof(recvname));*/
            int recvbytes = recv(connectfd, recvbuff, sizeof(recvbuff), 0);
            if(recvbytes == -1)
            {
                perror("recv");
            }
            if(recvbytes == 0)
            {
                printf("server close!");
                exit(EXIT_FAILURE);
            }
            printf("%s", recvbuff);
            memset(recvbuff, 0 , sizeof(recvbuff));
        }
        if(FD_ISSET(std, &rset))
        {
            if(fgets(sendbuff, sizeof(sendbuff), stdin) == NULL)
            {
                break;
            }
            send(connectfd, sendbuff, sizeof(sendbuff), 0);
            if(strcmp("bye\n", sendbuff) == 0)//结束连接
            {
                break;
            }
            memset(sendbuff, 0, sizeof(sendbuff));
        }
    }
        close(connectfd);
        return 0;
}

