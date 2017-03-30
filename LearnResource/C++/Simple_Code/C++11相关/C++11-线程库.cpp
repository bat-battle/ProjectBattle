///示例1
#include <iostream>
#include <thread>
#include <string>
using namespace std;

void hello(const string& str)
{
    cout << str;
}

int main2()
{
    thread t(hello, "hello ");
    thread t2(hello, "world!");
    t.join();
    t2.join();
    return 0;
}
///示例2
#include <windows.h>
#include <iostream>
#include <thread>
#include <mutex>
using namespace std;

void mbox(const char* msg, const char* caption = "温馨提示")
{
    MessageBox(0, msg, caption, 0);
}

void f1(int n, mutex &mtx_cout, volatile bool& stop)
{
    for (int i = 0; i < 5; ++i) {
        mtx_cout.lock();
        cout << "Thread " << n << " executing" << endl;
        mtx_cout.unlock();
        this_thread::sleep_for(chrono::milliseconds(10));
    }
    thread *t = new thread(mbox, "线程1执行中，等待结束...", "温馨提示");
    while(!stop)
        this_thread::sleep_for(chrono::milliseconds(10));
}

void f2(int& n, mutex& mtx_cout)
{
    for (int i = 0; i < 5; ++i) {
        mtx_cout.lock();
        cout << "Thread 2 executing" << endl;
        mtx_cout.unlock();
        ++n;
        this_thread::sleep_for(chrono::milliseconds(5));
    }
}

int main()
{
    mutex mtx_cout; //创建输出的互斥量，保证多个线程正常向控制台输出
    volatile bool stop = 0;
    int n = 0;
    thread t1(f1, n + 1, ref(mtx_cout), ref(stop)); // n+1 pass by value
    thread t2(f2, ref(n), ref(mtx_cout)); // n pass by reference
    mbox("按确认退出线程1");
    stop = 1;
    t1.join();
    t2.join();
    cout << "Final value of n is " << n << endl;
    return 0;
}

//示例3，用自定义类再次封装thread类，实现自动在析构的时候调用join()
class MyThread : public thread {
public:
    explicit MyThread()
    {
    }
    template<typename _Callable, typename... _Args>
    explicit MyThread(_Callable&& __f, _Args&&... __args)
        : thread(__f, __args...)
    {
    }
    ~MyThread()
    {
        if(joinable())
            join();
    }
};
MyThread tt(hello, "global ");
