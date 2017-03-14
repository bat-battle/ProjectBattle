import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.Iterator;

public class ConQueueTest {

    ArrayBlockingQueue<Integer> intQueue = new ArrayBlockingQueue<>(10);
    Integer []intArray = new Integer[] {1, 2, 3, 4, 5, 6};
    CopyOnWriteArrayList<Integer> list = new CopyOnWriteArrayList<Integer>(intArray);

    void add() {
        for (int i = 0; i<10; i++) {
            list.add(i);
        }
    }

    void dump() {
        Iterator<Integer> iter = list.iterator();
        while(iter.hasNext()) {
            System.out.println(iter.next());
        }
    }

    class AddThread extends Thread {
        @Override
        public void run() {
            add();
        }
    }

    class DumpThread extends Thread {
        @Override
        public void run() {
            dump();
        }
    }

    public void put() {
        for (int i = 0; i < 10; i++) {
            try {
                intQueue.put(i);
            } catch (InterruptedException e) {
                System.out.println("continue");
                continue;
            }
        }
    }

    void take() {
        for (int i = 0; i < 12; i++) {
            try {
            	System.out.println(intQueue.take());
            } catch (InterruptedException e) {
                System.out.println("continue");
                continue;
            }
        }
    }

    class PutThread extends Thread {
         @Override
         public void run() {
            put(); 
            try {
                 Thread.sleep(10000);
            } catch (InterruptedException e) {
            }
            put(); 
         }
    }

    class TakeThread extends Thread {
         @Override
         public void run() {
            take();
         }
    }

    void test1() {
        Thread t1 = new PutThread();
        Thread t2 = new TakeThread();
        t1.start();
        t2.start();
        try {
            t1.join();
            //t2.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    void test2() {
        Thread t1 = new AddThread();
        Thread t2 = new DumpThread();
        t1.start();
        t2.start();
        try {
            t1.join();
            t2.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    

    public static void main(String []args) {
        //new ConQueueTest().test1();
        new ConQueueTest().test2();
    }
}
