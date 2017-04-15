
## java 从源代码到机器码

    .java -> .class ->  类加载
    .ruby               运行    实例化
    .scala                      执行方法    解释执行
                                            编译执行

## 为什么需要字节码 ?

JVM 是对 C/C++ 语言的一层抽象, 实现了如下两点

平台无关: 实现跨平台, HP-UX, Linux, Unix, windows
语言无关: Java, Jruby, Jython, Scala, Clojure、Groovy

任何一门新的语言, 如果有 GC, 跨平台的需求, 是否要基于 JVM 都是必须要考量的

此外, jvm 设计之初就将 java 和 jvm 分开, 比如有 <<Java 语言规范>>, <<Java 虚拟机规范>>

还需要注意的是, jvm 只是规范, 具体实现 jvm 规范的虚拟机并不只有一种,
目前主流的就是 HotSpot, 但还有其他虚拟机, 比如 IBM JRockit, Azell

Class文件格式所具备的平台中立(不依赖于特定硬件及操作系统)、紧凑、稳定和可扩
展的特点,是Java技术体系实现平台无关、语言无关两项特性的重要支柱。

## class 文件格式分析

**格式**

* 无符号数
* 表是由多个无符号数或者其他表作为数据项构成的复合数据类型

一个 class 文件的格式的属性依次为:

* magic : 0xCAFEBABE
* minor_version :
* major_version : 从 45 开始, 1.7 -> 0x33, 1.8 -> 0x34
* constant_pool_count
* constant_pool : 从 1 开始, 0 表示 null; 14 种
* access_flags
* this_class
* super_class
* interfaces_count
* interfaces
* fields_count
* fields
* methods_count
* methods
* attributes_count
* attributes

```
final public class TestClass {
    private final int m = 1;
    public int inc() {
        return m+1;
    }
}
```

自己找一个类文件, 编译后, 通过反编译, 通过查表分析 class 文件格式

练习:

编译 TestClass.java 之后,

* javap -v TestClass.class
* vim -b TestClass.class 之后 执行 %!xxb 转换为 16 进制

两个窗口, 分别打开, 分析 class 格式.

## 字节码执行

Opcode(操作码) + Operands(操作数,0~N个)

do {
    自动计算 PC 寄存器的值加 1;
    根据 PC 寄存器的指示位置, 从字节码流中取出操作码;
    if (字节码存在操作数) 从字节流中取出操作数;
    执行操作码所定义的操作;
} while (字节码流长度 > 0)

所有指令都是对"操作数栈"和"局部变量表"的操作

load : 将局部变量加载到操作数栈
store: 将操作数栈存储到局部变量表.

为了帮助理解, 可以将操作数栈理解为 CPU, 所有计算在操作数栈中进行,
局部变量为存储, 计算结果存储到局部变量表中

运算指令: iadd, isub, imul, idiv, irem, ineg, ishl, ior, iand, ixor, iinc, dcmpg
类型转换指令: i2b i2c i2s l2i
对象创建与访问指令: getfield, putfield, new, newarray, instanceof
操作数栈管理指令: swap, dup, pop
控制指令转移: ifeq, iflt, ifnull, ifnonull, if_icmpeq, tableswitch, goto, ret
方法调用和返回指令: invokevirtual, invokespecial, ireturn, return
异常处理指令: athrow
同步指令: monitorenter, monitorexit (Javac 与 jvm 共同完成)

问题

指令集基于栈和基于寄存器的区别


练习

参考书后面的字节码附录, 实验除浮点相关的指令(比如 tableswitch, lookupswitch, lshr,
lshl lushr, new, invoke* 等相关指令.), 并关注 1. 栈 2. 局部变量表 的变化

5. 类加载

问题:

* class 的可能来源
* 类加载与加载的关系
* 从面向对象的角度, java 类与 C++ 类貌似存在某种对应关系, 事实是否是这样 ?  对象加对象指针模式 /hotspot/src/share/vm/oops
* 保证方法体中的类型转换是有效的是在什么阶段执行的 ?
* 类构造器(<cinit>()) 与类实例构造器不同之处在哪 ?
* iterface 与 class 中定义的静态变量区别?
* 类加载过程
* 为什么需要自定义类加载器 ? 从网上下载, 动态生成, 热替换, 模块系统(多版本共存), JNI 库
* 如何正确地自定义类加载器, 破坏双亲委派会造成什么风险?

JVM 将 class 读入内存, 对 class 进行校验，转换解析和初始化, 最终形成可以被虚拟机
使用的 Java 类型, 这就是虚拟机的类加载机制

Java 语言里类的加载, 连接和初始化过程都是在程序运行期间完成的，这种策略虽然会令
类加载时稍微增加一些性能开销，但是为 Java 应用程序提供高度的灵活性, Java 里天生
可以动态扩展的语言特性就是依赖有哪些时动态加载和动态连接这个特点实现的.


                 +---------------- 连 接  ------------------+
                 |                                          |
    +---------+  | +---------+   +----------+   +---------+ |
    |         |  | |         |   |          |   |         | |
    |  加载   +---->  验证   +--->   准备   +--->  解析   | |
    |         |  | |         |   |          |   |         | |
    +---------+  | +---------+   +----------+   +---------+ |
                 +------------------------------------------+
                   +---------+   +----------+   +----v----+
                   |         |   |          |   |         |
                   |   卸载  <---+   使用   <---+ 初始化  |
                   |         |   |          |   |         |
                   +---------+   +----------+   +---------+

 加载 -> 验证 -> 准备 -> 解析 -> 初始化 -> 使用 -> 卸载

初始化阶段, 有且只有5种情况必须立即对类进行初始化

1. 遇到 new, getstatic, putstatic, invokestatic
2. 使用 java.lang.reflect 包的方法对类进行反射调用的时候
3. 初始化一个类的时候, 如果发现其父类没有初始化, 必须先触发父类初始化
4. 当虚拟机运行时, 用户需要指定一个要执行的主类(main 方法), Jvm 会先初始化这个主类
5. 如果一个 java.lang.invoke.MethodHandle 实例最后解析结果 REF_getStatic,
   REF_putStatic, REF_invokeStatic 的方法句柄, 并且这个方法句柄对应的类没有进行
   初始化, 则先要触发其初始化

