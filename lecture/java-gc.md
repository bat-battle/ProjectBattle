
## 例子

java version "1.7.0_79"
Java(TM) SE Runtime Environment (build 1.7.0_79-b15)
Java HotSpot(TM) 64-Bit Server VM (build 24.79-b02, mixed mode)

### 例1

```
class GCEden {
    static public void main(String []args) {
    }
}
```

1. javac GCEden

2. java -verbose:gc -XX:+UseSerialGC -Xms20M -Xmx20M -Xmn10M -XX:+PrintGCDetails -XX:SurvivorRatio=8 GCEden

    Heap
     def new generation   total 9216K, used 671K [0x00000000fec00000, 0x00000000ff600000, 0x00000000ff600000)
      eden space 8192K,   8% used [0x00000000fec00000, 0x00000000feca7fd8, 0x00000000ff400000)
      from space 1024K,   0% used [0x00000000ff400000, 0x00000000ff400000, 0x00000000ff500000)
      to   space 1024K,   0% used [0x00000000ff500000, 0x00000000ff500000, 0x00000000ff600000)
     tenured generation   total 10240K, used 0K [0x00000000ff600000, 0x0000000100000000, 0x0000000100000000)
       the space 10240K,   0% used [0x00000000ff600000, 0x00000000ff600000, 0x00000000ff600200, 0x0000000100000000)
     Metaspace       used 2471K, capacity 4486K, committed 4864K, reserved 1056768K
      class space    used 267K, capacity 386K, committed 512K, reserved 1048576K


其中:

* 新生代(new generation): 9216 = 8192(8M) + 1024(1M)
* 老年代(tenured generation): 10240(10M)
* 空类, 占用 eden 区域 671k

注: 多执行几次 2, 发现 Metaspace used 在发生变化 !!!!


3. java -verbose:gc -XX:+UseSerialGC -Xms20M -Xmx20M -Xmn10M -XX:+PrintGCDetails -XX:SurvivorRatio=8 GCEden

    Heap
     def new generation   total 9216K, used 655K [0x00000000f9a00000, 0x00000000fa400000, 0x00000000fa400000)
      eden space 8192K,   8% used [0x00000000f9a00000, 0x00000000f9aa3f18, 0x00000000fa200000)
      from space 1024K,   0% used [0x00000000fa200000, 0x00000000fa200000, 0x00000000fa300000)
      to   space 1024K,   0% used [0x00000000fa300000, 0x00000000fa300000, 0x00000000fa400000)
     tenured generation   total 10240K, used 0K [0x00000000fa400000, 0x00000000fae00000, 0x00000000fae00000)
       the space 10240K,   0% used [0x00000000fa400000, 0x00000000fa400000, 0x00000000fa400200, 0x00000000fae00000)
     compacting perm gen  total 21248K, used 2431K [0x00000000fae00000, 0x00000000fc2c0000, 0x0000000100000000)
       the space 21248K,  11% used [0x00000000fae00000, 0x00000000fb05fca0, 0x00000000fb05fe00, 0x00000000fc2c0000)
    No shared spaces configured.



### 例 2

```
class GCEden {
    void test() {
    }

    static public void main(String []args) {
        new GCEden().test();
    }
}
```

1. javac GCEden.java

2. java -verbose:gc -XX:+UseSerialGC -Xms20M -Xmx20M -Xmn10M -XX:+PrintGCils -XX:SurvivorRatio=8 GCEden

    Heap
     def new generation   total 9216K, used 671K [0x00000000fec00000, 0x00000000ff600000, 0x00000000ff600000)
      eden space 8192K,   8% used [0x00000000fec00000, 0x00000000feca7fd8, 0x00000000ff400000)
      from space 1024K,   0% used [0x00000000ff400000, 0x00000000ff400000, 0x00000000ff500000)
      to   space 1024K,   0% used [0x00000000ff500000, 0x00000000ff500000, 0x00000000ff600000)
     tenured generation   total 10240K, used 0K [0x00000000ff600000, 0x0000000100000000, 0x0000000100000000)
       the space 10240K,   0% used [0x00000000ff600000, 0x00000000ff600000, 0x00000000ff600200, 0x0000000100000000)
     Metaspace       used 2471K, capacity 4486K, committed 4864K, reserved 1056768K
      class space    used 267K, capacity 386K, committed 512K, reserved 1048576K

