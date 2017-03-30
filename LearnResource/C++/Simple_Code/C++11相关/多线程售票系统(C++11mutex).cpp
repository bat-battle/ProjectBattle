#include <iostream>
#include <mutex>
#include <thread>
#include <chrono>
#include <cstdlib>
#include <ctime>
using namespace std;

class TicketMgr
{
    static TicketMgr* instance;
    int count; //票源剩余数量
    int ticketID; //票号
    //多线程支持
    static mutex mt_ins; //创建实例的互斥锁
    mutex mt_ticket; //对票操作的互斥锁
private:
    //设置私有的构造函数和复制构造函数
    TicketMgr() {
        count = 20; //初始化票数
        ticketID = 1603160001;
    }
    TicketMgr(const TicketMgr&) {}
public:
    //获取车票管理的对象，必须设置为静态函数
    static TicketMgr* getInstance() {
        if(instance == NULL) {
            mt_ins.lock();
            if(instance == NULL)
                instance = new TicketMgr;
            mt_ins.unlock();
        }
        return instance;
    }
    //售票
    int sell() {
        mt_ticket.lock();
        if(count == 0) { //啊哦没票了,直接返回好了
            mt_ticket.unlock();
            return 0;
        }
        --count;
        int id = ticketID++;
        mt_ticket.unlock();
        return id;
    }
    //增加票源数
    void addCount(int cnt) {
        mt_ticket.lock();
        count += cnt;
        mt_ticket.unlock();
    }
    //获取余票数
    int getCount() {
        mt_ticket.lock(); //其他线程在修改票数的时候不允许取票数
        int cnt = count;
        mt_ticket.unlock();
        return cnt;
    }
};
//凡是在类中声明的静态数据成员必须在类外定义(static const int变量除外)
TicketMgr* TicketMgr::instance = NULL;
mutex TicketMgr::mt_ins;

mutex mt_cout; //用于输出操作的互斥锁
//专门负责不断售票的函数，可看作一个售票点
void sellTicket(const string& user)
{
    srand((unsigned)time(NULL) + user[0]);
    TicketMgr* tk_mgr = TicketMgr::getInstance();
    while(tk_mgr->getCount() > 0) {
        int id = tk_mgr->sell();
        mt_cout.lock();
        if(id != 0)
            cout << "售票员" << user << "卖出一张票,票号为WH" << id << endl;
        else
            cout << "售票员" << user << "卖票失败,票源不足,请及时补充！" << endl;
        mt_cout.unlock();
        this_thread::sleep_for(chrono::milliseconds(rand() % 100));//休眠一会儿
    }
}

int main()
{
    thread td1(sellTicket, "Miranda-lym");
    thread td2(sellTicket, "webary");
    td1.join();
    td2.join();
    return 0;
}
