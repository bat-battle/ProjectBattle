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
    Vector<Future<Integer>> sumList = new Vector<Future<Integer>>();

    class SumCallable implements Callable<Integer> {
        int init;

        SumCallable(int init) {
            this.init = init;
        }

        @Override
        public Integer call() {
            int sum = 0;
            for (int i = init; i < init + 1000; i++) {
                sum += i;
            }
            return sum;
        }
    }

    void submitTasks() {
        for (int i = 100; i < 1000; i++) {
            Future<Integer> f = service.submit(new SumCallable(i));
            sumList.add(f);
        }
    }

    void dumpResults() {
        int sum = 0;
        for(Future<Integer> f : sumList) {
            try {
                sum += f.get();
            } catch (InterruptedException e) {
            } catch (ExecutionException e) {
            }
        }

        System.out.println(sum);
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
