/** 在C++中,obj是一个类的对象,p是指向obj的指针,该类里面有个数据成员mem,
 * 请问obj.mem和p->mem在实现和效率上有什么不同?
 *
 * 答案是：只有一种情况下才有重大差异，该情况必须满足以下3个条件：
 * (1) obj 是一个虚继承的派生类的对象
 * (2) mem是从虚基类派生下来的成员
 * (3) p是基类类型的指针
 */

#include<iostream>
using namespace std;

class A {
public:
    int a;
};

class B : virtual public A {
public:
    int b;
};

class C : virtual public A {
public:
    int c;
};

class D : public B, public C {
public:
    int d;
};
/**
 * 上面这种菱形的继承体系中,如果没有virtual继承,那么D中就有两个A的成员int a;
 * 继承下来,使用的时候,就会有很多二义性.而加了virtual继承,在D中就只有A的成员
 * int a;的一份拷贝,该拷贝不是来自B,也不是来自C,而是一份单独的拷贝
 */

int main()
{
}
