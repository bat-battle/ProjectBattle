#include <iostream>
#include <ctime>
using namespace std;
/*
  斐波那契数列
   H(1) = H(0) = 1;
   H(N) = H(N-1) + H(N-2);
*/

// 普通版
int fibonacci(int ac)
{
    if (ac == 0 || ac == 1)  return 1;
    return fibonacci(ac - 1) + fibonacci(ac - 2);
    /*
    int f1 = 1, f2 = 1;
    for(int i = 1; i < ac; ++i) {
        f2 += f1;
        f1 = f2 - f1;
    }
    return f2;
    */
}

//使用元编程 完全特化版 方法如下
template <int N>
struct data {
    //采用枚举
    enum { res = data < N - 1 >::res + data < N - 2 >::res };
};

template <>
struct data<1> {
    //采用枚举
    enum { res = 1L };
};

template <>
struct data<0> {
    //采用枚举
    enum { res = 1L };
};


int main()
{
    time_t  a, b;
    a = clock(); //开始记录时间
    cout << data<45L>::res << endl;
    b = clock(); //开始记录时间
    cout << "采用元编程所消耗的时间: ";
    cout << (double)(b - a) / CLK_TCK << "s" << endl;
    a = clock();
    cout << fibonacci(45L) << endl;
    b = clock();
    cout << "采用普通的递归算法所消耗的时间: ";
    cout << (double)(b - a) / CLK_TCK << "s" << endl;
    cin.get();
    return 0;
}

