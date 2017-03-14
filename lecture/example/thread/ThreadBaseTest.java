
public class ThreadBaseTest {
    public static class MyRunable implements Runnable {
        private String name;
        private int sleep;

        public MyRunable(String threadName) {
            this.name = threadName;
            this.sleep = 0;
        }

        public MyRunable sleep(int sleepSec) {
            this.sleep = 1000 * sleepSec;
            return this;
        }

        @Override
        public void run() {
            try {
                Thread.sleep(this.sleep);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
            System.out.println(
                    String.format("thread name is %s and id is %s",
                    Thread.currentThread().getId(), this.name));
        }
    }

    public static void main(String[] args) throws InterruptedException {
        Thread thread1 = new Thread(new MyRunable("thread1").sleep(7));
        Thread thread2 = new Thread(new MyRunable("thread2").sleep(4));
        Thread thread3 = new Thread(new MyRunable("thread3").sleep(5));
        //thread1.setDaemon(true);
        //thread2.setDaemon(true);
        //thread3.setDaemon(true);
        thread1.start();
        thread2.start();
        thread3.start();
        //thread1.join();
        //thread2.join();
        //thread3.join();
        System.out.println("done");
    }
}
