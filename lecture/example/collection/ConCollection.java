
import java.util.ArrayList;
import java.util.Vector;

class ConCollection {
     ArrayList<Integer> list = new ArrayList<Integer>();
     Vector<Integer> vec = new Vector<Integer>();
     final int count = 100000;

     void incList(int init) {
         for (int i = init; i < init + count;  i++) {
             list.add(i);
         }
     }

     void synchronized incVector(int init) {
         for (int i = init; i < init + count;  i++) {
             vec.add(i);
         }
     }
     
     class MyThreadList extends Thread {
         int init;
         MyThreadList(int init)  {
             init = init;
         }

         @Override
         public void run() {
             incList(init);
         }
     }

     class MyThreadVector extends Thread {
         int init;
         MyThreadVector(int init)  {
             init = init;
         }

         @Override
         public void run() {
             incVector(init);
         }
     }

     void test() {

         Thread t1 = new MyThreadList(0);
         Thread t2 = new MyThreadList(100000);
         Thread t3 = new MyThreadList(200000);
         Thread t4 = new MyThreadVector(0);
         Thread t5 = new MyThreadVector(100000);
         Thread t6 = new MyThreadVector(200000);
         t1.start();
         t2.start();
         t3.start();
         t4.start();
         t5.start();
         t6.start();
         try {
             t1.join();
             t2.join();
             t3.join();
             t4.join();
             t5.join();
             t6.join();
         } catch (InterruptedException e) {
             e.printStackTrace();
         }
         for (int i : vec.subList(10000, 10100)) {
             System.out.println(i);
         }
     }

     static public void main(String []args) {
         new ConCollection().test();
     }
}
