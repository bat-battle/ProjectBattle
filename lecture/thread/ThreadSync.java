import java.util.ArrayList;

class ThreadSync {

    Object obj = new Object();

    public class MyRunable implements Runnable {
        private String name;

        public MyRunable(String threadName) {
            this.name = threadName;
        }

        @Override
        public void run() {
            synchronized (obj) {
            //synchronized (this) {
                for (int i = 0; i < 5; i++) {
                    System.out.println(this.name + " loop " + i);
                }
            }
        }
    }

    public void testSync() {
        new Thread(new MyRunable("thread1")).start();
        new Thread(new MyRunable("thread2")).start();
    }

    public static void main(String []args) {
        new ThreadSync().testSync();
    }
}
