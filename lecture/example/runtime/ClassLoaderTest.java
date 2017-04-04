
/* java -XX:+TraceClassLoading ClassLoaderTest */
import java.io.InputStream;
import java.io.IOException;

public class ClassLoaderTest {

    @Override
    public int hashCode() {
        return 1;
    }

    @Override
    public boolean equals(Object obj) {
        return true;
    }

    static void test() {
    }

    public void dumpgetParentClassLoader(Class<?> clas) {
        ClassLoader cl = clas.getClassLoader();
        System.out.print(cl.getClass().getName());
        cl = cl.getParent();
        while (cl != null) {
            System.out.print("->" + cl.getClass().getName());
            cl = cl.getParent();
        }
        System.out.println("\n");
    }

    void testNoOuterClassLoader() {
        Object obj1 = new ClassLoaderTest();
        Object obj2 = new ClassLoaderTest();
        System.out.println(obj1.equals(obj2));
    }

    void testOuterClassLoader(String classPath) throws InstantiationException, ClassNotFoundException, IllegalAccessException {
        //ClassLoader myLoader = new ClassLoader() {
        //    @Override
        //    public Class<?>loadClass(String name) throws ClassNotFoundException{
        //        try{
        //            String fileName = name.substring(name.lastIndexOf(".")+1)+".class";
        //            InputStream is= getClass().getResourceAsStream(fileName);
        //            if (is == null) {
        //                return super.loadClass(name);
        //            }
        //            byte[]b = new byte[is.available()];
        //            is.read(b);
        //            return defineClass(name, b, 0, b.length);
        //        } catch(IOException e) {
        //            throw new ClassNotFoundException(name);
        //        }
        //    }
        //};

        //ClassLoader myLoader1 = new ClassLoader() {
        //    @Override
        //    public Class<?>loadClass(String name) throws ClassNotFoundException{
        //        try{
        //            String fileName = name.substring(name.lastIndexOf(".")+1)+".class";
        //            InputStream is= getClass().getResourceAsStream(fileName);
        //            if (is == null) {
        //                return super.loadClass(name);
        //            }
        //            byte[]b = new byte[is.available()];
        //            is.read(b);
        //            return defineClass(name, b, 0, b.length);
        //        } catch(IOException e) {
        //            throw new ClassNotFoundException(name);
        //        }
        //    }
        //};

        MyClassLoader myLoader = new MyClassLoader(classPath);
        MyClassLoader myLoader1 = new MyClassLoader(classPath);
        Class<?> myClass = myLoader.loadClass("ClassLoaderTest");
        Class<?> myClass1 = myLoader1.loadClass("ClassLoaderTest");
        Object obj = null;
        Object obj1 = null;
        Object obj2 = null;
        Object obj3 = null;
        try {
            obj = myClass.newInstance();
            obj1 = myClass.newInstance();
            obj2 = myClass1.newInstance();
            obj3 = new ClassLoaderTest();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }

        System.out.println("obj = myClass.newInstance()");
        System.out.println("obj1 = myClass.newInstance()");
        System.out.println("obj2 = myClass1.newInstance()");
        System.out.println("obj3 = new ClassLoaderTest()");

        System.out.println(obj.getClass());
        System.out.println(obj1.getClass());
        System.out.println(obj2.getClass());

        System.out.println("obj.equals(obj1) = " + obj.equals(obj1));
        System.out.println("obj.equals(obj2) = " + obj.equals(obj2));
        System.out.println("obj.equals(obj3) = " + obj.equals(obj3));
        System.out.println("obj1.equals(obj3) = " + obj1.equals(obj3));
        System.out.println("obj2.equals(obj3) = " + obj2.equals(obj3));

        System.out.println(obj.getClass().getClassLoader().equals(obj1.getClass().getClassLoader()));
        System.out.println(obj.getClass().getClassLoader().equals(obj2.getClass().getClassLoader()));

        dumpgetParentClassLoader(myClass);
        dumpgetParentClassLoader(myClass1);
        System.out.println(obj instanceof ClassLoaderTest);
        System.out.println(obj1 instanceof ClassLoaderTest);
        System.out.println(obj2 instanceof ClassLoaderTest);
    }

    void testOuterClassLoader1(String classPath) throws InstantiationException, ClassNotFoundException, IllegalAccessException {
        ClassLoader myLoader = new ClassLoader() {
            @Override
            public Class<?>loadClass(String name) throws ClassNotFoundException{
                try {
                    String fileName = name.substring(name.lastIndexOf(".")+1)+".class";
                    InputStream is= getClass().getResourceAsStream(fileName);
                    if (is == null) {
                        return super.loadClass(name);
                    }
                    byte[]b = new byte[is.available()];
                    is.read(b);
                    return defineClass(name, b, 0, b.length);
                } catch(IOException e) {
                    throw new ClassNotFoundException(name);
                }
            }
        };

        ClassLoader myLoader1 = new ClassLoader() {
            @Override
            public Class<?>loadClass(String name) throws ClassNotFoundException{
                try{
                    String fileName = name.substring(name.lastIndexOf(".")+1)+".class";
                    InputStream is= getClass().getResourceAsStream(fileName);
                    if (is == null) {
                        return super.loadClass(name);
                    }
                    byte[]b = new byte[is.available()];
                    is.read(b);
                    return defineClass(name, b, 0, b.length);
                } catch(IOException e) {
                    throw new ClassNotFoundException(name);
                }
            }
        };

        Class<?> myClass = myLoader.loadClass("ClassLoading");
        Class<?> myClass1 = myLoader1.loadClass("ClassLoading");
        Object obj = null;
        Object obj1 = null;
        Object obj2 = null;
        try {
            obj = myClass.newInstance();
            obj1 = myClass.newInstance();
            obj2 = myClass1.newInstance();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }

        System.out.println("obj = myClass.newInstance()");
        System.out.println("obj1 = myClass.newInstance()");
        System.out.println("obj2 = myClass1.newInstance()");

        System.out.println(obj.getClass());
        System.out.println(obj1.getClass());
        System.out.println(obj2.getClass());

        System.out.println("obj.equals(obj1) = " + obj.equals(obj1));
        System.out.println("obj.equals(obj2) = " + obj.equals(obj2));
        System.out.println("obj1.equals(obj2) = " + obj1.equals(obj2));

        dumpgetParentClassLoader(myClass);
        dumpgetParentClassLoader(myClass1);
        System.out.println(obj.getClass().getClassLoader().equals(obj1.getClass().getClassLoader()));
        System.out.println(obj.getClass().getClassLoader().equals(obj2.getClass().getClassLoader()));
    }

    public static void main(String[]args)throws Exception{
        new ClassLoaderTest().testNoOuterClassLoader();
        new ClassLoaderTest().testOuterClassLoader(".");
        new ClassLoaderTest().testOuterClassLoader1("/tmp/classLoader/");
    }
}
