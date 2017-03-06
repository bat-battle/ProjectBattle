
import java.io.File;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.Writer;
import java.io.OutputStreamWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedInputStream;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.util.Date;

class IOTest {

    void testFile() throws IOException {
        File f = new File("iotest");
        f.setExecutable(false);
        f.createNewFile();
        f.setWritable(false);
        System.out.println(f.canExecute());
        System.out.println(f.canRead());
        System.out.println(f.canWrite());
        f.setReadable(false);
        //仅自己可读
        f.setReadable(true);
        //仅自己不可读
        f.setReadable(false);
        //仅自己可读
        f.setReadable(true, true);
        //自己和其他都给可以读
        f.setReadable(true, false);
        //仅仅自己不可读
        f.setReadable(false, true);
        //自己和其他都不可读
        f.setReadable(false, false);
        //f.setReadable(true, true);
        //f.setReadOnly();
        //f.setWritable(true, false);
        f.setExecutable(true);
        System.out.println(f.canExecute());
        System.out.println(f.canRead());
        System.out.println(f.canWrite());
        System.out.println(f.isFile());
        System.out.println(f.isDirectory());
        System.out.println(f.getTotalSpace());
        System.out.println(f.getUsableSpace());
        System.out.println(f.getAbsolutePath());
        System.out.println(f.getCanonicalPath());
        System.out.println(f.getFreeSpace());
        System.out.println(f.getName());
        System.out.println(f.getPath());
    }

    void testDir() throws IOException {
        File f = new File("iodir");
        for (int i = 0; i < 10; i++) {
            File tmpF = new File(f, i + ".txt");
            tmpF.createNewFile();
        }
        for (String file : f.list()) {
            File tmpF = new File(f, file);
            if (!tmpF.isDirectory()) {
                System.out.println(file);
            }
        }
        f.mkdir();
        File f1 = new File(f, "123");
        f1.mkdir();
        File f2 = new File("iodir1", "123");
        f2.mkdirs();
        System.out.println(f.getParent());
        System.out.println(f1.getParent());
        System.out.println(f2.getParent());
        System.out.println(f2.toURI());

        for (File fr : File.listRoots()) {
            System.out.println(fr.getPath());
        }
    }

    void testReadFile() throws IOException {
        //Writer out = new BufferedWriter(new OutputStreamWriter());
        File f = new File("iotest");
        f.setReadable(true);
        f.setWritable(true);
        BufferedWriter out = new BufferedWriter(new FileWriter(f));
        char []writeChars = new char[] { '1', '2', '3' };
        out.write(writeChars);
        out.write("abc", 0, 3);
        out.flush();
        out.close();

        BufferedReader in = new BufferedReader(new FileReader(f));
        StringBuilder outputStr = new StringBuilder(10);
        char[] readBuf = new char[10];
        int readLen = in.read(readBuf, 0, readBuf.length);
        while (readLen != -1){
            outputStr.append(readBuf, 0, readLen);
            System.out.println(outputStr);
            readLen = in.read(readBuf, 0, readBuf.length);
        }
        System.out.println(outputStr.toString());
        in.close();
    }

    void testObjectStream() throws IOException {
        File f = new File("ioobject");
        f.createNewFile();
        FileOutputStream fos = new FileOutputStream(f);
        ObjectOutputStream oos = new ObjectOutputStream(fos);
        oos.writeInt(12345);
        oos.writeObject("Today");
        oos.writeObject(new Date());
        oos.close();

        FileInputStream fis = new FileInputStream(f);
        ObjectInputStream ois = new ObjectInputStream(fis);
        int i = ois.readInt();
        String today = null;
        Date date = null;
        try {
            today = (String) ois.readObject();
            date = (Date) ois.readObject();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        ois.close();
        System.out.println(i);
        System.out.println(today);
        System.out.println(date);
    }

    void testFileStream() throws IOException {
        File f = new File("iostream");
        f.createNewFile();
        FileOutputStream fos = new FileOutputStream(f);
        BufferedOutputStream bos = new BufferedOutputStream(fos);

        String str = "hello java";
        bos.write(str.getBytes());
        bos.close();

        FileInputStream fis = new FileInputStream(f);
        BufferedInputStream bis = new BufferedInputStream(fis);
        StringBuilder outputStr = new StringBuilder(10);
        byte [] readBytes = new byte[100];
        int readLen = bis.read(readBytes, 0, readBytes.length);
        while(readLen != -1) {
            outputStr.append(new String(readBytes, 0, readLen));
            readLen = bis.read(readBytes, 0, readBytes.length);
        }
        bis.close();
        System.out.println(outputStr.toString());
    }


    public static void main(String []args)  throws IOException {
        //new IOTest().testFile();
        //new IOTest().testReadFile();
        //new IOTest().testFileStream();
        new IOTest().testObjectStream();
    }
}
