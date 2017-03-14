#include<stdio.h>
#include<poll.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<netinet/in.h>
#include<string.h>
#include<stdlib.h>

#define _BACK_LOG_ 5
#define _MAX_FD_NUM_  32

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
	local.sin_port = htons(8080);
	inet_aton("127.0.0.1",&local.sin_addr);

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

int main()
{
	int sock = start_up();
	printf("server socket is: %d\n",sock);
	struct sockaddr_in client;
	socklen_t client_len = sizeof(client);

	struct pollfd nfd[_MAX_FD_NUM_];
	//add fd
	nfd[0].fd = sock;
	nfd[0].events = POLLIN;
	int i = 0, j = 0;
	//init struct pollfd
	for(i = 1;i < _MAX_FD_NUM_;i++)
	{
		nfd[i].fd = -1;
	}

	int maxi = 0;

	while(1)
	{
		//BLOCK wait
		switch(poll(nfd,maxi + 1,-1)) //block wait
		{
			case 0://timeout
				printf("server timeout\n");
				break;
			case -1://error
				perror("select");
				break;
			default:
				{
					for(i = 0;i < _MAX_FD_NUM_;i++)
					{
						if(nfd[i].fd < 0)
						  continue;
						//accept client's connect
						else if((nfd[i].fd == sock) && (nfd[i].revents & POLLIN))
						{
							int new_sock = accept(nfd[i].fd,(struct sockaddr*)&client,&client_len);
							//connect failed
							if(new_sock < 0)
							{
								perror("accept");
							}
							printf("Get a connect...\n");
							//insert new_fd
							for(j = 0;j < _MAX_FD_NUM_;j++)
							{
								if(nfd[j].fd == -1)
								{
								  nfd[j].fd = new_sock;
								  nfd[j].events = POLLIN;
								  break;
								}
								printf("Insert new_sock is : %d\n",new_sock);
								maxi++;
							}
							if(j == _MAX_FD_NUM_)
							{
								printf("socket array is full\n");
								close(new_sock);
							}
						}
						//other socket
						else
						{
							for(i = 1;i < _MAX_FD_NUM_;i++)
							{
								if(nfd[i].fd > 0 && (nfd[i].revents & POLLIN))
								{
									char buf[1024];
									memset(buf,'\0',sizeof(buf));
									ssize_t size = read(nfd[i].fd,buf,sizeof(buf) - 1);
									if(size == 0)
									{
										printf("clien release\n");
										close(nfd[i].fd);
										nfd[i].fd = -1;
										maxi--;
									}
									else if(size > 0)
									{
										buf[size] = '\0';
										printf("client: %s",buf);
									}
								}
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
