/**
 *  这个功能的作用是通过 
 *  ./testlisten 127.0.0.1 12345 5           #来监听12345端口，并且指定内核监听队列的最大长度
 * 
 *  然后通过 
 *  telnet 127.0.0.1 12345                   #多次执行来连接此 server
 * 
 *  通过
 *  netstat -nt|grep 12345                   #来查看目前的连接情况
 *
 */

#include "head.h"

static bool stop = FALSE;

static void handle_term(int sig){
    stop = TRUE;
}

int main(int argc, char *argv[]){
    signal(SIGTERM, handle_term);
    
    /* 校验参数 */
    if(argc <= 3){
        printf("usage: %s ip_address port_number backlog\n", basename(argv[0]));
        return 1;
    }
    
    const char *ip = argv[1];
    
    /**
     * atoi : alphanumeric to integer 把字符串转换成整型数
     */
    int port = atoi(argv[2]);
    int backlog = atoi(argv[3]);
    
    /**
     * 创建socket 
     *
     * int socket(int domain, int type, int protocol)
     *
     * domain   参数指定使用哪个底层协议
     *          对于TCP/IP协议族而言，应该设置为PF_INET（Protocol Family Of Internet，用于IPv4),或是PF_INET6（用于IPv6)
     *          对于UNIX本地域协议族而言，该参数应指定为PF_UNIX
     *
     * type     参数指定服务类型
     *          SOCK_STREAM（流服务）和 SOCK_UGRAM（数据报服务)
     *          针对TCP/IP协议族而言，SOCK_STREAM表示传输层使用TCP协议，SOCK_DGRAM表示传输层使用UDP协议
     *
     *          自 linux_kernel.version > 2.6.17 起，添加了两个新参数
     *          SOCK_NONBLOCK 将创建的socket设为非阻塞的
     *          SOCK_CLOEXEC  用fork调用创建子进程时在子进程中关闭socket
     *          在2.6.17之前，文件描述符的这两个属性都需要使用额外的系统调用(比如fcntl)来设置
     *
     * protocol 在前面两个参数构成的协议集合下，再选择一个具体的协议，不过这个值通常是唯一的，通常设置为0，标示使用默认协议
     *
     */
    int sock = socket(PF_INET, SOCK_STREAM, 0);
    assert(sock >= 0);
    
    /* 创建一个IPv4 socket 地址 */
    struct sockaddr_in address;

    /* 地址清零 */
    bzero(&address, sizeof(address));

    /* 指定地址家族，AF_INET为TCP/IP协议族 */
    address.sin_family = AF_INET;

    /**
     * inet_pton : 点分十进制 > 二进制整数, 这个函数转换字符串到网络地址
     * int inet_pton(int af, const char * src, void *dst);
     * 
     * af       地址族
     * src      来源地址
     * dst      保存转换后的地址
     *
     */
    inet_pton(AF_INET, ip, &address.sin_addr);

    /** 
     * htons : 将主机字节序转换为网络字节序，一般是将小端字节序转换为大端字节序
     *
     * host to network sort
     */
    address.sin_port = htons(port);
    
    /**
     *  #include <sys/types.h>
     *  #include <sys/socket.h>
     *  int bind( int sockfd, const struct sockaddr * my_addr, socklen_t addrlen);
     *
     *  bind 是将my_addr所指的socket地址分配给未命名的sockfd文件描述符，addrlen参数指出该socket地址的长度
     */
    int ret = bind(sock, (struct sockaddr *) &address, sizeof(address));
    assert(ret != -1);
    
    /**
     * listen第一个参数sock指定被监听的socket,第二个参数backlog指定内核监听队列的最大长度
     * 监听队列的长度如果超过backlog,则服务器不会接受新的客户连接,客户端也将收到 ECONNREFUSED 错误信息
     * 
     *      linux_kernel.version < 2.2 : backlog参数指所有SYN_RCVD和ESTABLISHED的socket
     *      linux_kernel.version > 2.2 : backlog参数指所有ESTABLISHED的socket
     *      
     * @return : 
     *      success : 0
     *      fail : -1
     *      
     */
    ret = listen(sock, backlog);
    assert(ret != -1);
    
    /* 循环等待连接，直到有SIGTERM信号将它中断 */
    while(!stop){
        sleep(1);
    }
    
    /* 关闭socket */
    close(sock);
    return 0;
}