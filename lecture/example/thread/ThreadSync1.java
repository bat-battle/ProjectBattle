import java.util.ArrayList;

class ThreadSync1 {
    private ArrayList<Integer> arrayList = new ArrayList<Integer>();
    private int size = 0;

    public class MyRunable implements Runnable {
        private String name;
        private int mysize;

        public MyRunable(String threadName, int size) {
            this.name = threadName;
            this.mysize = size;
        }

        @Override
        public void run() {
            //syncInsert();
            //insert();

            syncIntOuter();
            syncInt();
            //System.out.println(mysize);
        }

	    public synchronized void syncInt() {
            for (int i = 0; i < 500; i++) {
                mysize++;
            }
            System.out.println(mysize);
	    }

	    public synchronized void syncInsert() {
	        for (int i = mysize; i<50; i++) {
	            arrayList.add(i);
	        }
	        //System.out.println(Thread.currentThread().getName()+" insert "+i);
	    }

	    public void insert() {
	        for (int i = mysize; i < 5; i++) {
	            arrayList.add(i);
	        }
	        //System.out.println(Thread.currentThread().getName()+" insert "+i);
	    }
    }

	public synchronized void syncIntOuter() {
        for (int i = 0; i < 500; i++) {
            size++;
        }
        System.out.println("outer " + size);
	}

    public void testInsert() throws InterruptedException {
        MyRunable run1 = new MyRunable("thread1", 0);
        MyRunable run2 = new MyRunable("thread1", 100);
        MyRunable run3 = new MyRunable("thread1", 200);
        Thread t1 = new Thread(run1, "线程 1");
        Thread t2 = new Thread(run2);
        Thread t3 = new Thread(run3);
        t1.start();
        t2.start();
        t3.start();
        t1.join();
        t2.join();
        t3.join();
        System.out.println(size);
    }

    public static void main(String []args) throws InterruptedException {
        new ThreadSync1().testInsert();
    }
}