接口与类真正有所区别的是前面讲述的5种 "有且仅有" 需要开始初始化场景中的第3种:
当一个类在初始化时,要求其父类全部都已经初始化过了,但是一个接口在初始化时,
并不要求其父接口全部都完成了初始化,只有在真正使用到父接口的时候(如引用接口
中定义的常量)才会初始化。

加载:

1. 通过类的全限定名来获取定义此类的二进制流(文件, 网络, 动态生成等)
2. 将这个二进制流代表的静态存储结构转化为方法取的运行时数据结构;
3. 在内存中生成一个代表这个类的 java.lang.Class 对象, 作为方法区这个类的各种数据的访问入口

验证:

1. 文件格式验证 : 该阶段验证后进入内存存储区域
2. 元数据验证: 类的元数据信息进行语义验证
3. 字节码验证: 数据流和控制流分析
4. 符号引用验证: 对类自身置为的信息进行匹配性校验

准备:

为类变量(静态变量)在方法区中分配内存并设置类变量的初始值, 对于实例变量并不在该阶段初始化

对于非 final 修饰的变量初始化为各种类型的零值
对于 final 修饰的变量初始化为实际的值

解析:

将常量池内的符号引用转为直接引用

符号引用: class 文件中对象的限定名, 与虚拟机实现的内存布局无关
直接引用: 对象在内存中的指针, 与虚拟机实现的内存布局相关

在执行anewarray、checkcast、getfield、getstatic、instanceof、invokedynamic、invokeinterface、
invokespecial、invokestatic、invokevirtual、ldc、ldc_w、multianewarray、new、putfield 和
putstatic 这 16 个用于操作符号引用的字节码指令之前,先对它们所使用的符号引用进行解析

主要解析: CONSTANT_Class_info, CONSTANT_Fieldref_info, CONSTANT_Methodref_info
CONSTANT_InterfaceMethodref, CONSTANT_MethodType_info, CONSTANT_MethodHandle_info
CONSTANT_InvokeDynamic_info

解析动作主要针对类或接口、字段、类方法、接口方法、方法类型、方法句柄和调用点
限定符7类符号引用进行,分别对应于常量池的CONSTANT_Class_info、
CONSTANT_Fieldref_info、CONSTANT_Methodref_info、
CONSTANT_InterfaceMethodref_info、CONSTANT_MethodType_info、
CONSTANT_MethodHandle_info和CONSTANT_InvokeDynamic_info 7种常量类型


初始化:

执行类的构造器 <clinit>()

* 类变量和静态语句块赋值, 以出现在源文件的顺序初始化; 注意赋值而不是定义
* 静态语句块只能访问到定义静态语句块之前的变量, 定义在它之后的只能赋值不能访问
* 虚拟机会保证在子类的 <clinit>() 方法执行之前, 父类的 <clinit>() 方法已经执行完毕, 这点与类实例构造器不同
* 父类的 <clinit>() 优先于子类的 <clinit>(), 因此父类定义的静态变量优先于子类
* 如果一个类没有静态语句块, 也没有赋值操作, 编译器可以不为这个类生成 <clinit>() 方法
* 接口的初始化不需要执行父接口的 <clinit>(), 类的 <clinit>() 不需要执行实现接口的 <clinit>()
* clinit 存在多线程初始化阻塞的坑(长时间的阻塞操作会导致多个线程初始化)
* 同一个类加载器下,一个类型只会初始化一次。
* 如何解决多版本问题? 多个父加载器

```
class ClassInit {

    static int k = 0;
    static {
        i = 2;
        //j = i;
        j = k;
        //System.out.println(i);
        //System.out.println(j);
        //System.out.println(k);
    }
    static int i;
    static int j = 3;

    public static void main(String []args) {
        System.out.println(ClassInit.k);
        System.out.println(ClassInit.i);
        System.out.println(ClassInit.j);
    }
}
```

对比类和接口中的静态变量的区别 ?

class ClassInit1 {
    static final int var = 1;
    static int var2 = 2; //该变量增加 final 后, 反编译代码发生了什么变化? 没有 static {} 代码
}

interface IClassInit1 {
    static final int var = 1;
    static int var1 = 2;
}

interface 和类中 static 变量的区别 ?
interface 中所有 static 变量自动增加 final, 因此也就不能存在 static 变量的初始化

```
class ClassInit2 {

    static final int k = 0;
    static {
        i = 2;
    }
    static final int i;
    static final int j = 3;

    public static void main(String []args) {
    }
}

class ClassInit3 {

    static final int k = 0;
    static final int i = 2;
    static final int j = 3;

    public static void main(String []args) {
    }
}
```

final 修饰的静态变量并不会生成 static {} 代码, 即不会有类构造函数, 原因是
final 修饰的静态变量在准备阶段已经初始化, 在初始化阶段不需要做任何事情


```
class ClassInit4 {

    static int k = 0;
    static {
        i = 2;
        j = k;
        //k = l; //注释后是否可以编译通过, 为什么
    }
    {
        //k = l;  //注释后编译是否可以通过, 对结果有什么影响
    }
    static int i;
    static int j = 3;
    static final int l = 4;

    public static void main(String []args) {
        System.out.println(i);
        System.out.println(j);
        System.out.println(k);
        System.out.println(l);
        new ClassInit4();
        System.out.println(i);
        System.out.println(j);
        System.out.println(k);
        System.out.println(l);
    }
}
```

类的代码块在类实例初始化后在调用, 要与 static 代码块区别开来

```
class ClassInit4 {

    static int k;
    static {
        i = 2;
        j = k;
        //k = l; //注释后是否可以编译通过, 为什么
    }
    {
        //k = l;  //注释后编译是否可以通过, 对结果有什么影响
    }
    static int i;
    static int j = 3;
    static final int l = 4;

    public static void main(String []args) {
        System.out.println(i);
        System.out.println(j);
        System.out.println(k);
        System.out.println(l);
        new ClassInit4();
        System.out.println(i);
        System.out.println(j);
        System.out.println(k);
        System.out.println(l);
    }
}
```

非 final 修改的 static 变量的赋值可以延迟到类实例构造函数之时初始化, 因此可以不指定初始值, 为类型默认值

final 修改的 static 变量在准备阶段初始化, 因此必须指定初始值

