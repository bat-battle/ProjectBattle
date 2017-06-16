# Linux下的非阻塞IO库epoll

[老师原文](http://time-track.cn/epoll-in-linux.html)

## 生活中的一个例子
假设你在大学中读书，要等待一个朋友来访，而这个朋友只知道你在A号楼，但是不知道你具体住在哪里，于是你们约好了在A号楼门口见面。如果你使用的阻塞IO模型来处理这个问题，那么你就只能一直守候在A号楼门口等待朋友的到来，在这段时间里你不能做别的事情，不难知道，这种方式的效率是低下的。
进一步解释select和epoll模型的差异。select版大妈做的是如下的事情：比如同学甲的朋友来了，select版大妈比较笨，她带着朋友挨个房间进行查询谁是同学甲，你等的朋友来了，于是在实际的代码中，select版大妈做的是以下的事情：

    int n = select(&readset, NULL, NULL, 100); 
    for (int i = 0; n > 0; ++i) {
         if (FD_ISSET(fdarray[i], &readset)) {
             do_something(fdarray[i]); --n; 
        } 
    }
epoll版大妈就比较先进了，她记下了同学甲的信息，比如说他的房间号，那么等同学甲的朋友到来时，只需要告诉该朋友同学甲在哪个房间即可，不用自己亲自带着人满大楼的找人了，于是epoll版大妈做的事情可以用如下的代码表示：
    n = epoll_wait(epfd, events, 20, 500);
         for(i=0;i<n;++i) { do_something(events[n]);
    }
在epoll中，关键的数据结构epoll_event定义如下：
    typedef union epoll_data {
         void *ptr;
         int fd; 
         __uint32_t u32;
         __uint64_t u64; 
    }epoll_data_t; 
    
    struct epoll_event { 
        __uint32_t events; /* Epoll events */ 
        epoll_data_t data;/* User data variable */
     };
可以看到，epoll_data是一个union结构体，它就是epoll版大妈用于保存同学信息的结构体，它可以保存很多类型的信息：fd，指针，等等。有了这个结构体，epoll大妈可以不用吹灰之力就可以定位到同学甲。
别小看了这些效率的提高，在一个大规模并发的服务器中，轮询IO是最耗时间的操作之一。再回到那个例子中，如果每到来一个朋友楼管大妈都要全楼的查询同学，那么处理的效率必然就低下了，过不久楼底就有不少的人了。
对比最早给出的阻塞IO的处理模型，可以看到采用了多路复用IO之后，程序可以自由的进行自己除了IO操作之外的工作，只有到IO状态发生变化的时候由多路复用IO进行通知，然后再采取相应的操作，而不用一直阻塞等待IO状态发生变化了。
从上面的分析也可以看出，epoll比select的提高实际上是一个用空间换时间思想的具体应用。
深入理解epoll的实现原理
开发高性能网络程序时，windows开发者们言必称iocp，linux开发者们则言必称epoll。大家都明白epoll是一种IO多路复用技术，可以非常高效的处理数以百万计的socket句柄，比起以前的select和poll效率高大发了。我们用起epoll来都感觉挺爽，确实快，那么，它到底为什么可以高速处理这么多并发连接呢？先简单回顾下如何使用C库封装的3个epoll系统调用吧。
    int epoll_create(int size); 
    int epoll_ctl(int epfd， int op， int fd， struct epoll_event *event); 
    int epoll_wait(int epfd， struct epoll_event *events，int maxevents， int timeout);
使用起来很清晰，首先要调用epoll_create建立一个epoll对象。参数size是内核保证能够正确处理的最大句柄数，多于这个最大数时内核可不保证效果。epoll_ctl可以操作上面建立的epoll，例如，将刚建立的socket加入到epoll中让其监控，或者把 epoll正在监控的某个socket句柄移出epoll，不再监控它等等。epoll_wait在调用时，在给定的timeout时间内，当在监控的所有句柄中有事件发生时，就返回用户态的进程。
从上面的调用方式就可以看到epoll比select/poll的优越之处：
因为后者每次调用时都要传递你所要监控的所有socket给select/poll系统调用，这意味着需要将用户态的socket列表copy到内核态，如果以万计的句柄会导致每次都要copy几十几百KB的内存到内核态，非常低效。而我们调用epoll_wait时就相当于以往调用select/poll，但是这时却不用传递socket句柄给内核，因为内核已经在epoll_ctl中拿到了要监控的句柄列表。
所以，实际上在你调用epoll_create后，内核就已经在内核态开始准备帮你存储要监控的句柄了，每次调用epoll_ctl只是在往内核的数据结构里塞入新的socket句柄。
在内核里，一切皆文件。所以，epoll向内核注册了一个文件系统，用于存储上述的被监控socket。当你调用epoll_create时，就会在这个虚拟的epoll文件系统里创建一个file结点。当然这个file不是普通文件，它只服务于epoll。epoll在被内核初始化时（操作系统启动），同时会开辟出epoll自己的内核高速cache区，用于安置每一个我们想监控的socket，这些socket会以红黑树的形式保存在内核cache里，以支持快速的查找、插入、删除。这个内核高速cache区，就是建立连续的物理内存页，然后在之上建立slab层，简单的说，就是物理上分配好你想要的size的内存对象，每次使用时都是使用空闲的已分配好的对象。
    static int __init eventpoll_init(void) { 
        ... ... 
        /* Allocates slab cache used to allocate "struct epitem" items */ 
        epi_cache = kmem_cache_create("eventpoll_epi", sizeof(struct  epitem), 0, SLAB_HWCACHE_ALIGN| EPI_SLAB_DEBUG|SLAB_PANIC, NULL, NULL); 
        /* Allocates slab cache used to allocate "struct eppoll_entry" */ 
        pwq_cache = kmem_cache_create("eventpoll_pwq", sizeof(struct eppoll_entry), 0, EPI_SLAB_DEBUG|SLAB_PANIC, NULL, NULL); 
        ... ...

epoll的高效就在于，当我们调用epoll_ctl往里塞入百万个句柄时，epoll_wait仍然可以飞快的返回，并有效的将发生事件的句柄给我们用户。
这是由于我们在调用epoll_create时，内核除了帮我们在epoll文件系统里建了个file结点，在内核cache里建了个红黑树用于存储以后epoll_ctl传来的socket外，还会再建立一个list链表，用于存储准备就绪的事件，当epoll_wait调用时，仅仅观察这个list链表里有没有数据即可。有数据就返回，没有数据就sleep，等到timeout时间到后即使链表没数据也返回。所以，epoll_wait非常高效。
那么，这个准备就绪list链表是怎么维护的呢？当我们执行epoll_ctl时，除了把socket放到epoll文件系统里file对象对应的红黑树上之外，还会给内核中断处理程序注册一个回调函数，告诉内核，如果这个句柄的中断到了，就把它放到准备就绪list链表里。所以，当一个socket上有数据到了，内核在把网卡上的数据copy到内核中后就来把socket插入到准备就绪链表里了。

如此，一颗红黑树，一张准备就绪句柄链表，少量的内核cache，就帮我们解决了大并发下的socket处理问题。执行epoll_create时，创建了红黑树和就绪链表，执行epoll_ctl时，如果增加socket句柄，则检查在红黑树中是否存在，存在立即返回，不存在则添加到树干上，然后向内核注册回调函数，用于当中断事件来临时向准备就绪链表中插入数据。执行epoll_wait时立刻返回准备就绪链表里的数据即可。
最后看看epoll独有的两种模式LT和ET。无论是LT和ET模式，都适用于以上所说的流程。区别是，LT模式下，只要一个句柄上的事件一次没有处理完，会在以后调用epoll_wait时次次返回这个句柄，而ET模式仅在第一次返回。
这件事怎么做到的呢？当一个socket句柄上有事件时，内核会把该句柄插入上面所说的准备就绪list链表，这时我们调用epoll_wait，会把准备就绪的socket拷贝到用户态内存，然后清空准备就绪list链表，最后，epoll_wait干了件事，就是检查这些socket，如果不是ET模式（就是LT模式的句柄了），并且这些socket上确实有未处理的事件时，又把该句柄放回到刚刚清空的准备就绪链表了。
所以，非ET的句柄，只要它上面还有事件，epoll_wait每次都会返回。而ET模式的句柄，除非有新中断到，即使socket上的事件没有处理完，也是不会次次从epoll_wait返回的。
扩展阅读
Linux提供了select、poll、epoll接口来实现IO复用，三者的原型如下所示，本文从参数、实现、性能等方面对三者进行对比。
    int select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, struct timeval *timeout); 
    int poll(struct pollfd *fds, nfds_t nfds, int timeout);
    int epoll_wait(int epfd, struct epoll_event *events, int maxevents, int timeout);
select、poll、epoll_wait参数及实现对比:
select的第一个参数nfds为fdset集合中最大描述符值加1，fdset是一个位数组，其大小限制为__FD_SETSIZE（1024），位数组的每一位代表其对应的描述符是否需要被检查。
select的第二三四个参数表示需要关注读、写、错误事件的文件描述符位数组，这些参数既是输入参数也是输出参数，可能会被内核修改用于标示哪些描述符上发生了关注的事件。
所以每次调用select前都需要重新初始化fdset。
timeout参数为超时时间，该结构会被内核修改，其值为超时剩余的时间。
select对应于内核中的sys_select调用，sys_select首先将第二三四个参数指向的fd_set拷贝到内核，然后对每个被SET的描述符调用进行poll，并记录在临时结果中（fdset），如果有事件发生，select会将临时结果写到用户空间并返回；当轮询一遍后没有任何事件发生时，如果指定了超时时间，则select会睡眠到超时，睡眠结束后再进行一次轮询，并将临时结果写到用户空间，然后返回。 select返回后，需要逐一检查关注的描述符是否被SET（事件是否发生）。
poll与select不同，通过一个pollfd数组向内核传递需要关注的事件，故没有描述符个数的限制，pollfd中的events字段和revents分别用于标示关注的事件和发生的事件，故pollfd数组只需要被初始化一次。
poll的实现机制与select类似，其对应内核中的sys_poll，只不过poll向内核传递pollfd数组，然后对pollfd中的每个描述符进行poll，相比处理fdset来说，poll效率更高。 poll返回后，需要对pollfd中的每个元素检查其revents值，来得指事件是否发生。
epoll通过epoll_create创建一个用于epoll轮询的描述符，通过epoll_ctl添加/修改/删除事件，通过epoll_wait检查事件，epoll_wait的第二个参数用于存放结果。 epoll与select、poll不同，首先，其不用每次调用都向内核拷贝事件描述信息，在第一次调用后，事件信息就会与对应的epoll描述符关联起来。另外epoll不是通过轮询，而是通过在等待的描述符上注册回调函数，当事件发生时，回调函数负责把发生的事件存储在就绪事件链表中，最后写到用户空间。

