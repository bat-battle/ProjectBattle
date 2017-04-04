
/*
 * 字节码练习
 *
 * 注: 为了生成局部遍历表, 编译需要增加 -g 选项
 *
 *  javac -g BaseStack.java
 *  javap -v -p -s -sysinfo -constants BaseStack.class
 *
 *  指令参考 https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-6.html
 */

class BaseStack {

    private int syn = 0;
    static int mark = 0;
    static final int init = 123;
    private int intArr[] = {(byte)1, (byte)2, (byte)3};

    public synchronized int top1() {
        return intArr[0];
    }

    public int top2() {
        synchronized (this) {
            return intArr[0];
        }
    }

    public int calc(int d){
        int a=100;
        int b=200;
        int c=300;
        d = (a+b)*c;
        return d;
    }

    public void incc(){
        int i = 0;
        i++;
    }

    public void shift() {
        int i = -4;
        int k = -4;
        int j = 4;
        i = i >> 5;
        k = k >>> 5;
        System.out.println(i);
        System.out.println(k);
        j = j << 1 ;
        System.out.println(j);
    }

    public void testSwitch() {
        int i = 0;
        switch(i) {
            case 0:
                System.out.println(i);
                break;
            case 1:
                System.out.println(i);
                break;
            case 2:
                System.out.println(i);
                break;
            case 3:
                System.out.println(i);
                break;
        }
    }

    public void testSwitchStr() {
        String str = "124";
        switch(str) {
            case "123":
                System.out.println(str);
                break;
            case "124":
                System.out.println(str);
                break;
        }
    }

//    public void testSwitchStr() {
//        int i = 0;
//again:
//goto again;
//    }

    public int inc(){
        int x;
        try {
            x = 1;
            return x;
        } catch (Exception e){
            x = 2;
            return x;
        } finally {
            x = 3;
        }
    }

    static void swap(int i, int j) {
        int tmp = i;
        i = j;
        j = tmp;
    }

    static int getMark() {
        return mark;
    }

    static void setMark(int m) {
        mark = m;
    }

    public boolean boolTest() {
        return true;
    }

    byte byteTest() {
        byte b = 1;
        return b;
    }

    char charTest() {
        char c = 1;
        return c;
    }

    short shortTest() {
        short s = 1;
        return s;
    }

    static void equal(int i, int j) {
        if (i == j) {
        }
    }

    public void test() {
    }

    public void test1() {
    }

    public void synTest1(int j) {
        synchronized (this) {
            syn = j;
        }
    }

    synchronized public void synTest() {
    }

    public void sleep(int nsec) {
        try {
            Thread.sleep(1000 * nsec);
        } catch (InterruptedException e) {
        }
    }

    static public void main(String []args) {
        System.out.println(args.length);
        int c = 0;
        BaseStack b = new BaseStack();
        b.calc(c);
        b.inc();
        b.shift();
        b.testSwitch();
        b.testSwitchStr();
    }
}