3. java -verbose:gc -XX:+UseSerialGC -Xms20M -Xmx20M -Xmn10M -XX:+PrintGCDetails -XX:SurvivorRatio=8 GCEden

    Heap
     def new generation   total 9216K, used 655K [0x00000000f9a00000, 0x00000000fa400000, 0x00000000fa400000)
      eden space 8192K,   8% used [0x00000000f9a00000, 0x00000000f9aa3f18, 0x00000000fa200000)
      from space 1024K,   0% used [0x00000000fa200000, 0x00000000fa200000, 0x00000000fa300000)
      to   space 1024K,   0% used [0x00000000fa300000, 0x00000000fa300000, 0x00000000fa400000)
     tenured generation   total 10240K, used 0K [0x00000000fa400000, 0x00000000fae00000, 0x00000000fae00000)
       the space 10240K,   0% used [0x00000000fa400000, 0x00000000fa400000, 0x00000000fa400200, 0x00000000fae00000)
     compacting perm gen  total 21248K, used 2431K [0x00000000fae00000, 0x00000000fc2c0000, 0x0000000100000000)
       the space 21248K,  11% used [0x00000000fae00000, 0x00000000fb05ff18, 0x00000000fb060000, 0x00000000fc2c0000)
    No shared spaces configured.


结果同例 1

### 例 3

```
public class GCEden {
    private static final int _1MB = 1024 * 1024;

    public void testEden() {
        byte[] allocation1, allocation2, allocation3, allocation4;
        allocation1 = new byte[3 * _1MB];
        allocation2 = new byte[2 * _1MB];
        allocation3 = new byte[2 * _1MB];
    }

    void test() {
        testEden();
    }

    public static void main(String[] args) {
        new GCEden().test();
    }
}
```

1. javac GCEden.java

2. java -verbose:gc -XX:+UseSerialGC -Xms20M -Xmx20M -Xmn10M -XX:+PrintGCils -XX:SurvivorRatio=8 GCEden

    Heap
     def new generation   total 9216K, used 7840K [0x00000000fec00000, 0x00000000ff600000, 0x00000000ff600000)
      eden space 8192K,  95% used [0x00000000fec00000, 0x00000000ff3a8008, 0x00000000ff400000)
      from space 1024K,   0% used [0x00000000ff400000, 0x00000000ff400000, 0x00000000ff500000)
      to   space 1024K,   0% used [0x00000000ff500000, 0x00000000ff500000, 0x00000000ff600000)
     tenured generation   total 10240K, used 0K [0x00000000ff600000, 0x0000000100000000, 0x0000000100000000)
       the space 10240K,   0% used [0x00000000ff600000, 0x00000000ff600000, 0x00000000ff600200, 0x0000000100000000)
     Metaspace       used 2471K, capacity 4486K, committed 4864K, reserved 1056768K
      class space    used 267K, capacity 386K, committed 512K, reserved 1048576K

程序运行完, 总共申请内存 7168 + 671 = 7839, 为什么这里是 7840 ?


