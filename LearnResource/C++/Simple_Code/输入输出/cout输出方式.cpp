#include<iostream>
using namespace std;

int p()
{
    cout << 'p' << 1;
    return 2;
}
int q()
{
    cout << 'q' << 3;
    return 4;
}
int main()
{
    cout << '<' << p() << q() << '>' << endl;
    // 调用顺序为: main(),
    // '>'入栈,
    //      进入q(), 3入栈, 'q'入栈, 输出q3, q()返回4
    // 4入栈
    //      进入p(), 1入栈, 'p'入栈, 输出p1, p()返回2
    // 2入栈
    // '<'入栈
    // 输出<24>
    //总结为一句就是:cout从右到左依次入栈,如果cout里调用了一个函数,先进这个函数
    //如果这个函数有输出,就依然按照从右到左入栈然后输出,再返回结果
    return 0;
}
