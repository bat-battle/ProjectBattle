#include<stdio.h>
#include<unistd.h>
#include<sys/epoll.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<netinet/in.h>
#include<string.h>
#include<stdlib.h>
#include<fcntl.h>

#define IPADDR "127.0.0.1"
#define PORT 8080

#define _MAX_NUM_  64
#define _BACK_LOG_ 5

int start_up()
{
	int sock = socket(AF_INET,SOCK_STREAM,0);
	if(sock == -1)
	{
		perror("sock");
		exit(1);
	}

	struct sockaddr_in local;
	local.sin_family = AF_INET;
	local.sin_port = htons(PORT);
	inet_aton(IPADDR,&local.sin_addr);

	//Avoid port reuse
	int flag = 1;
	setsockopt(sock,SOL_SOCKET,SO_REUSEADDR,&flag,sizeof(int));

	if(bind(sock,(struct sockaddr*)&local,sizeof(local)) == -1)
	{
		perror("bind");
		exit(1);
	}

	if(listen(sock,_BACK_LOG_) == -1)
	{
		perror("listen");
		exit(1);
	}
	return sock;
}

void set_nonblock(int fd)
{
	//int fcntl(int fd, int cmd, ... /* arg */ );
	int fl = fcntl(fd,F_GETFL);//Read the file status flags	
	if(fl < 0)
	{
		perror("fcntl");
		return;
	}
	fcntl(fd ,fl | O_NONBLOCK);
	return;
}

int read_data(int fd,char *buf,int len)
{
	ssize_t size = -1;
	int total = 0;
	while(1)
	{
		//ssize_t recv(int sockfd, void *buf, size_t len, int flags);
		size = recv(fd,buf+total,len -1,MSG_DONTWAIT);
		if(size > 0)
		{
			total += size;
		}
		else if(size == 0)
		  return 0;
		else
		  return -1;
	}
}

int main()
{
	int sock = start_up();
	printf("server socket is: %d\n",sock);
	
	//create fd
	//int epoll_create(int size);
	int epoll_fd = epoll_create(256);
	if(epoll_fd < 0)
	{
		perror("epoll_fd");
		exit(1);
	}
	printf("epoll_fd : %d\n",epoll_fd);

	struct sockaddr_in client;
	socklen_t client_len = sizeof(client);

	struct epoll_event _ev;
	_ev.events = EPOLLIN;
	_ev.data.fd = sock;

	// int epoll_ctl(int epfd, int op, int fd, struct epoll_event *event);
	if(epoll_ctl(epoll_fd,EPOLL_CTL_ADD,sock,&_ev) < 0)
	{
		perror("epoll_ctl");
		close(epoll_fd);
	}

	//int timeout = 5000; //5 second
	char buf[1024 * 5];

	struct epoll_event _ev_out[_MAX_NUM_];
	int ready_num = -1;
	
	while(1)
	{
//int epoll_wait(int epfd, struct epoll_event * events, int maxevents, int timeout);
		switch(ready_num = epoll_wait(epoll_fd,_ev_out,_MAX_NUM_,-1))
		{
			case 0://timeout
				printf("epoll timeout..\n");
				break;
			case -1://error
				perror("epoll_wait");
				break;
			default:
				{
					printf("ready_num : %d\n",ready_num);
					int i = 0;
					for(;i < ready_num;i++)
					{
						int fd = _ev_out[i].data.fd;
						if((fd == sock) && (_ev_out[i].events & EPOLLIN))
						{
							int new_sock = accept(fd,(struct sockaddr*)&client,&client_len);
							if(new_sock < 0)
							{
								perror("accept");
								continue;
							}

							printf("get a connect...\n");
							set_nonblock(new_sock);
							_ev.events = EPOLLIN | EPOLLET;
							_ev.data.fd = new_sock;

							if(epoll_ctl(epoll_fd,EPOLL_CTL_ADD,new_sock,&_ev) < 0)
							{
								perror("epoll_ctl");
								close(new_sock);
								continue;
							}
							printf("Insert new_fd success,new_sock is : %d\n",new_sock);
							continue;
						}
						if(_ev_out[i].events & EPOLLIN)
						{
							memset(buf,'\0',sizeof(buf));
							if(read_data(fd,buf,sizeof(buf)) == 0)
							{
								printf("close connect..\n");
								//delete fd
								epoll_ctl(epoll_fd,EPOLL_CTL_DEL,fd,NULL);
							}
							printf("%s\n",buf);
							memset(buf,'\0',sizeof(buf));
							sprintf(buf,"HTTP/1.0 200 OK\r\n\r\n");
							if(send(fd,buf,strlen(buf),0) == -1)
							{
								perror("send");
								exit(1);
							}
							sprintf(buf,"<html><head></head><body><p><h1>hello kkw</h1></p></body></html>\n");
							send(fd,buf,strlen(buf),0);
						}
					}
				}
				break;
		}
	}
	close(sock);
	close(epoll_fd);
	return 0;
}