3. java -verbose:gc -XX:+UseSerialGC -Xms20M -Xmx20M -Xmn10M -XX:+PrintGCDetails -XX:SurvivorRatio=8 GCEden

    Heap
     def new generation   total 9216K, used 7823K [0x00000000f9a00000, 0x00000000fa400000, 0x00000000fa400000)
      eden space 8192K,  95% used [0x00000000f9a00000, 0x00000000fa1a3f48, 0x00000000fa200000)
      from space 1024K,   0% used [0x00000000fa200000, 0x00000000fa200000, 0x00000000fa300000)
      to   space 1024K,   0% used [0x00000000fa300000, 0x00000000fa300000, 0x00000000fa400000)
     tenured generation   total 10240K, used 0K [0x00000000fa400000, 0x00000000fae00000, 0x00000000fae00000)
       the space 10240K,   0% used [0x00000000fa400000, 0x00000000fa400000, 0x00000000fa400200, 0x00000000fae00000)
     compacting perm gen  total 21248K, used 2431K [0x00000000fae00000, 0x00000000fc2c0000, 0x0000000100000000)
       the space 21248K,  11% used [0x00000000fae00000, 0x00000000fb05ff50, 0x00000000fb060000, 0x00000000fc2c0000)
    No shared spaces configured.


程序运行完, 总共申请内存 7168 + 655 = 7823

### 例 4

```
public class GCEden {
    private static final int _1MB = 1024 * 1024;

    public void testEden() {
        byte[] allocation1, allocation2, allocation3, allocation4;
        allocation1 = new byte[3 * _1MB];
        allocation2 = new byte[2 * _1MB];
        allocation3 = new byte[2 * _1MB];
        allocation4 = new byte[369 * 1024];
    }

    void test() {
        testEden();
    }

    public static void main(String[] args) {
        new GCEden().test();
    }
}
```

1. javac GCEden.java

2. java -verbose:gc -XX:+UseSerialGC -Xms20M -Xmx20M -Xmn10M -XX:+PrintGCDetails -XX:SurvivorRatio=8 GCEden

    Heap
     def new generation   total 9216K, used 8192K [0x00000000f9a00000, 0x00000000fa400000, 0x00000000fa400000)
      eden space 8192K, 100% used [0x00000000f9a00000, 0x00000000fa200000, 0x00000000fa200000)
      from space 1024K,   0% used [0x00000000fa200000, 0x00000000fa200000, 0x00000000fa300000)
      to   space 1024K,   0% used [0x00000000fa300000, 0x00000000fa300000, 0x00000000fa400000)
     tenured generation   total 10240K, used 0K [0x00000000fa400000, 0x00000000fae00000, 0x00000000fae00000)
       the space 10240K,   0% used [0x00000000fa400000, 0x00000000fa400000, 0x00000000fa400200, 0x00000000fae00000)
     compacting perm gen  total 21248K, used 2431K [0x00000000fae00000, 0x00000000fc2c0000, 0x0000000100000000)
       the space 21248K,  11% used [0x00000000fae00000, 0x00000000fb05ff50, 0x00000000fb060000, 0x00000000fc2c0000)
    No shared spaces configured.

### 例 5

```
public class GCEden {
    private static final int _1MB = 1024 * 1024;

    public void testEden() {
        byte[] allocation1, allocation2, allocation3, allocation4;
        allocation1 = new byte[3 * _1MB];
        allocation2 = new byte[2 * _1MB];
        allocation3 = new byte[2 * _1MB];
        allocation4 = new byte[369 * 1024];
    }

    void test() {
        testEden();
        //继续增加 162 仍然不 GC
        byte[] allocation1 = new byte[162 * 1024];
    }

    public static void main(String[] args) {
        new GCEden().test();
    }
}
```

1. javac GCEden.java

