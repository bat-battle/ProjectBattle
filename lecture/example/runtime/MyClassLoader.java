

import java.io.FileInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

public class MyClassLoader extends ClassLoader {

    //需要加载类.class文件的目录
    private String classDir;

    //无参的构造方法，用于class.newInstance()构造对象使用
    public MyClassLoader(){
    }

    public MyClassLoader(String classDir){
        this.classDir = classDir;
    }

    @SuppressWarnings("deprecation")
    @Override
    protected Class<?> findClass(String name) throws ClassNotFoundException {
        //class文件的路径
        String classPathFile = classDir + "/" + name + ".class";
        try {
            //将class文件进行解密
            FileInputStream fis = new FileInputStream(classPathFile);
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            //encodeAndDecode(fis,bos);
            byte[] classByte = bos.toByteArray();
            //将字节流变成一个class
            return defineClass(classByte, 0, classByte.length);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return super.findClass(name);
    }

    public static void main(String[] args) throws Exception{
        ////配置运行参数
        //String srcPath = args[0];//ClassLoaderAttachment.class 原路径
        //String desPath = args[1];//ClassLoaderAttachment.class 输出的路径
        //String desFileName = srcPath.substring(srcPath.lastIndexOf("/")+1);
        //String desPathFile = desPath + "/" + desFileName;
        //FileInputStream fis = new FileInputStream(srcPath);
        //FileOutputStream fos = new FileOutputStream(desPathFile);
        ////将class进行加密
        ////encodeAndDecode(fis,fos);
        //fis.close();
        //fos.close();
    }

    /**
     * 加密和解密算法
     * @param is
     * @param os
     * @throws Exception
     */
    private static void encodeAndDecode(InputStream is, OutputStream os) throws Exception{
        int bytes = -1;
        while((bytes = is.read())!= -1){
            bytes = bytes ^ 0xff;//和0xff进行异或处理
            os.write(bytes);
        }
    }
}
