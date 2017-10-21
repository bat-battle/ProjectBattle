#include<stdio.h>
#include<poll.h>
#include<sys/socket.h>
#include<sys/types.h>
#include<arpa/inet.h>
#include<string.h>
#include<netinet/in.h>

int main()
{
	int sock = socket(AF_INET,SOCK_STREAM,0);
	if(sock == -1)
	{
		perror("socket");
		return -1;
	}
	printf("client's sock is : %d\n",sock);

	struct sockaddr_in remote;
	remote.sin_family = AF_INET;
	remote.sin_port = htons(8080);
	remote.sin_addr.s_addr = inet_addr("127.0.0.1");

	if(connect(sock,(struct sockaddr*)&remote,sizeof(remote)) < 0)
	{
		perror("connect");
		return -1;
	}

	struct pollfd nfd[2];
	nfd[0].fd = sock;
	nfd[0].events = POLLOUT;
	nfd[1].fd = 0; //stdin
	nfd[1].events = POLLIN;

	while(1)
	{
		//  int poll(struct pollfd *fds, nfds_t nfds, int timeout)
		switch(poll(nfd,2,-1))//block wait
		{
			case 0://timeout
				printf("poll timeout\n");
				break;
			case -1://error
				perror("poll");
				break;
			default://correct
				{
					//read from stdin
					if(nfd[1].revents & POLLIN)
					{
						char buf[1024];
						memset(buf,'\0',sizeof(buf));
						ssize_t size = read(nfd[1].fd,buf,sizeof(buf) - 1);
						if(size < 0)
						{
							perror("read");
							break;
						}
						buf[size] = '\0';
						//send to server
						if(nfd[0].revents & POLLOUT)
						{
							ssize_t write_size = write(sock,buf,strlen(buf));
							if(write_size < 0)
							{
								perror("write");
								break;
							}
						}

					}
				}
				break;
		}
	}
	close(sock);
	return 0;
}