2. java -verbose:gc -XX:+UseSerialGC -Xms20M -Xmx20M -Xmn10M -XX:+PrintGCDetails -XX:SurvivorRatio=8 GCEden

    Heap
     def new generation   total 9216K, used 8192K [0x00000000f9a00000, 0x00000000fa400000, 0x00000000fa400000)
      eden space 8192K, 100% used [0x00000000f9a00000, 0x00000000fa200000, 0x00000000fa200000)
      from space 1024K,   0% used [0x00000000fa200000, 0x00000000fa200000, 0x00000000fa300000)
      to   space 1024K,   0% used [0x00000000fa300000, 0x00000000fa300000, 0x00000000fa400000)
     tenured generation   total 10240K, used 0K [0x00000000fa400000, 0x00000000fae00000, 0x00000000fae00000)
       the space 10240K,   0% used [0x00000000fa400000, 0x00000000fa400000, 0x00000000fa400200, 0x00000000fae00000)
     compacting perm gen  total 21248K, used 2431K [0x00000000fae00000, 0x00000000fc2c0000, 0x0000000100000000)
       the space 21248K,  11% used [0x00000000fae00000, 0x00000000fb05ff68, 0x00000000fb060000, 0x00000000fc2c0000)
    No shared spaces configured.

其中 8192 = 655 + 7*1024 + 369 = 8190, 2 byte 哪里去了?

### 例 6


```
public class GCEden {
    private static final int _1MB = 1024 * 1024;

    public void testEden() {
        byte[] allocation1, allocation2, allocation3, allocation4;
        allocation1 = new byte[3 * _1MB];
        allocation2 = new byte[2 * _1MB];
        allocation3 = new byte[2 * _1MB];
        allocation4 = new byte[369 * 1024];
    }

    void test() {
        testEden();
        //继续增加 163 开始 GC
        byte[] allocation1 = new byte[163 * 1024];
    }

    public static void main(String[] args) {
        new GCEden().test();
    }
}
```

1. javac GCEden.java

2. java -verbose:gc -XX:+UseSerialGC -Xms20M -Xmx20M -Xmn10M -XX:+PrintGCDetails -XX:SurvivorRatio=8 GCEden

    [GC[DefNew: 8191K->214K(9216K), 0.0023280 secs] 8191K->214K(19456K), 0.0024040 secs] [Times: user=0.00 sys=0.00, real=0.01 secs]
    Heap
     def new generation   total 9216K, used 462K [0x00000000f9a00000, 0x00000000fa400000, 0x00000000fa400000)
      eden space 8192K,   3% used [0x00000000f9a00000, 0x00000000f9a3de78, 0x00000000fa200000)
      from space 1024K,  20% used [0x00000000fa300000, 0x00000000fa335a38, 0x00000000fa400000)
      to   space 1024K,   0% used [0x00000000fa200000, 0x00000000fa200000, 0x00000000fa300000)
     tenured generation   total 10240K, used 0K [0x00000000fa400000, 0x00000000fae00000, 0x00000000fae00000)
       the space 10240K,   0% used [0x00000000fa400000, 0x00000000fa400000, 0x00000000fa400200, 0x00000000fae00000)
     compacting perm gen  total 21248K, used 2431K [0x00000000fae00000, 0x00000000fc2c0000, 0x0000000100000000)
       the space 21248K,  11% used [0x00000000fae00000, 0x00000000fb05ff60, 0x00000000fb060000, 0x00000000fc2c0000)
    No shared spaces configured.

其中

1. 由于分配失败导致 GC, DefNew 表示 Serial Young GC
2. 7931 = 671 +
3. 19456 = 10240 + 9216

### 例 6

```
public class GCEden {
    private static final int _1MB = 1024 * 1024;

    public void testEden() {
        byte[] allocation1, allocation2, allocation3, allocation4;
        allocation1 = new byte[3 * _1MB];
        allocation2 = new byte[2 * _1MB];
        allocation3 = new byte[2 * _1MB];
        allocation4 = new byte[369 * 1024];
        byte[] allocation5 = new byte[163 * 1024];
        byte[] allocation6 = new byte[163 * 1024];
    }

    void test() {
        testEden();
    }

    public static void main(String[] args) {
        new GCEden().test();
    }
}
```

1. javac GCEden.java

