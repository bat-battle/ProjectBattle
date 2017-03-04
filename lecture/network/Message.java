
import java.util.Date;
import java.io.ObjectOutput;
import java.io.OutputStream;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectInput;
import java.io.InputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.Serializable;

class Message implements Serializable {
    private String user;
    private int seq;
    private String date;
    private String body;

    Message(String user, int seq, String body) {
        this.user = user;
        this.seq = seq;
        this.body = body;
        this.date = new Date().toString();
    }

    public String getUser() {
        return this.user;
    }

    public int getSeq() {
        return this.seq;
    }

    public String getDate() {
        return this.date;
    }

    public String getBody() {
        return this.body;
    }

    static void readMessage(InputStream is, String msg) throws IOException {
        //ByteArrayInputStream bis = new ByteArrayInputStream(bytes);
        ObjectInput in = null;
        try {
          in = new ObjectInputStream(is);
          Object o = in.readObject();
          msg = (String)o;
          System.out.println("msg : " + msg);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            //try {
            //  if (in != null) {
            //    in.close();
            //  }
            //} catch (IOException ex) {
            //    e.printStackTrace();
            //}
        }
    }

    static Message readMessage(InputStream is, Message msg) throws IOException {
        //ByteArrayInputStream bis = new ByteArrayInputStream(bytes);
        //ObjectInput in = null;
        ObjectInput in = null;
        try {
            in = new ObjectInputStream(is);
            Object o = in.readObject();
            msg = (Message)o;
            msg = new Message(msg.getUser(), msg.getSeq(), msg.getBody());
            System.out.println("msg : " + msg.getDate() + msg.getBody());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            //try {
            //  if (in != null) {
            //    in.close();
            //  }
            //} catch (IOException ex) {
            //    e.printStackTrace();
            //}
        }
        return msg;
    }

    static void writeMessage(OutputStream os, String msg) throws IOException {
        //ByteArrayOutputStream bos = new ByteArrayOutputStream();
        ObjectOutput out = null;
        try {
          out = new ObjectOutputStream(os);
          out.writeObject(msg);
          out.flush();
          //byte[] bytes = bos.toByteArray();
          //return bytes;
        } finally {
            //try {
            //  os.close();
            //} catch (IOException e) {
            //    e.printStackTrace();
            //  // ignore close exception
            //}
        }
    }

    static void writeMessage(OutputStream os, Message msg) throws IOException {
        //ByteArrayOutputStream bos = new ByteArrayOutputStream();
        ObjectOutput out = null;
        try {
          out = new ObjectOutputStream(os);
          out.writeObject(msg);
          out.flush();
          //byte[] bytes = bos.toByteArray();
          //return bytes;
        } finally {
            //try {
            //  os.close();
            //} catch (IOException e) {
            //    e.printStackTrace();
            //  // ignore close exception
            //}
        }
    }

    private void writeObject(ObjectOutputStream s) throws IOException {
        s.writeUTF(user);
        s.writeInt(seq);
        s.writeUTF(date);
        s.writeUTF(body);
    }

    private void readObject(ObjectInputStream s) throws IOException, ClassNotFoundException {
        user = s.readUTF();
        seq = s.readInt();
        date = s.readUTF();
        body = s.readUTF();
    }
}
