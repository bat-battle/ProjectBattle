/**
 *	TCP数据的读写
 *	对文件的读写操作read和write同样适用于socket
 *
 *	socket编程接口提供了几个专门用户socket数据读写的系统调用，其中对于TCP流数据读写的系统调用是：
 *	
 *	#include <sys/types.h>
 *	#include <sys/socket.h>
 *	ssize_t recv(int sockfd, void * buf, size_t len, int flags);
 *	ssize_t send(int sockfd, const void * buf, size_t len, int flags);
 *
 *	recv读取sockfd上的数据，buf和len参数分别指定读缓冲区的位置和大小，flags通常设置为0
 *	recv读取成功时返回实际读取到的数据的长度，它可能小于传入的len，所以我们可能要多次调用recv才能读取到完整数据
 *	recv返回0则代表通信对方已经关闭连接了
 * 	recv返回-1标示出错，测试会设置errno
 *
 *	send往sockfd上写入数据，buf和len指定写缓冲区的位置和大小，send成功时返回实际写入数据的长度，失败返回-1，并设置errno
 *
 *	flags参数为数据收发提供了额外的控制，包括以下几个值或者互相的或:
 *
 *  (因为要在注释中用到表格，所以生成了下面这样的表格，为此新写了一段脚本，可以在这里找到: https://github.com/linjunjie/shell_table.git
 *  目前生成的效果就是下面这样，我觉得这脚本肯定还有一段路要走...)
 * 
 * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 * |  选项名         |  含义                                                                                                                                      |  send  |  recv  |
 * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 * |  MSG_CONFIRM    |  指示数据链路层协议持续监听对方的回应，直到得到答复，它仅能用于SOCK_DGRAM和SOCK_RAW类型的socket                                            |  Y     |  N     |
 * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 * |  MSG_DONTROUTE  |  不看路由表，直接将数据发送给本地局域网络内的主机，这表示发送者确切地知道目标主机就在本地网络上                                            |  Y     |  N     |
 * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 * |  MSG_DONTWAIT   |  对socket的此次操作将是非阻塞的                                                                                                            |  Y     |  Y     |
 * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 * |  MSG_MORE       |  告诉内核应用程序还有更多数据要发送，内核将超时等待新数据写入TCP发送缓冲区后一并发送，这样可以防止TCP发送过多小的报文段，从而提高传输效率  |  Y     |  N     |
 * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 * |  MSG_WAITALL    |  读操作仅在读取到指定数量的字节后才返回                                                                                                    |  N     |  Y     |
 * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 * |  MSG_PEEK       |  窥探缓存中的数据，此次读操作不会导致这些数据被清楚                                                                                        |  N     |  Y     |
 * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 * |  MSG_OOB        |  发送或接收紧急数据                                                                                                                        |  Y     |  Y     |
 * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 * |  MSG_NOSIGNAL   |  往读端关闭的管道或者socket接连中写数据时不引发SIGPIPE信号                                                                                 |  Y     |  N     |
 * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 *
 *	顺便一提：flags参数只对send和recv的当前调用生效
 *
 *	使用方式:
 *	./testoobrecv 127.0.0.1 12345
 *	./testoobsend 127.0.0.1 12345
 *	sudo tcpdump -ntx -i eth0 port 12345
 *
 *	我本地机器的输出如下：
 *	got 3 bytes of normal data '123'
 *	got 1 bytes of oob data 'c'
 *	got 2 bytes of normal data 'ab'
 *
 */


#include "head.h"

#define BUF_SIZE 1024

int main(int argc, char * argv[]){
	if(argc <= 2){
		printf("usage : %s ip_address port_number\n", basename(argv[0]));
		return 0;
	}
	const char * ip = argv[1];
	int port = atoi(argv[2]);

	/* 定义一个IPv4地址结构体 */
	struct sockaddr_in address;

	/* 将此地址清零 */
	bzero(&address, sizeof(address));

	/* 指定为TCP/IP协议地址族 */
	address.sin_family = AF_INET;

	/* 根据指定的AF_INET将字符串转换为网络地址 */
	inet_pton(AF_INET, ip, &address.sin_addr);

	/* 将主机字节序转变为网络字节序之后指定端口 */
	address.sin_port = htons(port);

	/* 创建socket */
	int sock = socket(PF_INET, SOCK_STREAM, 0);
	assert(sock >= 0);

	/* 将前面配置好的socket地址赋值给声明的socket */
	int ret = bind(sock, (struct sockaddr *) &address, sizeof(address));
	assert(ret != -1);

	/* 监听socket */
	ret = listen(sock, 5);
	assert(ret != -1);

	/* 定义一个IPv4的客户端地址 */
	struct sockaddr_in client;

	/* 得到此客户端地址长度 */
	socklen_t client_addrlength = sizeof(client);

	/* 接受一个监听socket */
	int connfd = accept(sock, (struct sockaddr *) &client, &client_addrlength);
	if(connfd < 0){
		printf("errno is : %d\n", errno);
	}else{
		char buffer[BUF_SIZE];

		/**
		 *	void * memset(void * s, int ch, size_t n)
		 *	将s中的前n个字节(typedef unsigned int size_t)用ch替换并返回s
		 */
		memset(buffer, '\0', BUF_SIZE);
		ret = recv(connfd, buffer, BUF_SIZE - 1, 0);
		printf("got %d bytes of normal data '%s'\n", ret, buffer);

		memset(buffer, '\0', BUF_SIZE);
		ret = recv(connfd, buffer, BUF_SIZE - 1, MSG_OOB);
		printf("got %d bytes of oob data '%s'\n", ret, buffer);

		memset(buffer, '\0', BUF_SIZE);
		ret = recv(connfd, buffer, BUF_SIZE - 1, 0);
		printf("got %d bytes of normal data '%s'\n", ret, buffer);

		close(connfd);
	}

	close(sock);
	return 0;
}