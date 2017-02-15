# ProjectBattle
整理和收集项目实战相关的资料

##背景

[加入一线企业，学习资料，面试必备](https://github.com/bat-battle/ProjectBattle/blob/master/blogs.md)

为了提高大家实际编程能力，同时拓宽大家的新技术，此项目旨在练习巩固大家已经掌握的知识，当然在此过程中，也会涉及一些新技术，希望可以借此项目，提高大家整体能力（架构设计，流程规范，沟通合作，编码实施，调试等），当然这个项目的自由度很高，自我发挥空间很大，主要看大家已有的技能和自由时间多少，而去自由组合并完成此项目。

此外，具备了一些开发技能后，期待顺利加入心仪企业就必须还要“学会如何准备面试”等技能，我们都知道校招和社招考察人才的出发点，
考察内容有很大不同。参加校招，除了要具备较好的基础知识（语言，数据结构，网络，unix/linux操作系统），能让面试官“看得上”的项目
也灰常重要，尤其是致力于一线，二线企业。而一两个“拿得出手”的项目，就像打仗的城墙堡垒（说碉堡更确切哦，因为你完全可以 隐蔽自己，不让敌人（面试官和其他参加面试的小伙伴）看到你的武器装备，你完全可以在你修建的碉堡里任何一个“枪口---你很有把握的知识点”去打游击战，从而至始自终，都可以把敌人（面试官）“带着”走，（因为项目是你自己做的，任何的技术点--都会成为你的“手雷”，你都早早准备ok）这样在整个面试交流中你就占有更多主动性。但如果你没有一款“拿得出手”的项目，那就只能上演我们银屏上最熟悉的一幕----直接拿着大刀和鬼子（这里说鬼子，确实不妥，抱歉。但找工作就是一场没有硝烟的战争）的AK47开撕了，那我只能祝你，好运。）

###看到这里，我应该送你一个福利了，QQ：82433422，微信:jie82433422 。

##目标
自由组队，从理解需求到架构设计，再到编码实施，或多或少完成其中的一些功能点即可。其次就是在这个过程中，可以接触到部分新的技术，希望同学们可以去认真研究其设计思想，架构流程等，从而提高自己对一个产品的整体考虑能力（安全－SQL和XSS等常见攻击，高性能，低延迟，高可用，稳定性，容错性，备份，水平扩展，垂直扩展等）。最终目的是帮助大家在来年校招打好一场漂亮仗，剑指国内知名企业，找到一个合适的大平台去历练自己，为终身规划迈出最重要的一步。

##涉及知识
###语言
c语言，c++，Java语言的一些特性，如智能指针，HashMap/HashMapHashTable等STL中多个容器的配合使用，c语言的多态（做到接口通用性），函数指针，有序双向链表。

###网络
熟悉windows/linux系统的五种网络模型，熟知每种模型的使用场景，ftp协议，p2p，http，https，tcp，udp等。

###操作系统
深入了解linux系统的通讯机制，进程，线程，微线程，协程，
纤程等区别于联系，以及多种通信机制的各自优劣。

###算法
分布式算法，基本数据结构，一致性hash，常见的对称、非对称加密算法等。

#其他
由于网络是不可靠的，故需要考虑核心消息的持久化，为了高并发选择消息的异步处理，为了整个架构可扩展性，为了与其他语言实现的系统通信等，都需要用到消息中间件（RabbitMQ、ActiveMQ，ZeroMQ，以及阿里巴巴的Metamorphosis，rocketMQ，kafka，jafka）；负载均衡（Nginx，Haproxy，LVS）和HA，缓存一致性等；


# 程序员修炼秘籍（未完）

> 一名JAVA程序员，将自己的编程学习之路做以总结并进行分享。内容包括但不限于数据结构、算法、数据库、操作系统、计算机网络等多方面。

## JAVA

### 关键字

void byte int long char short float double String StringBuffer StringBuilder Array Collection Collections List ArrayList LinkedList Vector Set HashMap TreeMap LinkedHashMap ConcerrentHashMap Set TreeMap HashMap synchronized volatile transient implements extends public private protected this super static final const null run start thread enmu quicksort mergesort heapsort bubblesort selectsort insertsort stack queue list heap tree avlTree Btree B+Tree RTree throw throws try catch finally break continue instanceof

### java基础

#### 概念

- 面向对象的三大基本特征、五大基本原则
- 面向过程、面向对象、基于对象和继承、派生、多态：http://www.i3geek.com/archives/580
- 编程思想，幻数：http://www.i3geek.com/archives/622

#### 集合类：

	http://www.i3geek.com/archives/616
	http://www.i3geek.com/archives/1233
 
- HashMap实现原理,源码阅读 http://www.i3geek.com/archives/1262
- HashMap中Key的约束
- HashMap与HashTable的区别
- HashMap与HashSet的关系:http://www.importnew.com/6931.html hashSet是由hashmap实现的
- HashSet的原理：http://www.importnew.com/19208.html
- ArrayList的用法
- List、Set和Map的继承关系
- Collection 和 Collections的区别
- 其他集合类

#### 继承和接口

- interface和abstrat class抽象类的意义与区别:http://www.i3geek.com/archives/1230
- 实现接口，继承类的规则（单继承多实现）
- 接口继承接口
- 继承多个抽象类？
- Overload和Override的区别。Overloaded的方法是否可以改变返回值的类型?
- 对String类的继承
- abstract的method是否可同时是static,是否可同时是native，是否可同时是synchronized
- 构造器Constructor是否可被override?

#### 异常处理

- Error、Exception和RuntimeException的区别，作用又是什么？列举3个以上的RuntimeException
- Java中的异常处理机制的简单原理和应用
- 内存溢出和内存泄露

#### 管道流

- inputStream和outputStream
- reader和inputstream
- Input/OutputStream和Reader/Writer有的区别
- 理解字符和字节
- 一层层的流结构学会字符流和字节流的转换

#### 线程

- 线程的生命周期：http://www.i3geek.com/archives/859
- java线程池：http://www.i3geek.com/archives/823
- 对run和start方法的理解
- 线程同步的基本方法
- 死锁的问题

#### 其他

- 四种引用，强引用、软引用、弱引用和虚引用 ：http://www.i3geek.com/archives/1239
- String与StringBuilder,StringBuffer的区别
- StringBuffer的实现方式，容量扩充
- 对于 String str ="1"+"2"; 产生了几个对象
- equal与==的区别
- hashCode的作用
- 为什么重写equals就必须重写hashCode
- 自动拆装箱：http://www.i3geek.com/archives/990
- NIO
- java动态代理
- 序列化与反序列化
- public、protected、private以及默认的作用域
- Object类的学习和理解，基本的方法
- char类型的大小，对汉字的存储
- java中传值和传引用的理解，四种引用
- 正则表达式

### Java进阶

#### 多线程

- 多线程要注意什么？
- volatile的关键字学习
- 多线程保证同步的所有方法，除了synchronized外还有什么？
- java中sleep和wait的区别：http://www.i3geek.com/archives/1173
- 理解和使用wait/notify
- 如何保证线程的同步和并发
- 守护线程的含义
- 正确的停止一个线程
- 对synchronized的理解，锁的是什么？锁静态方法和非静态方法的区别

#### 虚拟机

##### 内存结构

- 虚拟机的内存结构，堆内存、栈内存、方法区、常量池等：http://www.i3geek.com/archives/1201
- JVM中的内存设置和分配：http://www.i3geek.com/archives/1138
- 分别存储什么，对象和基本成员变量的存储区域

##### GC垃圾回收

`http://www.i3geek.com/archives/1220`

- gc的概念，什么需要回收？
- 怎么判断被回收？有哪些方法
- 引用计数方法，对象引用遍历和分代回收方法是什么
- 怎么避免对象循环引用的回收
- Java中的内存溢出是如何造成的：http://www.i3geek.com/archives/1241
- Java中的内存溢出和C＋＋中的内存溢出，是一个概念吗？：http://www.i3geek.com/archives/1241

##### CLASSLOADER

- 什么是类加载器
- 哪三层类加载器
- 什么加载顺序
- 功能是什么？工作模式是什么？
- 项目中的例子，加载必要jar包
- 反射的原理，什么是反射？
- 反射的运用，反射是否可以调用私有方法

#### 其他

- NIO是什么
- PRC远程服务原理及作用：http://www.i3geek.com/archives/941
- JMS消息服务框架
- io和nio的本质以及使用场景
- java 8的新特性
- hashcode 有哪些算法
- 泛型的实现机制
- Socket编程通常出现的异常有哪些，什么情况下会出现
- 了解JVM启动参数 -verbose -Xms -Xmx的意思

### J2EE

#### 基本概念

- 分清javaEE、Tomcat、JVM等概念：http://www.i3geek.com/archives/848

#### Servlet

- servlet的基本概念
- servlet的生命周期
- servlet中定制session的过期时间
- Servlet中的session工作原理 （禁用cookie如何使用session）
- filter和listener是什么？有什么区别？servlet、filter、listener：http://www.i3geek.com/archives/870
- JSP和Servlet的区别、共同点（JSP的工作原理）。

#### Web框架

- MVC模型概念
- Spring如何实现AOP和IOC的？- 
- Spring IoC 中的BeanFactory：http://www.i3geek.com/archives/878
- Spring AOP 原理：http://www.i3geek.com/archives/912
- Spring的事务管理 ，Spring bean注入的几种方式

#### web安全

- SQL注入
- XSS
- CSRF攻击
- DDos攻击

## 算法

### 排序

- 各种排序算法时间、空间复杂度和稳定性：http://www.i3geek.com/archives/733
- 列举所有的排序算法，深入理解分析
- 实现链表排序的一种算法
- 字符串(单链表)逆序

### 其他

- 深度优先搜索和广度优先搜索
- 使用栈实现链表/使用链表实现栈
- 二分查找：http://www.i3geek.com/archives/54
- KMP算法思想：http://www.i3geek.com/archives/755
- 随机函数过大：http://www.i3geek.com/archives/832
- 洗牌算法：http://www.i3geek.com/archives/1055
- 全排列、贪心算法、hash算法、海量数据处理

## 数据结构

- 队列、栈、链表、树、堆、图
- 栈：http://www.i3geek.com/archives/7
- 队列：http://www.i3geek.com/archives/21
- 有序表：http://www.i3geek.com/archives/48
- 链式队列：http://www.i3geek.com/archives/46
- 链式结构：http://www.i3geek.com/archives/52
- 链式栈：http://www.i3geek.com/archives/50
- 链式表：http://www.i3geek.com/archives/57
- 链表中的环：http://www.i3geek.com/archives/731
- 堆：http://www.i3geek.com/archives/682
- 栈和队列的相同和不同之处
- 栈通常采用的两种存储结构
- 各种树(平衡树,排序树,B树,B+树,R树,多路树,红黑树)树，多路树，B树：http://www.i3geek.com/archives/711
- 二叉树：http://www.i3geek.com/archives/702
- 二叉树的遍历实现：http://www.i3geek.com/archives/794
- ArrayList,Vector, LinkedList的存储性能和特性

## 计算机网络

- ip,tcp,udp,tcp/ip区别：http://www.i3geek.com/archives/1209
- 三次握手，四次关闭（为什么三次开始却要四次关闭），丢包,粘包，容量控制，拥塞控制
- HTTP请求和响应的全过程，和tcp/ip的关系：http://www.i3geek.com/archives/1213
- HTTP的返回码 2xx 3xx 4xx 5xx
- osi七层模型以及tcp/ip四层模型(每一层主要功能,传输的内容,主要协议,主要应用)
- 网划分
- session和cookie的区别:http://www.importnew.com/18943.html#comment-491318
- HTTP请求中Session实现原理(利用cookie）
- 如果客户端禁止Cookie能实现Session，cookie对session的影响
- http的get和post区别：http://www.i3geek.com/archives/182
- UDP穿透简要说明P2P：http://www.i3geek.com/archives/574
- HTTP的幂等性：http://www.i3geek.com/archives/841
- 正向代理、反向代理、透明代理以及cdn：http://www.i3geek.com/archives/1067

## 数据库

- 范式：http://www.i3geek.com/archives/108
- 什么是事务？事务的四种特性和应用：事务（transaction）是数据库管理系统的执行单位，可以是一个数据库操作（如Select操作）或者是一组操作序列。事务ACID属性，即原子性（Atomicity）、一致性(Consistency)、隔离性（Isolation）、持久性（Durability）。
- 乐观锁，悲观锁
- 表关联时，内连接，左连接，右连接怎么理解？
- 什么是索引以及索引的实现(B+树介绍、和B树、R树区别）（聚集和非聚集）：http://www.i3geek.com/archives/132
- 什么是视图，视图的作用，可以在视图上建立索引吗
- 数据库的分库分表：http://www.i3geek.com/archives/1108
- mysql的分库分表架构：http://www.i3geek.com/archives/1111
- 数据库隔离级别：隔离级别就是对对事务并发控制的等级。ANSI/ ISO SQL将其分为串行化（SERIALIZABLE）、可重复读（REPEATABLE READ）、读已提交（READ COMMITED）、读未提交（READ UNCOMMITED）四个等级

## 操作系统

- 分页分段是什么
- 虚拟内存管理
- 换页三种算法（LRU……）
- 进程间通信
- linux下列出几个比较常见的命令，并解释下命令的用法

## 设计模式

- 单例模式:http://www.importnew.com/18872.html
- 工厂模式、抽象工厂模式以及区别
- 装饰器模式：http://www.i3geek.com/archives/920

## C/C++

- 构造函数、析构函数是什么？
- 为什么不要在构造器中调用虚函数
- 为什么不要在析构函数中抛出异常
- 为什么使用补码
- C语言中的内存泄漏
- 进制转换
- 自己编写strlen/strcpy/strcmp
- CONST关键字：http://www.i3geek.com/archives/44
- 动态数组：http://www.i3geek.com/archives/61
- 指向函数的指针：http://www.i3geek.com/archives/63
- malloc、calloc和ralloc：http://www.i3geek.com/archives/101

## 项目

## 图书

- 《大型网站技术架构》：http://www.i3geek.com/archives/1140

## 扩展学习

- 云计算，分布式
- 高并发
- 高可用
- 可扩展
- 虚拟化
- 负载均衡
- git/svn的使用
- maven的使用

## 其他

- 一次宕机的解决过程：http://www.i3geek.com/archives/1191
- 加密算法，对称加密DES、AES和非对称加密RSA、DSA，不可逆加密MD5、SHA1
- 高内聚，低耦合方面的理解
- 设计模式的日常使用，举例说明
- 如何估算网站的最大并发数
- 设计一个秒杀系统
- 远程通信的方式及选择——RPC WebServer HttpRequest RMI JMS：http://www.i3geek.com/archives/1218

## 算法

主要使用的OJ是牛客网，源码部分在nowcoder中

- 递归完成前后中序的遍历
- 深度优先遍历（栈）、广度优先遍历（队列）
- 红黑树
- 排序算法：堆排序、归并排序、希尔排序
