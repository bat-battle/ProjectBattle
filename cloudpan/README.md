#云网盘相关说明
通过这个项目，可以很好的巩固和学习到更多的操作系统，文件系统，高并发进程模型，
网络io模型，零拷贝技术，数据分块、多种加密算法、不同类型文件的高效解压缩算法，
进程多种通信机制，合理且高效的数据结构。

#项目加分项：

秒传，文件摘要；

文件时光机（可查看到历史任何版本的数据状态）；

断点续传；

#实现分析：

第一，此项目必须实现高并发（1k+）的用户连接，上传和下载文件等“重量级”操作。所以
首先要考虑的是，进程模型该如何选择（半同步半异步，反应堆，多进程or进程池，多线程or
线程池，进程+多线程...etc）？网络模型该如何选择（阻塞、非阻塞、IO多路复用(poll /dev/poll select epoll kqueue iocp)、信号驱动和异步）？最后是处理较复杂的数据，合理且高效的数据结构也是必须的。

第二，以上基本框架定型后，在较全面调研和学习一些加密/解压缩算法后，对于不同类型文件，应该选择哪款加密/解压缩算法？

第三，需要扩展学习和掌握的知识点有：服务器的session会话，客户端的cookies，长连接，认证token，cache技术，分布式数据
的存储，一致性，容错性，高可用，存储节点水平扩展，单点故障。

第四，网络安全（常见的网络攻击，预防措施）。


#相关参考资料
[Linux
上的常用文件传输方式介绍与比较](http://www.ibm.com/developerworks/cn/linux/l-cn-filetransfer/)

[用 Java 实现断点续传
(HTTP)](https://www.ibm.com/developerworks/cn/java/joy-down/)

[使用 C-Socket 通信实现 FTP
客户端程序](https://www.ibm.com/developerworks/cn/linux/l-cn-socketftp/)

[记一次rsync增量同步远程服务器文件](http://www.tuicool.com/articles/UZVj2eA)

[真正的inotify+rsync实时同步
彻底告别同步慢](http://www.ttlsa.com/web/let-infotify-rsync-fast/)

[rsync那些事儿](http://www.jianshu.com/p/87b9ceee7a1a)
[详解rsync算法--如何减少同步文件时的网络传输量](http://blog.csdn.net/russell_tao/article/details/7240661)

[高性能IO模型浅析](http://www.cnblogs.com/fanzhidongyzby/p/4098546.html)

[IO的五种模型](http://blog.csdn.net/sszgg2006/article/details/38664789)

[幽默讲解 Linux 的 Socket IO
模型](http://blog.chinaunix.net/uid-26000296-id-4100620.html)

[高性能网络编程系列-陶辉](http://taohui.pub/category/high_conc/)

[阿里-Redis内核基于时间点的备份恢复和基于AOF日志的增量同步机制设计](https://yq.aliyun.com/articles/68350?spm=5176.8067842.tagmain.111.YCeMDi)
