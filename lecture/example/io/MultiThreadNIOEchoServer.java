import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.nio.channels.spi.AbstractSelector;
import java.nio.channels.spi.SelectorProvider;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class MultiThreadNIOEchoServer {

	class EchoClient {
		private LinkedList<ByteBuffer> outq;

		EchoClient() {
			outq = new LinkedList<ByteBuffer>();
		}

		public LinkedList<ByteBuffer> getOutputQueue() {
			return outq;
		}

		public void enqueue(ByteBuffer bb) {
			outq.addFirst(bb);
		}
	}

	class HandleMsg implements Runnable {
		SelectionKey sk;
		ByteBuffer bb;

		public HandleMsg(SelectionKey sk, ByteBuffer bb) {
			super();
			this.sk = sk;
			this.bb = bb;
		}

		@Override
		public void run() {
			EchoClient echoClient = (EchoClient) sk.attachment();
			echoClient.enqueue(bb);
			sk.interestOps(SelectionKey.OP_READ | SelectionKey.OP_WRITE);
			selector.wakeup();
		}
	}

	private Selector selector;
	private ExecutorService ecs = Executors.newCachedThreadPool();

	private void startServer() throws Exception {
        //创建 selector
		selector = SelectorProvider.provider().openSelector();

		ServerSocketChannel ssc = ServerSocketChannel.open();
        //设置非阻塞
		ssc.configureBlocking(false);
		InetSocketAddress isa = new InetSocketAddress(8000);
		ssc.socket().bind(isa);
        System.out.println("Listen on 8000");
		// 注册 ssc 到 selector, 关注 ACCEPT 事件
		SelectionKey acceptKey = ssc.register(selector, SelectionKey.OP_ACCEPT);
		for (;;) {
			selector.select();
			Set<SelectionKey> readyKeys = selector.selectedKeys();
			Iterator<SelectionKey> keysIter  = readyKeys.iterator();
			long e = 0;
			while (keysIter.hasNext()) {
				SelectionKey sk = keysIter.next();
				keysIter.remove();
				if (sk.isAcceptable()) {
					doAccept(sk);
				} else if (sk.isValid() && sk.isReadable()) {
					doRead(sk);
				} else if (sk.isValid() && sk.isWritable()) {
					doWrite(sk);
				}
			}
		}
	}

	private void doWrite(SelectionKey sk) {
		// TODO Auto-generated method stub
		SocketChannel channel = (SocketChannel) sk.channel();
		EchoClient echoClient = (EchoClient) sk.attachment();
		LinkedList<ByteBuffer> outq = echoClient.getOutputQueue();
		ByteBuffer bb = outq.getLast();
		try {
			int len = channel.write(bb);
			if (len == -1) {
				disconnect(sk);
				return;
			}
			if (bb.remaining() == 0) {
				outq.removeLast();
			}
		} catch (Exception e) {
			// TODO: handle exception
			disconnect(sk);
		}
		if (outq.size() == 0) {
			sk.interestOps(SelectionKey.OP_READ);
		}
	}

	private void doRead(SelectionKey sk) {
		SocketChannel channel = (SocketChannel) sk.channel();
		ByteBuffer bb = ByteBuffer.allocate(8192);
		int len;
		try {
            //将收到的消息读到 bb
			len = channel.read(bb);
			if (len < 0) {
				disconnect(sk);
				return;
			}
		} catch (Exception e) {
			disconnect(sk);
			return;
		}
        //准备写
		bb.flip();
        //将消息加入 sk 对应的 echoClient 的队列, 并关注可读可写事件
		ecs.execute(new HandleMsg(sk, bb));
	}

	private void disconnect(SelectionKey sk) {
		// TODO
	}

    /*
     * 服务端接受客户端连接, 将该连接对应的 channel 加入 selector
     *
     * clientChannel -> clientKey -> echoClient
     */
	private void doAccept(SelectionKey sk) {
		ServerSocketChannel server = (ServerSocketChannel) sk.channel();
		SocketChannel clientChannel;
		try {
            //服务端接受客户端连接
			clientChannel = server.accept();
            //客户端连接配置非阻塞
			clientChannel.configureBlocking(false);
            //将客户端 channel 注册到 selector, 关注可读事件
			SelectionKey clientKey = clientChannel.register(selector,
					SelectionKey.OP_READ);
			EchoClient echoClient = new EchoClient();
            //将 clientKey 与 echoClient 绑定
			clientKey.attach(echoClient);

			InetAddress clientAddress = clientChannel.socket().getInetAddress();
			System.out.println("Accepted connection from " + clientAddress.getHostAddress());
		} catch (Exception e) {
            e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		MultiThreadNIOEchoServer echoServer = new MultiThreadNIOEchoServer();
		try {
			echoServer.startServer();
		} catch (Exception e) {
            e.printStackTrace();
		}

	}

}
