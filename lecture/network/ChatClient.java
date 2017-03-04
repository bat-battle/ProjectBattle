
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.BufferedOutputStream;
import java.io.BufferedInputStream;
import java.net.Socket;
import java.nio.ByteBuffer;

import java.io.OutputStream;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;

/**
 * 问题: 服务端宕机时, 客户端如何检测服务端不可用
 *
 */
public class ChatClient {

    private static volatile boolean error = false;

    public static int getPort(String port) {
        int iport = Integer.valueOf(port);
        if (iport < 0 || iport > 0xFFFF) {
            throw new IllegalArgumentException("Port out of range:"+ iport);
        }
        return iport;
    }

    public Message readObject(Socket sock, Message msg) throws IOException {
        return Message.readMessage(sock.getInputStream(), msg);
    }

    public void writeObject(Socket sock, Message msg) throws IOException {
        Message.writeMessage(sock.getOutputStream(), msg);
    }

    public boolean read(Socket sock) {
        try {
            if (false) {
                BufferedReader reqBuf = new BufferedReader(new InputStreamReader(sock.getInputStream()));
                String reqStr = reqBuf.readLine();
                if (reqStr == null) {
                    System.out.println("server down unexpectedly .....");
                    error = true;
                }
                System.out.println(String.format("read request from other client: %s", reqStr));
            } else {
                Message msg = null;
                msg = readObject(sock, msg);
                if (msg != null) {
                    System.out.println(msg.getDate() + ": " + msg.getBody());
                } else {
                    System.out.println("read server error");
                }
            }
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
        return error;
    }

    public boolean write(Socket sock) {
        try {
            System.out.println("please input you request: ");
            BufferedReader reqBuf = new BufferedReader(new InputStreamReader(System.in));
            String cmdStr = reqBuf.readLine();
            System.out.println(String.format("write request to server: %s", cmdStr));
            if (false) {
                BufferedOutputStream out = new BufferedOutputStream(sock.getOutputStream(), 10);
                out.write((cmdStr+"\n").getBytes());
                out.flush();
            } else {
                String addr = String.format("%s:%d", sock.getInetAddress().getHostAddress(), sock.getPort());
                writeObject(sock, new Message(addr, 1, cmdStr));
            }
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
        return error;
    }

    public class WriteThread implements Runnable {
        private Socket sock;

        public WriteThread(Socket sock) {
            this.sock = sock;
        }

        public void run() {
            while (true) {
                error = write(this.sock);
                if (error) {
                    break;
                }
            }
        }
    }

    public class ReadThread extends Thread {
        private Socket sock;

        public ReadThread(Socket sock) {
            this.sock = sock;
        }

        public void run() {
            while (true) {
                error = read(this.sock);
                if (error) {
                    break;
                }
            }
        }
    };


    void start(String serverAddress, int port) throws IOException {
        System.out.println(String.format("connect to %s %d", serverAddress, port));
        Socket sock = new Socket(serverAddress, port);
        Thread readThread = new ReadThread(sock);
        Thread writeThread = new Thread(new WriteThread(sock));
        readThread.start();
        writeThread.start();
    }
    /**
     * Runs the client as an application.  First it displays a dialog
     * box asking for the IP address or hostname of a host running
     * the date server, then connects to it and displays the date that
     * it serves.
     */
    public static void main(String[] args) {
        String serverAddress = null;
        int port = 9091;
        if (args.length == 3) {
            serverAddress = args[1];
            port = getPort(args[2]);
        }
        try {
            new ChatClient().start(serverAddress, port);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
