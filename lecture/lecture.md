## 课堂笔记

### 基础

1. [java 体系](http://www.oracle.com/technetwork/java/javase/tech/index.html)
2. 不要害怕读 jdk 源码, 而且有些 jdk 必须读. 自行搜索如何获取 jdk 源码
3. 读[英文文档](https://docs.oracle.com/javase/7/docs/api/allclasses-noframe.html)
4. Socket, ServerSocket 文档, 注意 TCP_NODELAY
5. 创建线程两种方式(继承实现 run 方法, 实现 Runnable 接口), 另外一种后续介绍, Thread.sleep

### socket 模型

0. 同步异步, 阻塞非阻塞
1. 单线程多连接
2. 多线程每线程连接
3. IO 复用(关键词 select, poll, epoll), Reactor 模型

### 网络编程设计

1. 协议
2. 序列化, 反序列化(kyro)

[netty](https://github.com/netty/netty)
[kyro](https://github.com/EsotericSoftware/kryo)
[thrift](https://thrift.apache.org/)
[Protocol buffers](https://github.com/google/protobuf)


## Java 集合框架

CRUD for-each 迭代遍历

### 常用数据结构

1. Array

    固定大小, 动态扩容开销大
    查询快 O(1)
    插入慢 O(n)

2. List

    不固定大小, 动态扩容开销小
    查询慢 O(n)
    插入快 O(1)

3. Queue

    先进先出

4. Map

    哈希 + 散列

5. Stack

    后进先出

要求:

1. 正确选型;
2. 知道每个操作知道复杂度; removeAll, retainAll
3. 线程安全;
4. 副作用(可变对象与不可变对象) : subList, toArray, get, addAll

亮点 : 对并发修改会出现异常, 而不是默认什么也不做.

问题:

1. 数组元素如果设置为 null, 是否可以被 GC


### 基本字符操作

class String
abstract class AbstractStringBuilder
class StringBuffer extends AbstractStringBuilder
class StringBuilder extends AbstractStringBuilder : 创建字符优先考虑, 指定字符大小, 避免容量扩展
class System  : 最重要的 API 获取当前时间, 计算程序执行时间
class Math

### 集合通用操作

interface Collection<E> extends Iterable<E>

迭代器: interface Iterable<T>
序列化: Serializable
可关闭: Closeable
可克隆: Cloneable
随机访问: RandomAccess
可比较: Comparator<T>

class Collections
abstract class AbstractCollection<E> implements Collection<E>
abstract class AbstractSequentialList<E> extends AbstractList<E>
class Objects
class Properties extends Hashtable<Object,Object>
class Random implements java.io.Serializable
class ThreadLocalRandom extends Random

1. Collections :  sort, binarySearch, reverse, copy, Unmodifiable*, Synchronized*

### List

interface List<E> extends Collection<E>
interface ListIterator<E> extends Iterator<E>
abstract class AbstractList<E> extends AbstractCollection<E> implements List<E>
class ArrayList<E> extends AbstractList<E> implements List<E>, RandomAccess, Cloneable, Serializable : 最常用
class Arrays : Arrays.sort 是最常用的, 通过和 Comparator 结合对任意对象进行排序

1. AbstractCollection : toArray
2. AbstractList : 举例 subList(副作用), toArray, get
3. ArrayList 的 remove, clear, addAll, batchRemove, iterator 实现, 每次最少扩展 1.5 倍.
4. Arrays 不同对象类型的排序算法, 二分搜索, 不同类型的 hashCode
5. 如何在内部类调用外部了的同名函数: CLASSNAME.this.METHOD
6. Array.newInstance
7. DualPivotQuicksort

### Set

public interface Set<E> extends Collection<E>
abstract class AbstractSet<E> extends AbstractCollection<E> implements Set<E>
class HashSet<E> extends AbstractSet<E> implements Set<E>, Cloneable, Serializable
class LinkedList<E> extends AbstractSequentialList<E> implements List<E>, Deque<E>, Cloneable, Serializable
class LinkedHashSet<E> extends HashSet<E> implements Set<E>, Cloneable, Serializable

interface SortedSet<E> extends Set<E>
interface NavigableSet<E> extends SortedSet<E>
class TreeSet<E> extends AbstractSet<E> implements NavigableSet<E>, Cloneable, Serializable

abstract class EnumSet<E extends Enum<E>> extends AbstractSet<E> implements Cloneable, Serializable
class RegularEnumSet<E extends Enum<E>> extends EnumSet<E>

并发

class ConcurrentSkipListSet<E> extends AbstractSet<E> implements NavigableSet<E>, Cloneable, Serializable
class CopyOnWriteArrayList<E> implements List<E>, RandomAccess, Cloneable, Serializable
public class CopyOnWriteArraySet<E> extends AbstractSet<E> implements Serializable

### Queue

public interface Queue<E> extends Collection<E>
interface Deque<E> extends Queue<E>
abstract class AbstractQueue<E> extends AbstractCollection<E> implements Queue<E>
class ArrayDeque<E> extends AbstractCollection<E> implements Deque<E>, Cloneable, Serializable
class PriorityQueue<E> extends AbstractQueue<E> implements Serializable

并发

interface BlockingQueue<E> extends Queue<E>
interface BlockingDeque<E> extends BlockingQueue<E>, Deque<E>
class ArrayBlockingQueue<E> extends AbstractQueue<E> implements BlockingQueue<E>, Serializable
class ConcurrentLinkedDeque<E> extends AbstractCollection<E> implements Deque<E>, Serializable
class ConcurrentLinkedQueue<E> extends AbstractQueue<E> implements Queue<E>, Serializable
class DelayQueue<E extends Delayed> extends AbstractQueue<E> implements BlockingQueue<E>
class LinkedBlockingDeque<E> extends AbstractQueue<E> implements BlockingDeque<E>,  Serializable
class LinkedBlockingQueue<E> extends AbstractQueue<E> implements BlockingQueue<E>, Serializable
class LinkedTransferQueue<E> extends AbstractQueue<E> implements TransferQueue<E>, Serializable
class PriorityBlockingQueue<E> extends AbstractQueue<E> implements BlockingQueue<E>, Serializable
class SynchronousQueue<E> extends AbstractQueue<E> implements BlockingQueue<E>, Serializable
interface TransferQueue<E> extends BlockingQueue<E>

### Stack

class Stack<E> extends Vector<E>
public class Vector<E> extends AbstractList<E> implements List<E>, RandomAccess, Cloneable, Serializable

### Map

interface Map<K,V>
abstract class Dictionary<K,V>
abstract class AbstractMap<K,V> implements Map<K,V>
class HashMap<K,V> extends AbstractMap<K,V> implements Map<K,V>, Cloneable, Serializable
class Hashtable<K,V> extends Dictionary<K,V> implements Map<K,V>, Cloneable, Serializable
class LinkedHashMap<K,V> extends HashMap<K,V> implements Map<K,V>
class WeakHashMap<K,V> extends AbstractMap<K,V> implements Map<K,V>

class TreeMap<K,V> extends AbstractMap<K,V> implements NavigableMap<K,V>, Cloneable, Serializable
interface SortedMap<K,V> extends Map<K,V>
interface NavigableMap<K,V> extends SortedMap<K,V>
class EnumMap<K extends Enum<K>, V> extends AbstractMap<K, V> implements Serializable, Cloneable

并发

interface ConcurrentMap<K, V> extends Map<K, V>
interface ConcurrentNavigableMap<K,V> extends ConcurrentMap<K,V>, NavigableMap<K,V>
class ConcurrentHashMap<K, V> extends AbstractMap<K, V> implements ConcurrentMap<K, V>, Serializable

class ConcurrentSkipListMap<K,V> extends AbstractMap<K,V> implements ConcurrentNavigableMap<K,V>, Cloneable, Serializable

### 其他

class BitSet implements Cloneable, java.io.Serializable

### 多线程

interface Callable<V>
interface RunnableFuture<V> extends Runnable, Future<V>
interface RunnableScheduledFuture<V> extends RunnableFuture<V>, ScheduledFuture<V>
interface ThreadFactory

interface CompletionService<V>
class ExecutorCompletionService<V> implements CompletionService<V>

class CountDownLatch
class CyclicBarrier
class Exchanger<V>
class Semaphore implements Serializable
enum TimeUnit

interface Executor
interface ExecutorService extends Executor
interface ScheduledExecutorService extends ExecutorService
abstract class AbstractExecutorService implements ExecutorService
class ForkJoinPool extends AbstractExecutorService
class ThreadPoolExecutor extends AbstractExecutorService
class ScheduledThreadPoolExecutor extends ThreadPoolExecutor implements ScheduledExecutorService
class Executors

interface Future<V>
interface Delayed extends Comparable<Delayed>
interface ScheduledFuture<V> extends Delayed, Future<V>
abstract class ForkJoinTask<V> implements Future<V>, Serializable
abstract class RecursiveAction extends ForkJoinTask<Void>
abstract class RecursiveTask<V> extends ForkJoinTask<V>

class ForkJoinWorkerThread extends Thread
class FutureTask<V> implements RunnableFuture<V>