```
//IClassInit1.java
interface IClassInit1 {
    static final int var = 1;
    static int var1 = 2;
}

//ClassInit1.java
class ClassInit1 implements IClassInit1 {
    static final int var = 3;
    static int var1 = 4; //该变量增加 final 后, 反编译代码发生了什么变化? 没有 static {} 代码

    public static void main(String args[]) {
        System.out.println(IClassInit1.var);
        System.out.println(IClassInit1.var1);
        System.out.println(ClassInit1.var);
        System.out.println(ClassInit1.var1);
    }
}
```

静态变量属于类(或接口), 不被子类或(实现类)继承

### 双亲委派

* 启动类加载器 -Xbootclasspath -bootclasspath $JAVA_HOME/jre/lib/rt.jar
* 扩展类加载器 -Djava.ext.dirs  $JAVA_HOME/jre/lib/ext/*.jar
* 系统类加载器 : -cp -classpath, 默认是当前路径
* 用户自定义类加载器

只加载一次 : 需要注意的是在加载一个类之前首先会查找类是否已经被加载, 只有没有加载时才会调用加载器加载, 加载原理就是双亲委派

具体原理分析可以参考附录

此外还要注意破坏双亲委派的情况

* 向下兼容
* 线程上下文加载器
* OSGI

### 现代类加载器

隔离性, 性能, 限制

1. 每个 JAR 有自己的类加载器
2. 中心化的仓库, 类加载器之间是兄弟关系
2. 每个 JAR 申明自己导入或导出的包
3. 仓库通包可以找到对应的类加载器
4. 库打包成单独的模块

比如 OSGi, NetBeams module system, JBoss Modules, JRebel, Javaleon, HotSwap,
Tottletale, Project jigsaw




类+类加载器(命名空间)唯一确立虚拟机的唯一性

即比较两个类是否"相等", 只有在这两个类是由同一个类加载器加载的前提下才有意
义, 否则, 即使这两个类来源于同一个 Class 文件, 被同一个虚拟机加载, 只要加载
它们的类加载器不同, 那这两个类就必定不相等。

上面的"相等", 包括代表类的 Class 对象的 equals() 方法、isAssignableFrom() 方法、
isInstance() 方法的返回结果, 也包括使用 instanceof 关键字做对象所属
关系判定等情况。

## 执行方法

### java 类与 jvm 类对应关系

1. 在方法区存储类的信息
2. 在 new 一个对象的时候动态分配一块内存在堆(Eden 或 TLB), JVM 对象较 java
对象增加了头信息, 包括 mark(64) + referenc(指向方法区地址)
3. 在执行方法的时候, JVM 中存在与字节码直接翻译为机器码的相关代码叫 CodeCache

### 执法方法过程

1. 虚拟机栈 : 线程独立

2. 栈帧(stack frame) : 虚拟机进行方法调用和执行的数据结构

* 局部变量表 : 方法参数，方法返回值及方法内部局部变量, 以 slot 为单位, 类似数组以索引定位
* 操作数栈
* 动态连接
* 方法返回地址
* 附加信息

每一个方法从调用开始至执行完成的过程,都对应着一个栈帧在虚拟机栈里面从入栈到出栈的过程。

局部变量表的分配:

   [局部变量]
   [参数]

一个方法执行需要多大的局部变量表, 多深的栈在编译期间基本完全确定的(有例外), 见下面的例子

```
public class Test {
    public int test() {
        int a = 100;
        int b = 200;
        int c = 300;
        return (a * b) * c;
    }

    public static int test1(int x, int y, int z) {
        int a = 100;
        int b = 200;
        int c = 300;
        return (a * b) * c;
    }

    public static void main(String []args) {
        char x = 0;
        char y = 0;
        char z = 0;
        Test.test1(x, y, z);
        new Test().test();
    }

}
```

$ javac Test.java

$ javap -v Test


    public int test();
      flags: ACC_PUBLIC
      Code:
        stack=2, locals=4, args_size=1  : 局部变量表大小为 4, 其中 this 为第一个
           0: bipush        100
           2: istore_1           : 局部变量 a 是局部变量第 2 个元素
           3: sipush        200
           6: istore_2           : 局部变量 b 是局部变量第 3 个元素
           7: sipush        300
          10: istore_3           : 局部变量 c 是局部变量第 4 个元素
          11: iload_1
          12: iload_2
          13: imul
          14: iload_3
          15: imul
          16: ireturn
        LineNumberTable:
          line 4: 0
          line 5: 3
          line 6: 7
          line 7: 11

    注: 0 2 3 6 不是连续的是因为 opcode 有参数

    public static int test1(int, int, int);
      flags: ACC_PUBLIC, ACC_STATIC
      Code:
        stack=2, locals=6, args_size=3  : 局部变量表大小为 6, 其中三个参数占用 0,1,2
           0: bipush        100
           2: istore_3           : 局部变量 a 是局部变量第 4 个元素
           3: sipush        200
           6: istore        4
           8: sipush        300
          11: istore        5
          13: iload_3
          14: iload         4
          16: imul
          17: iload         5
          19: imul
          20: ireturn
        LineNumberTable:
          line 11: 0
          line 12: 3
          line 13: 8
          line 14: 13

以上反汇编代码也说明了变量存储在局部变量表中, 拷贝到栈上进行计算

一个线程中可能同时有多个方法在执行, 比如 f1->f2->f3, 当 f3 在执行时，f1, f2
都没有退出. 其中 f3 的栈被称为当前栈帧，f3 为当前方法。此时当前线程的栈如下:

    [f1 栈帧]
    [f2 栈帧]
    [f3 栈帧]

因此, 如果一个方法, 递归深度很深, 栈空间占用就越大, 关键是 GC 时扫描范围就
扩大了, GC 的时间消耗很有可能也增加了.



## 方法调用

理解 java 动态分派, 静态分派, 已经他们在字节码和 JVM 层面的区别

* 解析调用 : 静态的
* 分派: 静态单分派(重载), 静态多分派, 动态单分派(重写), 动态多分派

* 虚方法 : 不是非虚的方法
* 非虚方法 : invokestatic, invokespecial, final 修改的方法, 包括静态方法、私有方法、实例构造器、父类方法4类

* 宗量: 方法的接收者与方法参数的统称

* invokestatic : 静态方法
* invokespecial: 实例构造器, 私有方法, 父类方法
* invokevirtual : 所有虚方法
* invokeinterface : 接口方法
* invokedynamic : 运行时动态解析

重载时是通过参数的静态类型而不是实际类型作为判定依据的。并且静态类型是编译期
可知的,因此,在编译阶段,Javac编译器会根据参数的静态类型决定使用哪个重载版本

解析与分派这两者之间的关系并不是二选一的排他关系,它们是在不同层次上去筛选、
确定目标方法的过程。例如,前面说过, 静态方法会在类加载期就进行解析,而静态方法
显然也是可以拥有重载版本的,选择重载版本的过程也是通过静态分派完成的。

静态分派: 所有依赖静态类型来定位方法执行版本的分派动作称为静态分派, 静态分派的典型应用
是方法重载, 静态分派发生在编译阶段,因此确定静态分派的动作实际上不是由虚拟机来执
行的。另外,编译器虽然能确定出方法的重载版本,但在很多情况下这个重载版本并不
是“唯一的”,往往只能确定一个“更加合适的”版本。


###例子

```
public interface ITest {
    public void virtual();
}
```

``` Test.java
public class Test implements ITest {

    Test() {
    }

    private static void method1() {
    }

    public static void method2() {
        method1();
    }

    private void method3() {
    }

    public void method4() {
        method3();
    }

    final private void method5() {
    }

    final public void method6() {
    }

    @Override
    public void virtual() {
    }

    public static void main(String []args) {
        Test t = new Test();
        Test.method1();
        Test.method2();
        t.method3();
        t.method4();

        ITest t1 = new Test();
        t1.virtual();
    }
}
```

``` SubTest.java
public class SubTest extends Test {

    public static void main(String []args) {
        Test t = new Test();
        Test.method2();
        t.method4();

        ITest t1 = new Test();
        t1.virtual();

        SubTest t2 = new SubTest();
        t2.method4();
        t2.virtual();
    }
}
```

$ javac SubTest.java

$ javap -v Test

    Test();
      flags:
      Code:
        stack=1, locals=1, args_size=1
           0: aload_0
           1: invokespecial #1                  // Method java/lang/Object."<init>":()V
           4: return

    public static void method2();
      flags: ACC_PUBLIC, ACC_STATIC
      Code:
        stack=0, locals=0, args_size=0
           0: invokestatic  #2                  // Method method1:()V
           3: return

    public void method4();
      flags: ACC_PUBLIC
      Code:
        stack=1, locals=1, args_size=1
           0: aload_0
           1: invokespecial #3                  // Method method3:()V
           4: return

    public final void method6();
      flags: ACC_PUBLIC, ACC_FINAL
      Code:
        stack=0, locals=1, args_size=1
           0: return

    public void virtual();
      flags: ACC_PUBLIC
      Code:
        stack=0, locals=1, args_size=1
           0: return

    public static void main(java.lang.String[]);
      flags: ACC_PUBLIC, ACC_STATIC
      Code:
        stack=2, locals=3, args_size=1
           0: new           #4                  // class Test
           3: dup
           4: invokespecial #5                  // Method "<init>":()V
           7: astore_1
           8: invokestatic  #2                  // Method method1:()V
          11: invokestatic  #6                  // Method method2:()V
          14: aload_1
          15: invokespecial #3                  // Method method3:()V
          18: aload_1
          19: invokevirtual #7                  // Method method4:()V
          22: new           #4                  // class Test
          25: dup
          26: invokespecial #5                  // Method "<init>":()V
          29: astore_2
          30: aload_2
          31: invokeinterface #8,  1            // InterfaceMethod ITest.virtual:()V
          36: return

$ javap -v SubTest

    public SubTest();
      flags: ACC_PUBLIC
      Code:
        stack=1, locals=1, args_size=1
           0: aload_0
           1: invokespecial #1                  // Method Test."<init>":()V
           4: return
        LineNumberTable:
          line 1: 0

    public static void main(java.lang.String[]);
      flags: ACC_PUBLIC, ACC_STATIC
      Code:
        stack=2, locals=4, args_size=1
           0: new           #2                  // class Test
           3: dup
           4: invokespecial #1                  // Method Test."<init>":()V
           7: astore_1
           8: invokestatic  #3                  // Method Test.method2:()V
          11: aload_1
          12: invokevirtual #4                  // Method Test.method4:()V
          15: new           #2                  // class Test
          18: dup
          19: invokespecial #1                  // Method Test."<init>":()V
          22: astore_2
          23: aload_2
          24: invokeinterface #5,  1            // InterfaceMethod ITest.virtual:()V
          29: new           #6                  // class SubTest
          32: dup
          33: invokespecial #7                  // Method "<init>":()V
          36: astore_3
          37: aload_3
          38: invokevirtual #8                  // Method method4:()V
          41: aload_3
          42: invokevirtual #9                  // Method virtual:()V
          45: return


###静态分派

```
class StaticDispatch {

    static abstract class Human {
    }

    static class Man extends Human {
    }

    static class Woman extends Human {
    }

    public void sayHello(Human guy) {
        System.out.println("hello guy");
    }

    public void sayHello(Man guy) {
        System.out.println("hello man");
    }

    public void sayHello(Woman guy) {
        System.out.println("hello woman");
    }

    public static void main(String []args) {
        Human man = new Man();
        Human woman = new Woman();
        StaticDispatch sr = new StaticDispatch();
        sr.sayHello(man);
        sr.sayHello(woman);
    }
}
```

$ javac StaticDispatch.java

$ java StaticDispatch

    hello guy
    hello guy

$ javap -v StaticDispatch

```
         0: new           #7                  // class StaticDispatch$Man
         3: dup
         4: invokespecial #8                  // Method StaticDispatch$Man."<init>":()V
         7: astore_1
         8: new           #9                  // class StaticDispatch$Woman
        11: dup
        12: invokespecial #10                 // Method StaticDispatch$Woman."<init>":()V
        15: astore_2
        16: new           #11                 // class StaticDispatch
        19: dup
        20: invokespecial #12                 // Method "<init>":()V
        23: astore_3
        24: aload_3
        25: aload_1
        26: invokevirtual #13                 // Method sayHello:(LStaticDispatch$Human;)V
        29: aload_3
        30: aload_2
        31: invokevirtual #13                 // Method sayHello:(LStaticDispatch$Human;)V
        34: return
```

由 26,29 可见, 类型已经确定为 Human 啦


###动态分派


```
public class DynamicDispatch {
    static abstract class Human {
        protected abstract void sayHello();
    }

    static class Man extends Human {
        @Override
        protected void sayHello() {
            System.out.println("man say Hello");
        }
    }

    static class Woman extends Human {
        @Override
        protected void sayHello() {
            System.out.println("woman say Hello");
        }
    }

    public static void main(String []args) {
        Human man = new Man();
        Human woman = new Woman();
        man.sayHello();
        woman.sayHello();
        man = new Woman();
        man.sayHello();
    }
}
```

$ javac DynamicDispatch.java

$ javap -v DynamicDispatch

     stack=2, locals=3, args_size=1
         0: new           #2                  // class DynamicDispatch$Man
         3: dup
         4: invokespecial #3                  // Method DynamicDispatch$Man."<init>":()V
         7: astore_1
         8: new           #4                  // class DynamicDispatch$Woman
        11: dup
        12: invokespecial #5                  // Method DynamicDispatch$Woman."<init>":()V
        15: astore_2
        16: aload_1
        17: invokevirtual #6                  // Method DynamicDispatch$Human.sayHello:()V
        20: aload_2
        21: invokevirtual #6                  // Method DynamicDispatch$Human.sayHello:()V
        24: new           #4                  // class DynamicDispatch$Woman
        27: dup
        28: invokespecial #5                  // Method DynamicDispatch$Woman."<init>":()V
        31: astore_1
        32: aload_1
        33: invokevirtual #6                  // Method DynamicDispatch$Human.sayHello:()V
        36: return

其中 17, 21 都是 Human, 但实际执行结果却不同. 这里设计到 invokevirtual 执行过程

```
public class Dispatch {
    static class QQ {}
    static class _360 {}

    public static class Father {
        public void hardChoice(QQ arg) {
            System.out.println("father choose qq");
        }

        public void hardChoice(_360 arg) {
            System.out.println("father choose 360");
        }
    }

    public static class Son extends Father {
        public void hardChoice(QQ arg) {
            System.out.println("son choose qq");
        }

        public void hardChoice(_360 arg) {
            System.out.println("son choose 360");
        }
    }

    public static void main(String []args) {
        Father father = new Father();
        Father son = new Son();
        father.hardChoice(new _360());
        son.hardChoice(new QQ());
    }
}
```

$ javac Dispatch.java

$ java Dispatch

    father choose 360
    son choose qq

$ javap -v Dispatch

    stack=3, locals=3, args_size=1
       0: new           #2                  // class Dispatch$Father
       3: dup
       4: invokespecial #3                  // Method Dispatch$Father."<init>":()V
       7: astore_1
       8: new           #4                  // class Dispatch$Son
      11: dup
      12: invokespecial #5                  // Method Dispatch$Son."<init>":()V
      15: astore_2
      16: aload_1
      17: new           #6                  // class Dispatch$_360
      20: dup
      21: invokespecial #7                  // Method Dispatch$_360."<init>":()V
      24: invokevirtual #8                  // Method Dispatch$Father.hardChoice:(LDispatch$_360;)V
      27: aload_2
      28: new           #9                  // class Dispatch$QQ
      31: dup
      32: invokespecial #10                 // Method Dispatch$QQ."<init>":()V
      35: invokevirtual #11                 // Method Dispatch$Father.hardChoice:(LDispatch$QQ;)V
      38: return

invokevirtual 指令的运行时解析过程大致分为以下几个步骤

1. 找到操作数栈顶的第一个元素所指向的对象的实际类型,记作C。
2. 如果在类型C中找到与常量中的描述符和简单名称都相符的方法,则进行访问权限校
验,如果通过则返回这个方法的直接引用,查找过程结束;如果不通过,则返回
java.lang.IllegalAccessError异常。
3. 否则,按照继承关系从下往上依次对C的各个父类进行第2步的搜索和验证过程。
4. 如果始终没有找到合适的方法,则抛出java.lang.AbstractMethodError异常。

动态分派

由于invokevirtual指令执行的第一步就是在运行期确定接收者的实际类型,所以两次调
用中的invokevirtual指令把常量池中的类方法符号引用解析到了不同的直接引用上,这个过
程就是Java语言中方法重写的本质。我们把这种在运行期根据实际类型确定方法执行版本的
分派过程称为动态分派。

方法的接收者与方法的参数统称为方法的宗量

单分派是根据一个宗量对目标方法进行选择,多分派则是根据多于一个宗量对目标方法进行选择。

Java 是一个静态多分派(参数, 静态类型)，动态单分派(只依据实际类型)的语言

方法表一般在类加载的连接阶段进行初始化,准备了类的变量初始值后,虚拟机会把该
类的方法表也初始化完毕。


## 参考

https://www.ibm.com/developerworks/library/it-haggar_bytecode/


## 附录

### 类加载实现


```
    //ClassLoader.java

    protected final void resolveClass(Class<?> c) {
        resolveClass0(c);
    }
    private native void resolveClass0(Class c);

    private native void resolveClass0(Class c);

    protected final Class<?> defineClass(String name, byte[] b, int off, int len)
        throws ClassFormatError
    {
        return defineClass(name, b, off, len, null);
    }

    protected final Class<?> defineClass(String name, byte[] b, int off, int len,
                                         ProtectionDomain protectionDomain)
        throws ClassFormatError
    {
        protectionDomain = preDefineClass(name, protectionDomain);

        Class c = null;
        String source = defineClassSourceLocation(protectionDomain);

        try {
            c = defineClass1(name, b, off, len, protectionDomain, source);
        } catch (ClassFormatError cfe) {
            c = defineTransformedClass(name, b, off, len, protectionDomain, cfe,
                                       source);
        }

        postDefineClass(c, protectionDomain);
        return c;
    }

    protected final Class<?> defineClass(String name, java.nio.ByteBuffer b,
                                         ProtectionDomain protectionDomain)
        throws ClassFormatError
    {
        int len = b.remaining();

        // Use byte[] if not a direct ByteBufer:
        if (!b.isDirect()) {
            if (b.hasArray()) {
                return defineClass(name, b.array(),
                                   b.position() + b.arrayOffset(), len,
                                   protectionDomain);
            } else {
                // no array, or read-only array
                byte[] tb = new byte[len];
                b.get(tb);  // get bytes out of byte buffer.
                return defineClass(name, tb, 0, len, protectionDomain);
            }
        }

        protectionDomain = preDefineClass(name, protectionDomain);

        Class c = null;
        String source = defineClassSourceLocation(protectionDomain);

        try {
            c = defineClass2(name, b, b.position(), len, protectionDomain,
                             source);
        } catch (ClassFormatError cfe) {
            byte[] tb = new byte[len];
            b.get(tb);  // get bytes out of byte buffer.
            c = defineTransformedClass(name, tb, 0, len, protectionDomain, cfe,
                                       source);
        }

        postDefineClass(c, protectionDomain);
        return c;
    }

    private Class defineTransformedClass(String name, byte[] b, int off, int len,
                                         ProtectionDomain pd,
                                         ClassFormatError cfe, String source)
      throws ClassFormatError
    {
        // Class format error - try to transform the bytecode and
        // define the class again
        //
        ClassFileTransformer[] transformers =
            ClassFileTransformer.getTransformers();
        Class c = null;

        if (transformers != null) {
            for (ClassFileTransformer transformer : transformers) {
                try {
                    // Transform byte code using transformer
                    byte[] tb = transformer.transform(b, off, len);
                    c = defineClass1(name, tb, 0, tb.length,
                                     pd, source);
                    break;
                } catch (ClassFormatError cfe2)     {
                    // If ClassFormatError occurs, try next transformer
                }
            }
        }

        // Rethrow original ClassFormatError if unable to transform
        // bytecode to well-formed
        //
        if (c == null)
            throw cfe;

        return c;
    }

    private native Class defineClass0(String name, byte[] b, int off, int len,
                                      ProtectionDomain pd);

    private native Class defineClass1(String name, byte[] b, int off, int len,
                                      ProtectionDomain pd, String source);

    private native Class defineClass2(String name, java.nio.ByteBuffer b,
                                      int off, int len, ProtectionDomain pd,
                                      String source);

    // JVM 调用该方法初始化加载器
    private Class loadClassInternal(String name)
        throws ClassNotFoundException
    {
        // For backward compatibility, explicitly lock on 'this' when
        // the current class loader is not parallel capable.
        if (parallelLockMap == null) {
            synchronized (this) {
                 return loadClass(name);
            }
        } else {
            return loadClass(name);
        }
    }

    public Class<?> loadClass(String name) throws ClassNotFoundException {
        return loadClass(name, false);
    }

    protected Class<?> loadClass(String name, boolean resolve)
        throws ClassNotFoundException
    {
        synchronized (getClassLoadingLock(name)) {
            // First, check if the class has already been loaded
            Class c = findLoadedClass(name);
            if (c == null) {
                long t0 = System.nanoTime();
                try {
                    if (parent != null) {
                        c = parent.loadClass(name, false);
                    } else {
                        c = findBootstrapClassOrNull(name);
                    }
                } catch (ClassNotFoundException e) {
                    // ClassNotFoundException thrown if class not found
                    // from the non-null parent class loader
                }

                if (c == null) {
                    // If still not found, then invoke findClass in order
                    // to find the class.
                    long t1 = System.nanoTime();
                    c = findClass(name);

                    // this is the defining class loader; record the stats
                    sun.misc.PerfCounter.getParentDelegationTime().addTime(t1 - t0);
                    sun.misc.PerfCounter.getFindClassTime().addElapsedTimeFrom(t1);
                    sun.misc.PerfCounter.getFindClasses().increment();
                }
            }
            if (resolve) {
                resolveClass(c);
            }
            return c;
        }
    }

    protected final Class<?> findLoadedClass(String name) {
        if (!checkName(name))
            return null;
        return findLoadedClass0(name);
    }

    private native final Class findLoadedClass0(String name);

    protected Class<?> findClass(String name) throws ClassNotFoundException {
        throw new ClassNotFoundException(name);
        //在这里实现自定义类加载
    }

    static ClassLoader getClassLoader(Class<?> caller) {
        // This can be null if the VM is requesting it
        if (caller == null) {
            return null;
        }
        // Circumvent security check since this is package-private
        return caller.getClassLoader0();
    }

    //系统类加载器
    public static ClassLoader getSystemClassLoader() {
        initSystemClassLoader();
        if (scl == null) {
            return null;
        }
        SecurityManager sm = System.getSecurityManager();
        if (sm != null) {
            checkClassLoaderPermission(scl, Reflection.getCallerClass());
        }
        return scl;
    }

    private static synchronized void initSystemClassLoader() {
        if (!sclSet) {
            if (scl != null)
                throw new IllegalStateException("recursive invocation");
            sun.misc.Launcher l = sun.misc.Launcher.getLauncher();
            if (l != null) {
                Throwable oops = null;
                scl = l.getClassLoader();
                try {
                    scl = AccessController.doPrivileged(
                        new SystemClassLoaderAction(scl));
                } catch (PrivilegedActionException pae) {
                    oops = pae.getCause();
                    if (oops instanceof InvocationTargetException) {
                        oops = oops.getCause();
                    }
                }
                if (oops != null) {
                    if (oops instanceof Error) {
                        throw (Error) oops;
                    } else {
                        // wrap the exception
                        throw new Error(oops);
                    }
                }
            }
            sclSet = true;
        }
    }

    protected final Class<?> findSystemClass(String name)
        throws ClassNotFoundException
    {
        ClassLoader system = getSystemClassLoader();
        if (system == null) {
            if (!checkName(name))
                throw new ClassNotFoundException(name);
            Class cls = findBootstrapClass(name);
            if (cls == null) {
                throw new ClassNotFoundException(name);
            }
            return cls;
        }
        return system.loadClass(name);
    }

    public static URL getSystemResource(String name) {
        ClassLoader system = getSystemClassLoader();
        if (system == null) {
            return getBootstrapResource(name);
        }
        return system.getResource(name);
    }

    public static Enumeration<URL> getSystemResources(String name)
        throws IOException
    {
        ClassLoader system = getSystemClassLoader();
        if (system == null) {
            return getBootstrapResources(name);
        }
        return system.getResources(name);
    }

    //启动类加载器
    private Class findBootstrapClassOrNull(String name)
    {
        if (!checkName(name)) return null;

        return findBootstrapClass(name);
    }

    // return null if not found
    private native Class findBootstrapClass(String name);


    class SystemClassLoaderAction
        implements PrivilegedExceptionAction<ClassLoader> {
        private ClassLoader parent;

        SystemClassLoaderAction(ClassLoader parent) {
            this.parent = parent;
        }

        public ClassLoader run() throws Exception {
            String cls = System.getProperty("java.system.class.loader");
            if (cls == null) {
                return parent;
            }

            Constructor ctor = Class.forName(cls, true, parent)
                .getDeclaredConstructor(new Class[] { ClassLoader.class });
            ClassLoader sys = (ClassLoader) ctor.newInstance(
                new Object[] { parent });
            Thread.currentThread().setContextClassLoader(sys);
            return sys;
        }
    }


    //Class.java

    public InputStream getResourceAsStream(String name) {
        name = resolveName(name);
        ClassLoader cl = getClassLoader0();
        if (cl==null) {
            // A system class.
            return ClassLoader.getSystemResourceAsStream(name);
        }
        return cl.getResourceAsStream(name);
    }

    public InputStream getResourceAsStream(String name) {
        URL url = getResource(name);
        try {
            return url != null ? url.openStream() : null;
        } catch (IOException e) {
            return null;
        }
    }

    @CallerSensitive
    public ClassLoader getClassLoader() {
        ClassLoader cl = getClassLoader0();
        if (cl == null)
            return null;
        SecurityManager sm = System.getSecurityManager();
        if (sm != null) {
            ClassLoader.checkClassLoaderPermission(cl, Reflection.getCallerClass());
        }
        return cl;
    }

    // Package-private to allow ClassLoader access
    native ClassLoader getClassLoader0();

    public java.net.URL getResource(String name) {
        name = resolveName(name);
        ClassLoader cl = getClassLoader0();
        if (cl==null) {
            // A system class.
            return ClassLoader.getSystemResource(name);
        }
        return cl.getResource(name);
    }

    //线程加载器

    private ClassLoader contextClassLoader;

    private void init(ThreadGroup g, Runnable target, String name,
                      long stackSize, AccessControlContext acc) {
        if (name == null) {
            throw new NullPointerException("name cannot be null");
        }

        this.name = name.toCharArray();

        //调用线程的线程
        Thread parent = currentThread();
        SecurityManager security = System.getSecurityManager();
        if (g == null) {
            /* Determine if it's an applet or not */

            /* If there is a security manager, ask the security manager
               what to do. */
            if (security != null) {
                g = security.getThreadGroup();
            }

            /* If the security doesn't have a strong opinion of the matter
               use the parent thread group. */
            if (g == null) {
                g = parent.getThreadGroup();
            }
        }

        /* checkAccess regardless of whether or not threadgroup is
           explicitly passed in. */
        g.checkAccess();

        /*
         * Do we have the required permissions?
         */
        if (security != null) {
            if (isCCLOverridden(getClass())) {
                security.checkPermission(SUBCLASS_IMPLEMENTATION_PERMISSION);
            }
        }

        g.addUnstarted();

        this.group = g;
        this.daemon = parent.isDaemon();
        this.priority = parent.getPriority();
        //初始化类加载器
        if (security == null || isCCLOverridden(parent.getClass()))
            this.contextClassLoader = parent.getContextClassLoader();
        else
            this.contextClassLoader = parent.contextClassLoader;
        this.inheritedAccessControlContext =
                acc != null ? acc : AccessController.getContext();
        this.target = target;
        setPriority(priority);
        if (parent.inheritableThreadLocals != null)
            this.inheritableThreadLocals =
                ThreadLocal.createInheritedMap(parent.inheritableThreadLocals);
        /* Stash the specified stack size in case the VM cares */
        this.stackSize = stackSize;

        /* Set thread ID */
        tid = nextThreadID();
    }

    public ClassLoader getContextClassLoader() {
        if (contextClassLoader == null)
            return null;

        SecurityManager sm = System.getSecurityManager();
        if (sm != null) {
            //仅仅校验权限, 可以忽略
            ClassLoader.checkClassLoaderPermission(contextClassLoader,
                                                   Reflection.getCallerClass());
        }
        return contextClassLoader;
    }

    public void setContextClassLoader(ClassLoader cl) {
        SecurityManager sm = System.getSecurityManager();
        if (sm != null) {
            sm.checkPermission(new RuntimePermission("setContextClassLoader"));
        }
        contextClassLoader = cl;
    }
