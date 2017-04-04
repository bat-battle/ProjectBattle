
/*
 * 与 IClassInit1.java 对比
 *
 * interface 和类中 static 变量的区别 ?
 * interface 中所有 static 变量自动增加 final, 因此也就不能存在 static 变量的初始化
 */
class ClassInit1 extends ClassInit5 implements IClassInit1 {
    static final int var = 3;
    static int var1 = 4; //该变量增加 final 后, 反编译代码发生了什么变化? 没有 static {} 代码

    public static void main(String args[]) {
        //System.out.println(IClassInit1.var);
        //System.out.println(IClassInit1.var1);
        //System.out.println(ClassInit5.var);
        //System.out.println(ClassInit5.var1);
        //System.out.println(ClassInit1.var);
        //System.out.println(ClassInit1.var1);
        //new ClassInit1();
        //System.out.println(IClassInit1.var);
        //System.out.println(IClassInit1.var1);
        //System.out.println(ClassInit5.var);
        //System.out.println(ClassInit5.var1);
        //System.out.println(ClassInit1.var);
        //System.out.println(ClassInit1.var1);
    }
}
