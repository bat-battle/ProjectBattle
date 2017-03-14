
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

class ConditionTest {
    Lock lock = new ReentrantLock();
    Condition con1 = lock.newCondition();
    volatile boolean con1True = false;
    volatile boolean con2True = false;
    volatile boolean con3True = false;
    Condition con2 = lock.newCondition();
    Condition con3 = lock.newCondition();

    void print1() throws InterruptedException {
        lock.lock();
        try {
            System.out.println(Thread.currentThread().getName() + " " + 1);
            System.out.println(Thread.currentThread().getName() + " " + 2);
            System.out.println(Thread.currentThread().getName() + " " + 3);
            con2.signal();
            con1.await();
        } finally {
            lock.unlock();
        }

    }

    void print2() throws InterruptedException {
        lock.lock();
        try {
            con2.await();
            System.out.println(Thread.currentThread().getName() + " " + 4);
            System.out.println(Thread.currentThread().getName() + " " + 5);
            System.out.println(Thread.currentThread().getName() + " " + 6);
            con3.signal();
        } finally {
            lock.unlock();
        }
    }

    void print3() throws InterruptedException {
        lock.lock();
        try {
            con3.await();
            System.out.println(Thread.currentThread().getName() + " " + 7);
            System.out.println(Thread.currentThread().getName() + " " + 8);
            System.out.println(Thread.currentThread().getName() + " " + 9);
            con1.signal();
        } finally {
            lock.unlock();
        }
    }

    void test() throws InterruptedException {
        Thread t1 = new Thread() {
             public void run() {
                 try {
                     for (int i = 0; i < 3; i++) {
                         print1();
                     }
                 } catch (InterruptedException e) {
                     System.out.println("stop");
                 }
             }
        };
        Thread t2 = new Thread() {
             public void run() {
                 try {
                     for (int i = 0; i < 3; i++) {
                         print2();
                     }
                 } catch (InterruptedException e) {
                     System.out.println("stop");
                 }
             }
        };
        Thread t3 = new Thread() {
             public void run() {
                 try {
                     for (int i = 0; i < 3; i++) {
                         print3();
                     }
                 } catch (InterruptedException e) {
                     System.out.println("stop");
                 }
             }
        };
        t3.start();
        t2.start();
        t1.start();
        t1.join();
        t2.join();
        t3.join();
    }

    public static void main(String []args) throws InterruptedException {
        new ConditionTest().test();
    }
}