```

## 例子

```
class SwitchTest {

    public int doSwitch(String str) {
        switch (str) {
            case "abc":        return 1;
            case "123":        return 2;
            default:           return 0;
        }
    }

    static public void main(String args[]) {
        SwitchTest s = new SwitchTest();
        s.doSwitch("123");
        s.doSwitch("abc");
        s.doSwitch("abd");
    }
}
```


Classfile /tmp/SwitchTest.class
  Last modified 16/03/2017; size 762 bytes
  MD5 checksum d39a138affd70bb312524f34532551fb
  Compiled from "SwitchTest.java"
class SwitchTest
  SourceFile: "SwitchTest.java"
  minor version: 0
  major version: 52
  flags: ACC_SUPER
Constant pool:
   #1 = Methodref          #10.#24        //  java/lang/Object."<init>":()V
   #2 = Methodref          #25.#26        //  java/lang/String.hashCode:()I
   #3 = String             #27            //  abc
   #4 = Methodref          #25.#28        //  java/lang/String.equals:(Ljava/lang/Object;)Z
   #5 = String             #29            //  123
   #6 = Class              #30            //  SwitchTest
   #7 = Methodref          #6.#24         //  SwitchTest."<init>":()V
   #8 = Methodref          #6.#31         //  SwitchTest.doSwitch:(Ljava/lang/String;)I
   #9 = String             #32            //  abd
  #10 = Class              #33            //  java/lang/Object
  #11 = Utf8               <init>
  #12 = Utf8               ()V
  #13 = Utf8               Code
  #14 = Utf8               LineNumberTable
  #15 = Utf8               doSwitch
  #16 = Utf8               (Ljava/lang/String;)I
  #17 = Utf8               StackMapTable
  #18 = Class              #34            //  java/lang/String
  #19 = Utf8               doCompare
  #20 = Utf8               main
  #21 = Utf8               ([Ljava/lang/String;)V
  #22 = Utf8               SourceFile
  #23 = Utf8               SwitchTest.java
  #24 = NameAndType        #11:#12        //  "<init>":()V
  #25 = Class              #34            //  java/lang/String
  #26 = NameAndType        #35:#36        //  hashCode:()I
  #27 = Utf8               abc
  #28 = NameAndType        #37:#38        //  equals:(Ljava/lang/Object;)Z
  #29 = Utf8               123
  #30 = Utf8               SwitchTest
  #31 = NameAndType        #15:#16        //  doSwitch:(Ljava/lang/String;)I
  #32 = Utf8               abd
  #33 = Utf8               java/lang/Object
  #34 = Utf8               java/lang/String
  #35 = Utf8               hashCode
  #36 = Utf8               ()I
  #37 = Utf8               equals
  #38 = Utf8               (Ljava/lang/Object;)Z
{
  SwitchTest();
    flags: 
    Code:
      stack=1, locals=1, args_size=1
         0: aload_0       
         1: invokespecial #1                  // Method java/lang/Object."<init>":()V
         4: return        
      LineNumberTable:
        line 2: 0

  public int doSwitch(java.lang.String);
    flags: ACC_PUBLIC
    Code:
      stack=2, locals=4, args_size=2
         0: aload_1       
         1: astore_2      
         2: iconst_m1     
         3: istore_3      
         4: aload_2       
         5: invokevirtual #2                  // Method java/lang/String.hashCode:()I
         8: lookupswitch  { // 2
                   48690: 50
                   96354: 36
                 default: 61
            }
        36: aload_2       
        37: ldc           #3                  // String abc
        39: invokevirtual #4                  // Method java/lang/String.equals:(Ljava/lang/Object;)Z
        42: ifeq          61
        45: iconst_0      
        46: istore_3      
        47: goto          61
        50: aload_2       
        51: ldc           #5                  // String 123
        53: invokevirtual #4                  // Method java/lang/String.equals:(Ljava/lang/Object;)Z
        56: ifeq          61
        59: iconst_1      
        60: istore_3      
        61: iload_3       
        62: lookupswitch  { // 2
                       0: 88
                       1: 90
                 default: 92
            }
        88: iconst_1      
        89: ireturn       
        90: iconst_2      
        91: ireturn       
        92: iconst_0      
        93: ireturn       
      LineNumberTable:
        line 5: 0
        line 6: 88
        line 7: 90
        line 8: 92
      StackMapTable: number_of_entries = 6
           frame_type = 253 /* append */
             offset_delta = 36
        locals = [ class java/lang/String, int ]
           frame_type = 13 /* same */
           frame_type = 10 /* same */
           frame_type = 26 /* same */
           frame_type = 1 /* same */
           frame_type = 1 /* same */


  public int doCompare(java.lang.String);
    flags: ACC_PUBLIC
    Code:
      stack=2, locals=2, args_size=2
         0: aload_1       
         1: ldc           #3                  // String abc
         3: invokevirtual #4                  // Method java/lang/String.equals:(Ljava/lang/Object;)Z
         6: ifeq          11
         9: iconst_1      
        10: ireturn       
        11: aload_1       
        12: ldc           #5                  // String 123
        14: invokevirtual #4                  // Method java/lang/String.equals:(Ljava/lang/Object;)Z
        17: ifeq          22
        20: iconst_2      
        21: ireturn       
        22: iconst_0      
        23: ireturn       
      LineNumberTable:
        line 13: 0
        line 14: 9
        line 15: 11
        line 16: 20
        line 18: 22
      StackMapTable: number_of_entries = 2
           frame_type = 11 /* same */
           frame_type = 10 /* same */


  public static void main(java.lang.String[]);
    flags: ACC_PUBLIC, ACC_STATIC
    Code:
      stack=2, locals=2, args_size=1
         0: new           #6                  // class SwitchTest
         3: dup           
         4: invokespecial #7                  // Method "<init>":()V
         7: astore_1      
         8: aload_1       
         9: ldc           #5                  // String 123
        11: invokevirtual #8                  // Method doSwitch:(Ljava/lang/String;)I
        14: pop           
        15: aload_1       
        16: ldc           #3                  // String abc
        18: invokevirtual #8                  // Method doSwitch:(Ljava/lang/String;)I
        21: pop           
        22: aload_1       
        23: ldc           #9                  // String abd
        25: invokevirtual #8                  // Method doSwitch:(Ljava/lang/String;)I
        28: pop           
        29: return        
      LineNumberTable:
        line 23: 0
        line 24: 8
        line 25: 15
        line 26: 22
        line 27: 29
}


### 关于变量不再使用设置为 null 的依据

注: 不要过度依赖, 因为是在没有考虑优化和 JIT 的前提下的概念模型.

$ java -showversion

    java version "1.8.0_91"
    Java(TM) SE Runtime Environment (build 1.8.0_91-b14)
    Java HotSpot(TM) 64-Bit Server VM (build 25.91-b14, mixed mode)

###例子 1

```
class Test {
    public static void main(String []args) {
        byte[] placeholder = new byte[64 * 1024 * 1024];
        System.gc();
    }
}
```

$ javac Test.java

$ java -verbose:gc Test

    [GC (System.gc())  66150K->65880K(124928K), 0.0030093 secs]
    [Full GC (System.gc())  65880K->65791K(124928K), 0.0077116 secs]

###例子 2

```
class Test {
    public static void main(String []args) {
        byte[] placeholder = new byte[64 * 1024 * 1024];
        placeholder = null;
        System.gc();
    }
}
```

$ javac Test.java

$ java -verbose:gc Test

    [GC (System.gc())  66150K->65912K(124928K), 0.0025510 secs]
    [Full GC (System.gc())  65912K->255K(124928K), 0.0079233 secs]

###例子 3

```
class Test {
    public static void main(String []args) {
        {
            byte[] placeholder = new byte[64 * 1024 * 1024];
        }
        System.gc();
    }
}
```

$ javac Test.java

$ java -verbose:gc Test

    [GC (System.gc())  66150K->65880K(124928K), 0.0030093 secs]
    [Full GC (System.gc())  65880K->65791K(124928K), 0.0077116 secs]

###例子 4

```
class Test {
    public static void main(String []args) {
        {
            byte[] placeholder = new byte[64 * 1024 * 1024];
            placeholder = null;
        }
        System.gc();
    }
}
```

$ javac Test.java

$ java -verbose:gc Test

    [GC (System.gc())  66150K->65912K(124928K), 0.0025510 secs]
    [Full GC (System.gc())  65912K->255K(124928K), 0.0079233 secs]


