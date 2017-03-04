
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.net.Socket;
import java.net.ServerSocket;
import java.net.SocketException;
import java.nio.ByteBuffer;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.List;
import java.util.ArrayList;

/**
 * 1. 错误处理
 * 2. 内存分配
 * 3. 服务模型 多线程
 * 4. 演示多于线程池的连接时, 后续请求阻塞
 * 5. 问题: 如果非常多的客户端同时连接进来, 如何解决?
 */
public class ChatServer {

    private static Map<String, Socket> sockets = new ConcurrentHashMap<String, Socket>(1);
    private List<Thread> threads = new ArrayList<Thread>(3);
    private ServerSocket listener;

    public Message readObject(Socket sock, Message msg) throws IOException {
        return Message.readMessage(sock.getInputStream(), msg);
    }

    public void writeObject(Socket sock, Message msg) throws IOException {
        Message.writeMessage(sock.getOutputStream(), msg);
    }

    public void handle(Socket socket) throws IOException {
        String thisAddr = String.format("%s:%d",
                socket.getInetAddress().getHostAddress(),
                socket.getPort());
        if (false) {
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            String readStr = in.readLine();
            if (readStr == null) {
                System.out.println(String.format("client %s on thread %d disconnect",
                            thisAddr, Thread.currentThread().getId()));
                //remove the client when the client disconnect
                sockets.remove(socket);
                socket.close();
                throw new IOException("read line error");
            }
            System.out.println(String.format("read client request %s write it other client", readStr));
            for (String s : sockets.keySet()) {
                if (!s.equals(thisAddr)) {
                    Socket tmpSock = sockets.get(s);
                    if (!tmpSock.isClosed()) {
                        BufferedOutputStream out = new BufferedOutputStream(sockets.get(s).getOutputStream());
                        out.write((readStr+"\n").getBytes());
                        out.flush();
                    }
                }
            }
        } else {
            Message msg = null;
            msg = readObject(socket, msg);
            if (msg != null) {
                System.out.println(String.format("client request %s write it other client", msg.getBody()));
                for (String s : sockets.keySet()) {
                    if (!s.equals(thisAddr)) {
                        Socket tmpSock = sockets.get(s);
                        if (!tmpSock.isClosed()) {
                            writeObject(tmpSock, msg);
                        }
                    }
                }
            } else {
                System.out.println("read client error");
            }
        }
    }

    public static boolean read(Socket sock) {
        return false;
    }

    public static boolean write(Socket sock) {
        return false;
    }

    public void start() {
        try {
            this.listener = new ServerSocket(9091);
            if (this.listener != null) {
                System.out.println(String.format("listen at %s %s", listener.getInetAddress().getHostName(), listener.getLocalPort()));
                Socket socket = null;
                while(true) {
                    socket = this.listener.accept();
                    String addr = String.format("%s:%d", socket.getInetAddress().getHostAddress(), socket.getPort());
                    this.sockets.put(addr, socket);
                    Thread processThread = new Thread(new processTask(socket));
                    this.threads.add(processThread);
                    processThread.start();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                this.listener.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            for (Thread t : this.threads) {
                t.interrupt();
            }
        }
    }

    public int countConnection() {
        return sockets.size();
    }

    private class processTask implements Runnable {
        private Socket socket;

        public processTask(Socket socket) {
            this.socket = socket;
        }

        public void run() {
            System.out.println(String.format("remote client %s:%d connected with Thread id %d",
                        socket.getInetAddress().getHostAddress(), socket.getPort(),
                        Thread.currentThread().getId()));
            while (true) {
                boolean error = false;
                try {
                    handle(socket);
                } catch (SocketException e) {
                    e.printStackTrace();
                    error = true;
                } catch (Exception e) {
                    e.printStackTrace();
                    error = true;
                }
                if (error) {
                    if (this.socket != null) {
                        sockets.remove(socket);
                    }
                    if (!this.socket.isClosed()) {
                        try {
                            this.socket.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    break;
                }
                if (this.socket.isClosed()) {
                    break;
                }
            }
        }
    }

    /**
     * Runs the server.
     */
    public static void main(String[] args) {
        ChatServer es = new ChatServer();
        es.start();
    }
}
