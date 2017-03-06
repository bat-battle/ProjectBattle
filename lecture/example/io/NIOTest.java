import java.nio.channels.FileChannel;
import java.nio.ByteBuffer;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.StandardOpenOption;
import java.nio.file.Path;
import java.nio.file.FileSystems;

class NIOTest {
    void test() {
        ByteBuffer buf = ByteBuffer.allocate(20);
        byte []orgBytes = new byte[] { 1, 2, 3, 4, 5, 6, 7 };
        byte []newBytes = new byte[10];
        buf.limit(15);
        System.out.println(buf.position());
 	    System.out.println(buf.remaining());
        buf.put(orgBytes, 0, orgBytes.length);
        System.out.println(buf.position());
 	    System.out.println(buf.remaining());
 	    //System.out.println(buf.capacity());
        //buf.limit(10);
        //System.out.println(buf.limit());
 	    //System.out.println(buf.remaining());
        buf.rewind();
        //buf.flip();
        System.out.println(buf.position());
 	    System.out.println(buf.remaining());
 	    //System.out.println(buf.capacity());
        buf.get(newBytes, 0, newBytes.length);
        System.out.println(buf.position());
 	    System.out.println(buf.remaining());
        for (byte b : newBytes) {
            System.out.println(b);
        }
        buf.flip();
        System.out.println(buf.position());
 	    System.out.println(buf.remaining());
        buf.get(newBytes, 0, newBytes.length);
        System.out.println(buf.position());
 	    System.out.println(buf.remaining());
        for (byte b : newBytes) {
            System.out.println(b);
        }
        for (byte b : buf.array()) {
            System.out.println(b);
        }
        System.out.println(buf.isDirect());
    }

    void fileChannelTest() throws IOException {
        //FileChannel ch = new FileInputStream("iochannel").getChannel();
        Path path = FileSystems.getDefault().getPath("iodir", "ch.log");
        FileChannel ch = FileChannel.open(path, StandardOpenOption.CREATE,
                StandardOpenOption.READ, StandardOpenOption.WRITE);
        byte []orgBytes = new byte[] { 1, 2, 3, 4, 5, 6, 7 };
        byte []newBytes = new byte[10];
        System.out.println("size is :" + ch.size());
        ch.write(ByteBuffer.wrap(orgBytes));
        ch.force(true);
        System.out.println("write after size is :" + ch.size());
        System.out.println("read positon" + ch.position());
        ch.read(ByteBuffer.wrap(newBytes));
        ch.read(ByteBuffer.wrap(newBytes));
        for (byte b : newBytes) {
            System.out.println(b);
        }
        ch.close();
    }

    public static void main(String []args) throws IOException {
        //new NIOTest().test();
        new NIOTest().fileChannelTest();
    }
}
