import java.util.concurrent.ConcurrentHashMap;
import java.util.Random;
import java.util.Map;
import java.util.HashMap;

class ConHashMap {

    Map<Integer, Integer> map = new ConcurrentHashMap<>();
    Map<Integer, Integer> map1 = new HashMap<>();
    Random random = new Random();

    class MyRunable implements Runnable {
        int init;
        Map<Integer, Integer> map;

	MyRunable(Map<Integer, Integer> map, int init) {
            this.init = init;
            this.map = map;
        }
 
        @Override
        public void run() {
            put(init);
        }

    	void put(int init) {
    	    for (int i = init; i<init+10000; i++) {
    	        this.map.put(i, random.nextInt(50000));
    	    }
    	}
    }


    void testMap(Map<Integer, Integer> map) {
        MyRunable run1 = new MyRunable(map, 0);
        MyRunable run2 = new MyRunable(map, 10000);
        MyRunable run3 = new MyRunable(map, 20000);
        MyRunable run4 = new MyRunable(map, 30000);
        Thread t1 = new Thread(run1);
        Thread t2 = new Thread(run2);
        Thread t3 = new Thread(run3);
        Thread t4 = new Thread(run4);
        t1.start();
        t2.start();
        t3.start();
        t4.start();
        try {
            t1.join();
            t2.join();
            t3.join();
            t4.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    void test() {
        testMap(map);
        testMap(map1);
    }

    public static void main(String []args) {
        new ConHashMap().test();
    }
}
