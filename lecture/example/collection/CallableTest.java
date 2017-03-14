import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.Callable;



class CallableTest {
    void test() {
    	Callable<String> task = new Callable<String>() {
            @Override
    	    public String call() {
    	        return "hello";
    	    }
    	};

        ExecutorService executor = Executors.newFixedThreadPool(2);
        Future<String> future = executor.submit(task);
        try {
            String str = future.get();
            System.out.println(str);
            executor.shutdown();
        } catch (Exception e) {
        }
    }

    static public void main(String []args) {
        new CallableTest().test();
    }
}
