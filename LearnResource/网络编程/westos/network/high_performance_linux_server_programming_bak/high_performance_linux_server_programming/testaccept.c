/**
 *	测试accept
 * 
 *	展示连接到本程序的客户端的信息
 *
 *	首先运行本程序:
 *	./testaccept 127.0.0.1 12345 #监听12345端口
 *	
 *	然后
 *	telnet 127.0.0.1 12345 #连接之后马上退出
 * 
 *	最后，经过20秒之后，本程序会打印出连接客户端的ip和port, 例如：
 *	connected with ip: 127.0.0.1 and port: 50425
 *	
 *	中间过程中（也就是断开客户端之后，服务器退出之前）通过 netstat -nt|grep 12345 可以看到如下情况
 *  tcp4       0      0  127.0.0.1.12345        127.0.0.1.50677        CLOSE_WAIT 
 *	tcp4       0      0  127.0.0.1.50677        127.0.0.1.12345        FIN_WAIT_2 
 */

#include "head.h"

int main(int argc, char * argv[]){
	if(argc <= 2){
		printf("usage : %s ip_address port_number\n", basename(argv[0]));
		return 1;
	}

	const char * ip = argv[1];
	int port = atoi(argv[2]);

	struct sockaddr_in address;
	bzero(&address, sizeof(address));
	address.sin_family = AF_INET;
	inet_pton(AF_INET, ip, &address.sin_addr);
	address.sin_port = htons(port);

	int sock = socket(PF_INET, SOCK_STREAM, 0);
	assert(sock >= 0);

	int ret = bind(sock, (struct sockaddr *) &address, sizeof(address));
	assert(ret != -1);

	ret = listen(sock, 5);
	assert(ret != -1);

	/* 暂停20秒以等待客户端连接和相关操作（掉线或者退出）完成 */
	/* 也就是让我们去断开自己的连接，来验证accept函数 */
	sleep(20);

	struct sockaddr_in client;
	socklen_t client_addrlength = sizeof(client);

	/**
	 *	#include <sys/types.h>
	 *	#include <sys/socket.h>
	 *	int accept(int sockfd, struct sockaddr * addr, socklen_t * addrlen);
	 *
	 *	其中sockfd是执行过listen系统调用的监听socket，addr用来获取被接受连接的远端socket地址，该socket地址的长度由addrlen参数指出
	 *	accept成功时返回一个新的连接socket，该socket唯一地标识了被接受的这个连接，服务器可以通过读写该socket来与被接受连接的对应客户端通信，yes！accept失败时返回-1，并设置errno
	 *	
	 */
	int connfd = accept(sock, (struct sockaddr *) &client, &client_addrlength);
	if(connfd < 0){
		printf("errno is : %d\n", errno);
	}else{
		/* 接受连接成功则打印出客户端的IP地址和端口号 */
		char remote[INET_ADDRSTRLEN];

		/* ntohs : network to host sort */
		printf("connected with ip: %s and port: %d\n", inet_ntop(AF_INET, &client.sin_addr, remote, INET_ADDRSTRLEN), ntohs(client.sin_port));
		close(connfd);
	}

	close(sock);
	return 0;
}