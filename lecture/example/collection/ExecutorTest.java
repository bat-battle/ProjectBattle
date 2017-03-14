import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.Callable;
import java.util.Vector;
import java.util.concurrent.ExecutionException;

/*
 * 1. 定义任务执行方式 Executors
 * 2. 定义任务做什么 Callable, Runnable
 * 3. 提交任务 submit
 * 4. 获取任务结果 Future
 * 例子 : 领导分配任务, 老师布置家庭作业
 */
class ExecutorTest {

     ExecutorService service = Executors.newCachedThreadPool();
     ExecutorService nft = Executors.newFixedThreadPool();
     Vector<Future<String>> res = new Vector<Future<String>>();
     ExecutorCompletionService ecs = new ExecutorCompletionService(nft, new ArrayBlockingQueue<String>(10));

     class MyCallable implements Callable<String> {
          String result;
          MyCallable(String result) {
              this.result = result;
          }
          @Override
          public String call() {
              return result;
          }
     }

     class MyRunnable implements Runnable {
          @Override
          public void run() {
              for(int i = 0; i<1000; i++) {}
          }
     }

     void submitTasks1() {
         //ExecutorCompletionService ecs = new ExecutorCompletionService(nft);
          for (int i = 0; i < 10; i ++) {
              ecs.submit(new MyCallable("call " + i));
          }
          for (int i = 0; i < 10; i ++) {
              ecs.submit(new MyRunnable(), "run " + i);
          }
     }

     void getTaskResult() {
          //for (int i = 0; i < 20; i++) {
          //    Future f = ecs.take();
          //    System.out.println(f.get());
          //} 

          while(true) {
              int doneNum = 0;
              for (int i = 0; i < 20; i++) {
                  Future f = ecs.poll();
                  if (f.isDone()) {
                      System.out.println(f.get());
                  }
              } 
              if (doneNum == 20) {
                  break;
              }
          }
     }

     void submitTasks() {
          for (int i = 0; i < 10; i ++) {
              Future<String> f = service.submit(new MyCallable("call " + i));
              res.add(f);
          }
          for (int i = 0; i < 10; i ++) {
              Future<String> f = service.submit(new MyRunnable(), "run " + i);
              res.add(f);
          }
     }

     void dumpResults() {
          for(Future<String> f : res) {
              try {
                  System.out.println(f.get());
              } catch (InterruptedException e) {
              } catch (ExecutionException e) {
              }
          } 
     }
     
     void test() {
          submitTasks();
          dumpResults();
          service.shutdown();
     }

     static public void main(String []args) {
         new ExecutorTest().test();
     }
}
