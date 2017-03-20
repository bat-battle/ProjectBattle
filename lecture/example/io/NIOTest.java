import java.nio.channels.FileChannel;
import java.nio.ByteBuffer;
import java.nio.Buffer;
import java.io.FileInputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.StandardOpenOption;
import java.nio.file.Path;
import java.nio.file.FileSystems;
import java.io.RandomAccessFile;
import java.io.FileNotFoundException;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.MappedByteBuffer;
import java.nio.charset.Charset;
import java.util.SortedMap;
import java.util.Map;
import java.nio.charset.StandardCharsets;
import java.nio.charset.CharsetDecoder;

class NIOTest {

    public static void mmap() throws Exception {
		RandomAccessFile raf = new RandomAccessFile("C:\\mapfile.txt", "rw");
		FileChannel fc = raf.getChannel();
		// 将文件映射到内存中
		MappedByteBuffer mbb = fc.map(FileChannel.MapMode.READ_WRITE, 0,
				raf.length());
		while (mbb.hasRemaining()) {
			System.out.print((char) mbb.get());
		}
		mbb.put(0, (byte) 98); // 修改文件
		raf.close();
	}

    /*
     * 基于此可以实现目录级别的文件拷贝, 加上多线程, 实现
     * 多线程的文件夹拷贝
     */
    public void nioCopyFile(String resource, String destination)
    			throws IOException {
    		FileInputStream fis = new FileInputStream(resource);
    		FileOutputStream fos = new FileOutputStream(destination);
    		FileChannel readChannel = fis.getChannel(); // 读文件通道
    		FileChannel writeChannel = fos.getChannel(); // 写文件通道
    		ByteBuffer buffer = ByteBuffer.allocate(1024); // 读入数据缓存
    		while (true) {
    			buffer.clear();
    			int len = readChannel.read(buffer); // 读入数据
    			if (len == -1) {
    				break; // 读取完毕
    			}
    			buffer.flip();
    			writeChannel.write(buffer); // 写入文件
    		}
    		readChannel.close();
    		writeChannel.close();
    }

    public void mapCopyFile(String src, String dst) throws FileNotFoundException,IOException {
        CharsetDecoder decoder = Charset.forName("utf-8").newDecoder();
        try (FileChannel inChannel = new FileInputStream(src).getChannel();
                FileChannel outChannel = new FileOutputStream(dst).getChannel()) {
            //inChannel.size() 是否可以替代 new File(src).length()
            MappedByteBuffer buffer = inChannel.map(FileChannel.MapMode.READ_ONLY, 0, new File(src).length());
            displayBufferInfo(buffer, "init buffer");

            // 将Buffer内容一次写入另一文件的Channel
            outChannel.write(buffer);
            buffer.flip();
            // 解码CharBuffer之后输出
            System.out.println(decoder.decode(buffer));
        }
    }

    public void byteBufferTest() {
        ByteBuffer buffer = ByteBuffer.allocate(64);
        displayBufferInfo(buffer, "init");

        buffer.put((byte) 'a');
        buffer.put((byte) 'b');
        buffer.put((byte) 'c');
        displayBufferInfo(buffer, "after put");

        buffer.flip();
        displayBufferInfo(buffer, "after flip");
        System.out.println((char) buffer.get());
        displayBufferInfo(buffer, "after a get");
        buffer.put((byte) 'c');
        buffer.put((byte) 'd');
        buffer.put((byte) 'e');
        buffer.rewind();
        displayBufferInfo(buffer, "after a rewind");

        buffer.clear();
        displayBufferInfo(buffer, "after clear");
        // 依然可以访问到数据
        System.out.println((char) buffer.get(2));
    }

    private void displayBufferInfo(Buffer buffer, String msg) {
        System.out.println("---------" + msg + "-----------");
        System.out.println("position: " + buffer.position());
        System.out.println("limit: " + buffer.limit());
        System.out.println("capacity: " + buffer.capacity());
    }

    public void getGetAllCharsets() {
        SortedMap<String, Charset> charsetMap = Charset.availableCharsets();
        for (Map.Entry<String, Charset> charset : charsetMap.entrySet()) {
            System.out.println(charset.getKey() + " aliases -> " + charset.getValue().aliases() + " chaset -> " + charset.getValue());
        }
    }

    public void testGetCharset() {
        Charset utf8 = Charset.forName("UTF-8");
        Charset unicode11 = Charset.forName("unicode-1-1-utf-8");
        System.out.println(utf8.name());
        System.out.println(unicode11.name());
        System.out.println(unicode11 == utf8);

        utf8 = StandardCharsets.UTF_8;
        unicode11 = Charset.forName("unicode-1-1-utf-8");
        System.out.println(utf8.name());
        System.out.println(unicode11.name());
        System.out.println(unicode11 == utf8);
    }

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

    void fileChannelTest1() throws FileNotFoundException, IOException {
		RandomAccessFile file = new RandomAccessFile("ch.log", "r");
		FileChannel fileChannel = file.getChannel();
		ByteBuffer byteBuffer = ByteBuffer.allocate(512);
		while (fileChannel.read(byteBuffer) > 0) {
			// flip the buffer to prepare for get operation
			byteBuffer.flip();
			while (byteBuffer.hasRemaining()) {
				System.out.print((char) byteBuffer.get());
			}
			// clear the buffer ready for next sequence of read
			byteBuffer.clear();
		}
		file.close();
    }



    public static void main(String []args) throws IOException {
        //new NIOTest().test();
        new NIOTest().fileChannelTest();
    }
}
