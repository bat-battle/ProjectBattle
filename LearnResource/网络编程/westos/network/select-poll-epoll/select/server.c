#include<stdio.h>
#include<sys/select.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<netinet/in.h>
#include<string.h>
#include<stdlib.h>

#define _FD_NUM_  32
#define _BACK_LOG_ 5

int arr_fd[_FD_NUM_];

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
	local.sin_port = htons(8888);
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

	fd_set read_set;
	int max_fd = sock;

	//array init
	memset(arr_fd,-1,_FD_NUM_);
	arr_fd[0] = sock;
	int i = 0, j = 0;
	while(1)
	{
		FD_ZERO(&read_set);//clear
		//set read_set && find max_fd
		for(i = 0;i < _FD_NUM_;i++)
		{
			if(arr_fd[i] > 0)
			{
				FD_SET(arr_fd[i],&read_set);
			}
			if(arr_fd[i] > max_fd)
			{
				max_fd = arr_fd[i];
			}
		}
		printf("max_fd: %d\n",max_fd);

		//struct timeval timeout = {5,0};
		//BLOCK wait
		switch(select(max_fd + 1,&read_set,NULL,NULL,NULL))
		{
			case 0://timeout
				printf("server timeout\n");
				break;
			case -1://error
				perror("select");
				break;
			default:
				{
					for(i = 0;i < _FD_NUM_;i++)
					{
						printf("arr_fd : %d\n",arr_fd[i]);
						if(arr_fd[i] < 0)
						  continue;
						//accept client's connect
						else if(arr_fd[i] == sock && FD_ISSET(arr_fd[i],&read_set))
						{
							int new_sock = accept(arr_fd[i],(struct sockaddr*)&client,&client_len);
							//connect failed
							if(new_sock < 0)
							{
								perror("accept");
							}
							printf("Get a connect...\n");
							//insert new_fd
							for(j = 0;j < _FD_NUM_;j++)
							{
								if(arr_fd[j] == -1)
								{
								  arr_fd[j] = new_sock;
								  break;
								}
								printf("Insert new_sock is : %d\n",new_sock);
							}
							if(j == _FD_NUM_)
							{
								printf("socket array is full\n");
								close(new_sock);
							}
						}
						//other socket
						else
						{
							for(i = 1;i < _FD_NUM_;i++)
							{
								if(arr_fd[i] > 0 && FD_ISSET(arr_fd[i],&read_set))
								{
									char buf[1024];
									memset(buf,'\0',sizeof(buf));
									ssize_t size = read(arr_fd[i],buf,sizeof(buf) - 1);
									if(size == 0)
									{
										printf("clien release\n");
										close(arr_fd[i]);
										arr_fd[i] = -1;
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