2. java -verbose:gc -XX:+UseSerialGC -Xms20M -Xmx20M -Xmn10M -XX:+PrintGCDetails -XX:SurvivorRatio=8 GCEden

    [GC[DefNew: 8191K->747K(9216K), 0.0072140 secs] 8191K->7915K(19456K), 0.0072940 secs] [Times: user=0.01 sys=0.00, real=0.01 secs]
    Heap
     def new generation   total 9216K, used 1076K [0x00000000f9a00000, 0x00000000fa400000, 0x00000000fa400000)
      eden space 8192K,   4% used [0x00000000f9a00000, 0x00000000f9a522c0, 0x00000000fa200000)
      from space 1024K,  72% used [0x00000000fa300000, 0x00000000fa3bad70, 0x00000000fa400000)
      to   space 1024K,   0% used [0x00000000fa200000, 0x00000000fa200000, 0x00000000fa300000)
     tenured generation   total 10240K, used 7168K [0x00000000fa400000, 0x00000000fae00000, 0x00000000fae00000)
       the space 10240K,  70% used [0x00000000fa400000, 0x00000000fab00030, 0x00000000fab00200, 0x00000000fae00000)
     compacting perm gen  total 21248K, used 2431K [0x00000000fae00000, 0x00000000fc2c0000, 0x0000000100000000)
       the space 21248K,  11% used [0x00000000fae00000, 0x00000000fb05ff70, 0x00000000fb060000, 0x00000000fc2c0000)
    No shared spaces configured.

在 testEden 方法内部进行 GC,

1. 7168K(7 M) 直接进入老年代
2. 新生代
3. 1076 - 747 = 329(163+163+4)


### 例 7

```
public class GCEden {
    private static final int _1MB = 1024 * 1024;

    public void testEden() {
        byte[] allocation1, allocation2, allocation3, allocation4;
        allocation1 = new byte[3 * _1MB];
        allocation2 = new byte[2 * _1MB];
        allocation3 = new byte[2 * _1MB];
        allocation4 = new byte[369 * 1024];
        //byte[] allocation5 = new byte[163 * 1024];
        //byte[] allocation6 = new byte[163 * 1024];
    }

    void test() {
        testEden();
        byte[] allocation1 = new byte[163 * 1024];
    }

    public static void main(String[] args) {
        new GCEden().test();
        new GCEden().test();
        new GCEden().test();
    }
}
```

1. javac GCEden.java

2. java -verbose:gc -XX:+UseSerialGC -Xms20M -Xmx20M -Xmn10M -XX:+PrintGCDetails -XX:SurvivorRatio=8 GCEden

    [GC[DefNew: 8191K->215K(9216K), 0.0037780 secs] 8191K->215K(19456K), 0.0038760 secs] [Times: user=0.01 sys=0.00, real=0.01 secs]
    [GC[DefNew: 8084K->214K(9216K), 0.0024080 secs] 8084K->214K(19456K), 0.0025010 secs] [Times: user=0.00 sys=0.00, real=0.01 secs]
    Heap
     def new generation   total 9216K, used 8053K [0x00000000f9a00000, 0x00000000fa400000, 0x00000000fa400000)
      eden space 8192K,  95% used [0x00000000f9a00000, 0x00000000fa1a7858, 0x00000000fa200000)
      from space 1024K,  20% used [0x00000000fa200000, 0x00000000fa235ba8, 0x00000000fa300000)
      to   space 1024K,   0% used [0x00000000fa300000, 0x00000000fa300000, 0x00000000fa400000)
     tenured generation   total 10240K, used 0K [0x00000000fa400000, 0x00000000fae00000, 0x00000000fae00000)
       the space 10240K,   0% used [0x00000000fa400000, 0x00000000fa400000, 0x00000000fa400200, 0x00000000fae00000)
     compacting perm gen  total 21248K, used 2431K [0x00000000fae00000, 0x00000000fc2c0000, 0x0000000100000000)
       the space 21248K,  11% used [0x00000000fae00000, 0x00000000fb05ff78, 0x00000000fb060000, 0x00000000fc2c0000)
    No shared spaces configured.
