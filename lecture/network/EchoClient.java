
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.BufferedOutputStream;
import java.io.BufferedInputStream;
import java.net.Socket;
import java.nio.ByteBuffer;

/**
 * 问题: 服务端宕机时, 客户端如何检测服务端不可用
 *
 */
public class EchoClient {

    private static volatile boolean error = false;

    public static int getPort(String port) {
        int iport = Integer.valueOf(port);
        if (iport < 0 || iport > 0xFFFF) {
            throw new IllegalArgumentException("Port out of range:"+ iport);
        }
        return iport;
    }

    static public class WriteThread implements Runnable {
        private Socket sock;

        public WriteThread(Socket sock) {
            this.sock = sock;
        }

        public void run() {
            while (true) {
                try {
                    System.out.println("please input you request: ");
                    BufferedReader reqBuf = new BufferedReader(new InputStreamReader(System.in));
                    String cmdStr = reqBuf.readLine();
                    System.out.println(String.format("write request to server: %s", cmdStr));

                    BufferedOutputStream out = new BufferedOutputStream(sock.getOutputStream(), 10);
                    out.write((cmdStr+"\n").getBytes());
                    out.flush();
                } catch (Exception e) {
                    e.printStackTrace();
                    error = true;
                    try {
                        if (sock != null && !sock.isClosed()) {
                            sock.close();
                        }
                    } catch (IOException ex) {
                        ex.printStackTrace();
                    }
                }
                if (error) {
                    break;
                }
            }
        }
    }

    static public class ReadThread extends Thread {
        private Socket sock;

        public ReadThread(Socket sock) {
            this.sock = sock;
        }

        public void run() {
            while (true) {
                try {
                    BufferedReader reqBuf = new BufferedReader(new InputStreamReader(sock.getInputStream()));
                    String reqStr = reqBuf.readLine();
                    if (reqStr == null) {
                        System.out.println("server down unexpectedly .....");
                        error = true;
                        break;
                    }
                    System.out.println(String.format("read request from other client: %s", reqStr));
                } catch (IOException e) {
                    error = true;
                    try {
                        if (sock != null && !sock.isClosed()) {
                            sock.close();
                        }
                    } catch (IOException ex) {
                        ex.printStackTrace();
                    }
                }
                if (error) {
                    break;
                }
            }
        }
    };

    /**
     * Runs the client as an application.  First it displays a dialog
     * box asking for the IP address or hostname of a host running
     * the date server, then connects to it and displays the date that
     * it serves.
     */
    public static void main(String[] args) throws IOException {
        String serverAddress = null;
        int port = 9091;
        if (args.length == 3) {
            serverAddress = args[1];
            port = getPort(args[2]);
        }
        System.out.println(String.format("connect to %s %d", serverAddress, port));
        Socket sock = new Socket(serverAddress, port);
        Thread readThread = new ReadThread(sock);
        Thread writeThread = new Thread(new WriteThread(sock));
        readThread.start();
        writeThread.start();
    }
}
