#include <iostream>
#include <stack>
using namespace std;

class Solution {
public:
    void push(int node)
    {
        stack1.push(node);
    }

    int pop()
    {
        if (stack2.size() <= 0) {
            while (stack1.size() > 0) {
                int& data = stack1.top();
                stack1.pop();
                stack2.push(data);
            }
        }
        if (stack2.size() == 0)
            throw "queue is empty";
        int head = stack2.top();
        stack2.pop();
        return head;
    }

private:
    stack<int> stack1;
    stack<int> stack2;
};
/**
 * 栈1用来插入元素，即push进去，栈2用来弹出栈顶元素（pop），当栈2空的时候，
 * 需要将栈1的元素全部放入栈2中，（此时应该加上锁，即不能有元素插入栈1或者
 * 有元素从栈2弹出）这里可以考虑用多线程，因为对于队列而言，在元素出的同时
 * 是可以有元素进的，所以可以在stack1.push(node);前后分别加锁和解锁，在
 * while(stack1.size()>0)前加锁，在while执行完后解锁
 */

//支持多线程的操作环境
#include <thread>
#include <chrono>
#include <mutex>
#include <cstdlib>
class Solution_MultiThread {
public:
    void push(int node)
    {
        in.lock(); //不让其他线程进元素
        console.lock(); //不让其他线程输出
        cout << node << " push" << endl;
        console.unlock();
        stack1.push(node);
        in.unlock(); //允许其他线程进元素
    }

    int pop()
    {
        out.lock();  //不允许其他线程再出元素
        if (stack2.empty()) {
            if(!stack1.empty()) {
                console.lock(); //不让其他线程输出
                cout << "---moving stack1 to stack2..." << endl;
                console.unlock();
                in.lock(); //不让其他线程进元素
                while (stack1.size() > 0) {
                    int& data = stack1.top();
                    stack1.pop();
                    stack2.push(data);
                }
                in.unlock(); //允许其他线程进元素
            }
        }
        if (stack2.empty()) {
            console.lock(); //不让其他线程输出
            cout << "---data buffer is empty! con't pop!" << endl;
            console.unlock();
            out.unlock(); //允许其他线程出元素
            return -1;
        }
        int head = stack2.top();
        stack2.pop();
        console.lock(); //不让其他线程输出
        cout << "\t" << head << " pop" << endl;
        console.unlock();
        out.unlock(); //允许其他线程出元素
        return head;
    }

private:
    mutex in;  //元素进入时的互斥锁
    mutex out; //元素弹出时的互斥锁
    mutex console; //控制台输出的互斥锁
    stack<int> stack1;
    stack<int> stack2;
};

void pushToStack(Solution_MultiThread& so)
{
    srand((unsigned)time(NULL));
    for (int i = 0; i < 5; ++i) {
        so.push(rand() % 1000); //放入一个随机值
        this_thread::sleep_for(chrono::microseconds(rand() % 100));//休眠一会儿
    }
}
void popFromStack(Solution_MultiThread &so)
{
    srand((unsigned)time(NULL));
    for (int i = 0; i < 7; ++i) {
        so.pop();
        this_thread::sleep_for(chrono::microseconds(rand() % 100));//休眠一会儿
    }
}
int main()
{
    Solution_MultiThread solu;
    solu.push(1);
    solu.push(2);
    solu.push(3);
    //两个写入的线程
    thread th1(pushToStack, ref(solu));
    thread th2(pushToStack, ref(solu));
    //两个弹出的线程
    thread th3(popFromStack, ref(solu));
    thread th4(popFromStack, ref(solu));
    th1.join(); //等待线程1结束
    th2.join(); //等待线程2结束
    th3.join(); //等待线程3结束
    th4.join(); //等待线程4结束
    return 0;
}