//Classfile /home/wenxueliu/Documents/ProjectBattle/lecture/example/runtime/BaseStack.class
//  Last modified 04/04/2017; size 8192 bytes
//  MD5 checksum 9ca8fdd6be6e769ef956dd72928296ca
//  Compiled from "BaseStack.java"
//class BaseStack
//  SourceFile: "BaseStack.java"
//  minor version: 0
//  major version: 52
//  flags: ACC_SUPER
//Constant pool:
//    #1 = Methodref          #22.#100      //  java/lang/Object."<init>":()V
//    #2 = Fieldref           #15.#101      //  BaseStack.syn:I
//    #3 = Fieldref           #15.#102      //  BaseStack.intArr:[I
//    #4 = Fieldref           #103.#104     //  java/lang/System.out:Ljava/io/PrintStream;
//    #5 = Methodref          #105.#106     //  java/io/PrintStream.println:(I)V
//    #6 = String             #107          //  124
//    #7 = Methodref          #108.#109     //  java/lang/String.hashCode:()I
//    #8 = String             #110          //  123
//    #9 = Methodref          #108.#111     //  java/lang/String.equals:(Ljava/lang/Object;)Z
//   #10 = Methodref          #105.#112     //  java/io/PrintStream.println:(Ljava/lang/String;)V
//   #11 = Class              #113          //  java/lang/Exception
//   #12 = Fieldref           #15.#114      //  BaseStack.mark:I
//   #13 = Methodref          #115.#116     //  java/lang/Thread.sleep:(J)V
//   #14 = Class              #117          //  java/lang/InterruptedException
//   #15 = Class              #118          //  BaseStack
//   #16 = Methodref          #15.#100      //  BaseStack."<init>":()V
//   #17 = Methodref          #15.#119      //  BaseStack.calc:(I)I
//   #18 = Methodref          #15.#120      //  BaseStack.inc:()I
//   #19 = Methodref          #15.#121      //  BaseStack.shift:()V
//   #20 = Methodref          #15.#122      //  BaseStack.testSwitch:()V
//   #21 = Methodref          #15.#123      //  BaseStack.testSwitchStr:()V
//   #22 = Class              #124          //  java/lang/Object
//   #23 = Utf8               syn
//   #24 = Utf8               I
//   #25 = Utf8               mark
//   #26 = Utf8               init
//   #27 = Utf8               ConstantValue
//   #28 = Integer            123
//   #29 = Utf8               intArr
//   #30 = Utf8               [I
//   #31 = Utf8               <init>
//   #32 = Utf8               ()V
//   #33 = Utf8               Code
//   #34 = Utf8               LineNumberTable
//   #35 = Utf8               LocalVariableTable
//   #36 = Utf8               this
//   #37 = Utf8               LBaseStack;
//   #38 = Utf8               top1
//   #39 = Utf8               ()I
//   #40 = Utf8               top2
//   #41 = Utf8               StackMapTable
//   #42 = Class              #118          //  BaseStack
//   #43 = Class              #124          //  java/lang/Object
//   #44 = Class              #125          //  java/lang/Throwable
//   #45 = Utf8               calc
//   #46 = Utf8               (I)I
//   #47 = Utf8               d
//   #48 = Utf8               a
//   #49 = Utf8               b
//   #50 = Utf8               c
//   #51 = Utf8               incc
//   #52 = Utf8               i
//   #53 = Utf8               shift
//   #54 = Utf8               k
//   #55 = Utf8               j
//   #56 = Utf8               testSwitch
//   #57 = Utf8               testSwitchStr
//   #58 = Utf8               str
//   #59 = Utf8               Ljava/lang/String;
//   #60 = Class              #126          //  java/lang/String
//   #61 = Utf8               inc
//   #62 = Utf8               x
//   #63 = Utf8               e
//   #64 = Utf8               Ljava/lang/Exception;
//   #65 = Class              #113          //  java/lang/Exception
//   #66 = Utf8               swap
//   #67 = Utf8               (II)V
//   #68 = Utf8               tmp
//   #69 = Utf8               getMark
//   #70 = Utf8               setMark
//   #71 = Utf8               (I)V
//   #72 = Utf8               m
//   #73 = Utf8               boolTest
//   #74 = Utf8               ()Z
//   #75 = Utf8               byteTest
//   #76 = Utf8               ()B
//   #77 = Utf8               B
//   #78 = Utf8               charTest
//   #79 = Utf8               ()C
//   #80 = Utf8               C
//   #81 = Utf8               shortTest
//   #82 = Utf8               ()S
//   #83 = Utf8               s
//   #84 = Utf8               S
//   #85 = Utf8               equal
//   #86 = Utf8               test
//   #87 = Utf8               test1
//   #88 = Utf8               synTest1
//   #89 = Utf8               synTest
//   #90 = Utf8               sleep
//   #91 = Utf8               nsec
//   #92 = Class              #117          //  java/lang/InterruptedException
//   #93 = Utf8               main
//   #94 = Utf8               ([Ljava/lang/String;)V
//   #95 = Utf8               args
//   #96 = Utf8               [Ljava/lang/String;
//   #97 = Utf8               <clinit>
//   #98 = Utf8               SourceFile
//   #99 = Utf8               BaseStack.java
//  #100 = NameAndType        #31:#32       //  "<init>":()V
//  #101 = NameAndType        #23:#24       //  syn:I
//  #102 = NameAndType        #29:#30       //  intArr:[I
//  #103 = Class              #127          //  java/lang/System
//  #104 = NameAndType        #128:#129     //  out:Ljava/io/PrintStream;
//  #105 = Class              #130          //  java/io/PrintStream
//  #106 = NameAndType        #131:#71      //  println:(I)V
//  #107 = Utf8               124
//  #108 = Class              #126          //  java/lang/String
//  #109 = NameAndType        #132:#39      //  hashCode:()I
//  #110 = Utf8               123
//  #111 = NameAndType        #133:#134     //  equals:(Ljava/lang/Object;)Z
//  #112 = NameAndType        #131:#135     //  println:(Ljava/lang/String;)V
//  #113 = Utf8               java/lang/Exception
//  #114 = NameAndType        #25:#24       //  mark:I
//  #115 = Class              #136          //  java/lang/Thread
//  #116 = NameAndType        #90:#137      //  sleep:(J)V
//  #117 = Utf8               java/lang/InterruptedException
//  #118 = Utf8               BaseStack
//  #119 = NameAndType        #45:#46       //  calc:(I)I
//  #120 = NameAndType        #61:#39       //  inc:()I
//  #121 = NameAndType        #53:#32       //  shift:()V
//  #122 = NameAndType        #56:#32       //  testSwitch:()V
//  #123 = NameAndType        #57:#32       //  testSwitchStr:()V
//  #124 = Utf8               java/lang/Object
//  #125 = Utf8               java/lang/Throwable
//  #126 = Utf8               java/lang/String
//  #127 = Utf8               java/lang/System
//  #128 = Utf8               out
//  #129 = Utf8               Ljava/io/PrintStream;
//  #130 = Utf8               java/io/PrintStream
//  #131 = Utf8               println
//  #132 = Utf8               hashCode
//  #133 = Utf8               equals
//  #134 = Utf8               (Ljava/lang/Object;)Z
//  #135 = Utf8               (Ljava/lang/String;)V
//  #136 = Utf8               java/lang/Thread
//  #137 = Utf8               (J)V
//{
//  private int syn;
//    Signature: I
//    flags: ACC_PRIVATE
//
//  static int mark;
//    Signature: I
//    flags: ACC_STATIC
//
//  static final int init = 123;
//    Signature: I
//    flags: ACC_STATIC, ACC_FINAL
//    ConstantValue: int 123
//
//  private int[] intArr;
//    Signature: [I
//    flags: ACC_PRIVATE
//
//  BaseStack();
//    Signature: ()V
//    flags: 
//    Code:
//      stack=5, locals=1, args_size=1
//         0: aload_0       
//         1: invokespecial #1                  // Method java/lang/Object."<init>":()V
//         4: aload_0       
//         5: iconst_0      
//         6: putfield      #2                  // Field syn:I
//         9: aload_0       
//        10: iconst_3      
//        11: newarray       int
//        13: dup           
//        14: iconst_0      
//        15: iconst_1      
//        16: iastore       
//        17: dup           
//        18: iconst_1      
//        19: iconst_2      
//        20: iastore       
//        21: dup           
//        22: iconst_2      
//        23: iconst_3      
//        24: iastore       
//        25: putfield      #3                  // Field intArr:[I
//        28: return        
//      LineNumberTable:
//        line 11: 0
//        line 13: 4
//        line 16: 9
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0      29     0  this   LBaseStack;
//
//  public synchronized int top1();
//    Signature: ()I
//    flags: ACC_PUBLIC, ACC_SYNCHRONIZED
//    Code:
//      stack=2, locals=1, args_size=1
//         0: aload_0                           //压入 this
//         1: getfield      #3                  //弹出 this, 访问 intArr 地址, 并将地址引用 ref 存入栈中
//         4: iconst_0                          //压入索引 0
//         5: iaload                            //弹出 ref, 0, 找到 ref[0], 压入栈
//         6: ireturn                           //弹出栈顶元素, 返回
//      LineNumberTable:
//        line 19: 0
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0       7     0  this   LBaseStack;
//
//  public int top2();
//    Signature: ()I
//    flags: ACC_PUBLIC
//    Code:
//      stack=2, locals=3, args_size=1
//         0: aload_0                           //压入 this
//
//         1: dup                               //拷贝栈顶 this
//         2: astore_1                          //弹出 this, 压入局部变量表索引 1, 记为 ref1
//
//         3: monitorenter                      //弹出 this, 获取 monitor
//
//         4: aload_0                           //加载 this
//         5: getfield      #3                  //弹出 this, 访问 intArr 地址, 并将数字地址引用 arrayRef 存入栈中
//         8: iconst_0                          //压入索引 0
//         9: iaload                            //弹出 arrayRef, 0, 找到 arrayRef[0], 压入栈
//
//        10: aload_1                           //压入 ref1
//        11: monitorexit                       //弹出 ref1, 释放 monitor
//
//        12: ireturn                           //返回数组索引值
//
//        13: astore_2                          //发生异常, 将第四行加载的 this 存入局部变量表第三个变量 ref2
//        14: aload_1                           //加载 ref1
//        15: monitorexit                       //弹出 ref1, 释放 monitor
//
//        16: aload_2                           //加载局部变量表第三个变量 ref2
//        17: athrow                            //弹出 ref2, 抛出异常
//      Exception table:
//         from    to  target type
//             4    12    13   any
//            13    16    13   any
//      LineNumberTable:
//        line 23: 0
//        line 24: 4
//        line 25: 13
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0      18     0  this   LBaseStack;
//      StackMapTable: number_of_entries = 1
//           frame_type = 255 /* full_frame */
//          offset_delta = 13
//          locals = [ class BaseStack, class java/lang/Object ]
//          stack = [ class java/lang/Throwable ]
//
//// 由上分析可见, 局部变量表出 this 之外, ref1 用于锁, ref2 用于异常. 此外, 对比
//// top1, top2 发现功能相同, 但是性能差异很大, 当然, 完全可以存在被 JIT
//// 优化的可能, 不管怎么说, 用前者更靠谱
//
//  public int calc(int);
//    Signature: (I)I
//    flags: ACC_PUBLIC
//    Code:
//      stack=2, locals=5, args_size=2
//         0: bipush        100
//         2: istore_2      
//         3: sipush        200
//         6: istore_3      
//         7: sipush        300
//        10: istore        4
//        12: iload_2       
//        13: iload_3       
//        14: iadd          
//        15: iload         4
//        17: imul          
//        18: istore_1      
//        19: iload_1       
//        20: ireturn       
//      LineNumberTable:
//        line 29: 0
//        line 30: 3
//        line 31: 7
//        line 32: 12
//        line 33: 19
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0      21     0  this   LBaseStack;
//               0      21     1     d   I
//               3      18     2     a   I
//               7      14     3     b   I
//              12       9     4     c   I
//
//  public void incc();
//    Signature: ()V
//    flags: ACC_PUBLIC
//    Code:
//      stack=1, locals=2, args_size=1
//         0: iconst_0      
//         1: istore_1      
//         2: iinc          1, 1
//         5: return        
//      LineNumberTable:
//        line 37: 0
//        line 38: 2
//        line 39: 5
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0       6     0  this   LBaseStack;
//               2       4     1     i   I
//
//  public void shift();
//    Signature: ()V
//    flags: ACC_PUBLIC
//    Code:
//      stack=2, locals=4, args_size=1
//         0: bipush        -4
//         2: istore_1      
//         3: bipush        -4
//         5: istore_2      
//         6: iconst_4      
//         7: istore_3      
//         8: iload_1       
//         9: iconst_5      
//        10: ishr          
//        11: istore_1      
//        12: iload_2       
//        13: iconst_5      
//        14: iushr         
//        15: istore_2      
//        16: getstatic     #4                  // Field java/lang/System.out:Ljava/io/PrintStream;
//        19: iload_1       
//        20: invokevirtual #5                  // Method java/io/PrintStream.println:(I)V
//        23: getstatic     #4                  // Field java/lang/System.out:Ljava/io/PrintStream;
//        26: iload_2       
//        27: invokevirtual #5                  // Method java/io/PrintStream.println:(I)V
//        30: iload_3       
//        31: iconst_1      
//        32: ishl          
//        33: istore_3      
//        34: getstatic     #4                  // Field java/lang/System.out:Ljava/io/PrintStream;
//        37: iload_3       
//        38: invokevirtual #5                  // Method java/io/PrintStream.println:(I)V
//        41: return        
//      LineNumberTable:
//        line 42: 0
//        line 43: 3
//        line 44: 6
//        line 45: 8
//        line 46: 12
//        line 47: 16
//        line 48: 23
//        line 49: 30
//        line 50: 34
//        line 51: 41
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0      42     0  this   LBaseStack;
//               3      39     1     i   I
//               6      36     2     k   I
//               8      34     3     j   I
//
//  public void testSwitch();
//    Signature: ()V
//    flags: ACC_PUBLIC
//    Code:
//      stack=2, locals=2, args_size=1
//         0: iconst_0      
//         1: istore_1      
//         2: iload_1       
//         3: tableswitch   { // 0 to 3
//                       0: 32
//                       1: 42
//                       2: 52
//                       3: 62
//                 default: 69
//            }
//        32: getstatic     #4                  // Field java/lang/System.out:Ljava/io/PrintStream;
//        35: iload_1       
//        36: invokevirtual #5                  // Method java/io/PrintStream.println:(I)V
//        39: goto          69
//        42: getstatic     #4                  // Field java/lang/System.out:Ljava/io/PrintStream;
//        45: iload_1       
//        46: invokevirtual #5                  // Method java/io/PrintStream.println:(I)V
//        49: goto          69
//        52: getstatic     #4                  // Field java/lang/System.out:Ljava/io/PrintStream;
//        55: iload_1       
//        56: invokevirtual #5                  // Method java/io/PrintStream.println:(I)V
//        59: goto          69
//        62: getstatic     #4                  // Field java/lang/System.out:Ljava/io/PrintStream;
//        65: iload_1       
//        66: invokevirtual #5                  // Method java/io/PrintStream.println:(I)V
//        69: return        
//      LineNumberTable:
//        line 54: 0
//        line 55: 2
//        line 57: 32
//        line 58: 39
//        line 60: 42
//        line 61: 49
//        line 63: 52
//        line 64: 59
//        line 66: 62
//        line 69: 69
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0      70     0  this   LBaseStack;
//               2      68     1     i   I
//      StackMapTable: number_of_entries = 5
//           frame_type = 252 /* append */
//             offset_delta = 32
//        locals = [ int ]
//           frame_type = 9 /* same */
//           frame_type = 9 /* same */
//           frame_type = 9 /* same */
//           frame_type = 6 /* same */
//
//
//  public void testSwitchStr();
//    Signature: ()V
//    flags: ACC_PUBLIC
//    Code:
//      stack=2, locals=4, args_size=1
//         0: ldc           #6                  // String 124
//         2: astore_1      
//         3: aload_1       
//         4: astore_2      
//         5: iconst_m1     
//         6: istore_3      
//         7: aload_2       
//         8: invokevirtual #7                  // Method java/lang/String.hashCode:()I
//        11: lookupswitch  { // 2
//                   48690: 36
//                   48691: 50
//                 default: 61
//            }
//        36: aload_2       
//        37: ldc           #8                  // String 123
//        39: invokevirtual #9                  // Method java/lang/String.equals:(Ljava/lang/Object;)Z
//        42: ifeq          61
//        45: iconst_0      
//        46: istore_3      
//        47: goto          61
//        50: aload_2       
//        51: ldc           #6                  // String 124
//        53: invokevirtual #9                  // Method java/lang/String.equals:(Ljava/lang/Object;)Z
//        56: ifeq          61
//        59: iconst_1      
//        60: istore_3      
//        61: iload_3       
//        62: lookupswitch  { // 2
//                       0: 88
//                       1: 98
//                 default: 105
//            }
//        88: getstatic     #4                  // Field java/lang/System.out:Ljava/io/PrintStream;
//        91: aload_1       
//        92: invokevirtual #10                 // Method java/io/PrintStream.println:(Ljava/lang/String;)V
//        95: goto          105
//        98: getstatic     #4                  // Field java/lang/System.out:Ljava/io/PrintStream;
//       101: aload_1       
//       102: invokevirtual #10                 // Method java/io/PrintStream.println:(Ljava/lang/String;)V
//       105: return        
//      LineNumberTable:
//        line 72: 0
//        line 73: 3
//        line 75: 88
//        line 76: 95
//        line 78: 98
//        line 81: 105
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0     106     0  this   LBaseStack;
//               3     103     1   str   Ljava/lang/String;
//      StackMapTable: number_of_entries = 6
//           frame_type = 254 /* append */
//             offset_delta = 36
//        locals = [ class java/lang/String, class java/lang/String, int ]
//           frame_type = 13 /* same */
//           frame_type = 10 /* same */
//           frame_type = 26 /* same */
//           frame_type = 9 /* same */
//           frame_type = 249 /* chop */
//          offset_delta = 6
//
//
//  public int inc();
//    Signature: ()I
//    flags: ACC_PUBLIC
//    Code:
//      stack=1, locals=5, args_size=1 //this, x, returnVar1, returnVar2
//         // x = 1
//         0: iconst_1      //压入 常量 1
//         1: istore_1      //弹出, 保持到局部变量 x 中
//
//         //returnVar1 = x
//         2: iload_1       //压入, 加载 x
//         3: istore_2      //弹出, 保存在局部变量表 returnVar
//
//         //0-3 如果没有发生异常
//         // x=3
//         4: iconst_3      //压入 常量 3
//         5: istore_1      //弹出, 保存在局部变量 x 中
//
//         //返回 returnVar1
//         6: iload_2       //压入, returnVar
//         7: ireturn       //返回 returnVar
//
//         //0-3 发生异常
//         8: astore_2      //发生异常, this 保持到 Exception
//         // x=2
//         9: iconst_2      //压入 常量 2
//        10: istore_1      //弹出, 保持在局部变量 x
//
//        //returnVar2 = x
//        11: iload_1       //压入, 加载 x
//        12: istore_3      //弹出, 保存在局部变量表 returnVar2
//
//        //8-12 没有发生异常 x = 3
//        13: iconst_3
//        14: istore_1
//
//        //返回 returnVar2
//        15: iload_3
//        16: ireturn
//
//        //8-12 发生异常
//        17: astore        4    //弹出, 保持在局部变量表索引 4
//        //x = 3
//        19: iconst_3
//        20: istore_1
//
//        21: aload         4    //压入, 局部变量表索引 4 的变量
//        23: athrow             //抛出异常
//      Exception table:
//         from    to  target type
//             0     4     8   Class java/lang/Exception
//             0     4    17   any
//             8    13    17   any
//            17    19    17   any
//      LineNumberTable:
//        line 92: 0
//        line 93: 2
//        line 98: 4
//        line 94: 8
//        line 95: 9
//        line 96: 11
//        line 98: 13
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               2       6     1     x   I
//               9       8     2     e   Ljava/lang/Exception;
//              11       6     1     x   I
//               0      24     0  this   LBaseStack;
//              21       3     1     x   I
//      StackMapTable: number_of_entries = 2
//           frame_type = 72 /* same_locals_1_stack_item */
//          stack = [ class java/lang/Exception ]
//           frame_type = 72 /* same_locals_1_stack_item */
//          stack = [ class java/lang/Throwable ]
//
//
//  static void swap(int, int);
//    Signature: (II)V
//    flags: ACC_STATIC
//    Code:
//      stack=1, locals=3, args_size=2
//         0: iload_0       
//         1: istore_2      
//         2: iload_1       
//         3: istore_0      
//         4: iload_2       
//         5: istore_1      
//         6: return        
//      LineNumberTable:
//        line 103: 0
//        line 104: 2
//        line 105: 4
//        line 106: 6
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0       7     0     i   I
//               0       7     1     j   I
//               2       5     2   tmp   I
//
//  static int getMark();
//    Signature: ()I
//    flags: ACC_STATIC
//    Code:
//      stack=1, locals=0, args_size=0
//         0: getstatic     #12                 // Field mark:I
//         3: ireturn       
//      LineNumberTable:
//        line 109: 0
//
//  static void setMark(int);
//    Signature: (I)V
//    flags: ACC_STATIC
//    Code:
//      stack=1, locals=1, args_size=1
//         0: iload_0       
//         1: putstatic     #12                 // Field mark:I
//         4: return        
//      LineNumberTable:
//        line 113: 0
//        line 114: 4
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0       5     0     m   I
//
//  public boolean boolTest();
//    Signature: ()Z
//    flags: ACC_PUBLIC
//    Code:
//      stack=1, locals=1, args_size=1
//         0: iconst_1      
//         1: ireturn       
//      LineNumberTable:
//        line 117: 0
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0       2     0  this   LBaseStack;
//
//  byte byteTest();
//    Signature: ()B
//    flags: 
//    Code:
//      stack=1, locals=2, args_size=1
//         0: iconst_1      
//         1: istore_1      
//         2: iload_1       
//         3: ireturn       
//      LineNumberTable:
//        line 121: 0
//        line 122: 2
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0       4     0  this   LBaseStack;
//               2       2     1     b   B
//
//  char charTest();
//    Signature: ()C
//    flags: 
//    Code:
//      stack=1, locals=2, args_size=1
//         0: iconst_1      
//         1: istore_1      
//         2: iload_1       
//         3: ireturn       
//      LineNumberTable:
//        line 126: 0
//        line 127: 2
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0       4     0  this   LBaseStack;
//               2       2     1     c   C
//
//  short shortTest();
//    Signature: ()S
//    flags: 
//    Code:
//      stack=1, locals=2, args_size=1
//         0: iconst_1      
//         1: istore_1      
//         2: iload_1       
//         3: ireturn       
//      LineNumberTable:
//        line 131: 0
//        line 132: 2
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0       4     0  this   LBaseStack;
//               2       2     1     s   S
//
//  static void equal(int, int);
//    Signature: (II)V
//    flags: ACC_STATIC
//    Code:
//      stack=2, locals=2, args_size=2
//         0: iload_0       
//         1: iload_1       
//         2: if_icmpne     5
//         5: return        
//      LineNumberTable:
//        line 136: 0
//        line 138: 5
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0       6     0     i   I
//               0       6     1     j   I
//      StackMapTable: number_of_entries = 1
//           frame_type = 5 /* same */
//
//
//  public void test();
//    Signature: ()V
//    flags: ACC_PUBLIC
//    Code:
//      stack=0, locals=1, args_size=1
//         0: return        
//      LineNumberTable:
//        line 141: 0
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0       1     0  this   LBaseStack;
//
//  public void test1();
//    Signature: ()V
//    flags: ACC_PUBLIC
//    Code:
//      stack=0, locals=1, args_size=1
//         0: return        
//      LineNumberTable:
//        line 144: 0
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0       1     0  this   LBaseStack;
//
//  public void synTest1(int);
//    Signature: (I)V
//    flags: ACC_PUBLIC
//    Code:
//      stack=2, locals=4, args_size=2  //this, j
//         0: aload_0       
//
//         1: dup           
//         2: astore_2      
//         3: monitorenter  
//
//         4: aload_0       
//         5: iload_1       
//         6: putfield      #2                  // Field syn:I
//
//         9: aload_2       
//        10: monitorexit   
//
//        11: goto          19
//
//        14: astore_3      
//
//        15: aload_2       
//        16: monitorexit   
//
//        17: aload_3       
//        18: athrow        
//
//        19: return        
//      Exception table:
//         from    to  target type
//             4    11    14   any
//            14    17    14   any
//      LineNumberTable:
//        line 147: 0
//        line 148: 4
//        line 149: 9
//        line 150: 19
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0      20     0  this   LBaseStack;
//               0      20     1     j   I
//      StackMapTable: number_of_entries = 2
//           frame_type = 255 /* full_frame */
//          offset_delta = 14
//          locals = [ class BaseStack, int, class java/lang/Object ]
//          stack = [ class java/lang/Throwable ]
//           frame_type = 250 /* chop */
//          offset_delta = 4
//
//
//  public synchronized void synTest();
//    Signature: ()V
//    flags: ACC_PUBLIC, ACC_SYNCHRONIZED
//    Code:
//      stack=0, locals=1, args_size=1
//         0: return        
//      LineNumberTable:
//        line 153: 0
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0       1     0  this   LBaseStack;
//
//  public void sleep(int);
//    Signature: (I)V
//    flags: ACC_PUBLIC
//    Code:
//      stack=2, locals=3, args_size=2
//         0: sipush        1000
//         3: iload_1       
//         4: imul          
//         5: i2l           
//         6: invokestatic  #13                 // Method java/lang/Thread.sleep:(J)V
//         9: goto          13
//        12: astore_2      
//        13: return        
//      Exception table:
//         from    to  target type
//             0     9    12   Class java/lang/InterruptedException
//      LineNumberTable:
//        line 157: 0
//        line 159: 9
//        line 158: 12
//        line 160: 13
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0      14     0  this   LBaseStack;
//               0      14     1  nsec   I
//      StackMapTable: number_of_entries = 2
//           frame_type = 76 /* same_locals_1_stack_item */
//          stack = [ class java/lang/InterruptedException ]
//           frame_type = 0 /* same */
//
//
//  public static void main(java.lang.String[]);
//    Signature: ([Ljava/lang/String;)V
//    flags: ACC_PUBLIC, ACC_STATIC
//    Code:
//      stack=2, locals=3, args_size=1
//         0: getstatic     #4                  // Field java/lang/System.out:Ljava/io/PrintStream;
//         3: aload_0       
//         4: arraylength   
//         5: invokevirtual #5                  // Method java/io/PrintStream.println:(I)V
//         8: iconst_0      
//         9: istore_1      
//        10: new           #15                 // class BaseStack
//        13: dup           
//        14: invokespecial #16                 // Method "<init>":()V
//        17: astore_2      
//        18: aload_2       
//        19: iload_1       
//        20: invokevirtual #17                 // Method calc:(I)I
//        23: pop           
//        24: aload_2       
//        25: invokevirtual #18                 // Method inc:()I
//        28: pop           
//        29: aload_2       
//        30: invokevirtual #19                 // Method shift:()V
//        33: aload_2       
//        34: invokevirtual #20                 // Method testSwitch:()V
//        37: aload_2       
//        38: invokevirtual #21                 // Method testSwitchStr:()V
//        41: return        
//      LineNumberTable:
//        line 163: 0
//        line 164: 8
//        line 165: 10
//        line 166: 18
//        line 167: 24
//        line 168: 29
//        line 169: 33
//        line 170: 37
//        line 171: 41
//      LocalVariableTable:
//        Start  Length  Slot  Name   Signature
//               0      42     0  args   [Ljava/lang/String;
//              10      32     1     c   I
//              18      24     2     b   LBaseStack;
//
//  static {};
//    Signature: ()V
//    flags: ACC_STATIC
//    Code:
//      stack=1, locals=0, args_size=0
//         0: iconst_0      
//         1: putstatic     #12                 // Field mark:I
//         4: return        
//      LineNumberTable:
//        line 14: 0
//}
