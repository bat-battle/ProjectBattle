/**
 * 更多关于字节对齐问题的解析请移步博文：
 * 《struct/class等内存字节对齐问题详解》：http://www.cnblogs.com/webary/p/4721017.html
**/
#include <iostream>
#include <cstring>
using namespace std;
struct A {
    int  a;
    char b;
};
struct B {
    char c;
    int  d;
    long long e;
};
struct BB: A {
    char c;
    int  d;
    long long e;
};
/**
 * struct继承时，基类的成员总是在派生类的前面。而且即使有字节对齐,基类对齐后
 * 派生类的成员不会占用基类填充的字节,即计算好基类所占字节数后，这些字节只能
 * 由基类拥有,不能被派生类的成员占用(即char b后面有3字节的填充,之后才有char c)
 * 在派生类中成员的分布只需满足每个变量起始字节序号为该类型所占字节数的整数倍
 * 且最终大小为占用字节数最大的类型对应的字节数的整数倍
 如下:
  0   4   8   12  16      24
  |   |   |   |   |       |
  aaaab---c---ddddeeeeeeee
**/

struct C {
    A a;
    char c;
    B b;
};
/**
 * 类之间出现关联关系时：
 * 必须满足：
 * 1.结构体/类与结构体/类之间不会共用自动补齐的内存，即一个结构体变量/对象
     对齐之后填补的内存不允许被其他变量/对象占用
 * 2.结构体的起始字节位置必须是该结构体中所占字节数最大的变量的字节数的整数倍
 * 3.最终所占字节数必须是最大所占字节数最大的变量的字节数的整数倍。
*/
#pragma pack(push)  //保存对齐状态
#pragma pack(4)     //设定为4字节对齐
struct Test {
    char a;
    char b;
    long long c;
    int d;
    char e;
    short f;
    long long g;
};
#pragma pack(pop)  //恢复对齐状态
/**
 * 强制对齐前：
    01      8       16  20  24
    ||      |       |   |   |
    ab------ccccccccdddde-ffgggggggg
 * 强制对齐后：
    01  4       12  16  20
    ||  |       |   |   |
    ab--ccccccccdddde-ffgggggggg
 * 说明：
    使用强制对齐预处理指令
    #pragma pack(4)
    后,本来所占字节数不到4字节的成员按照原定方式排列,即从起始字节序号为自己整数倍
    的位置开始,而大于4字节的成员按照起始字节序号为4的整数倍的位置开始
    特别说明：使用#pragma pack(size)时size必须为一个2的较小的整数次幂,即1,2,4,8...
 * n字节对齐就是说变量存放的起始地址的偏移量有两种情况：
    1.如果n大于等于该变量所占用的字节数，那么偏移量必须满足默认的对齐方式;
    2.如果n小于该变量的类型所占用的字节数，那么偏移量为n的倍数，不用满足默认
      的对齐方式。
   结构的总大小也有个约束条件，分下面两种情况：
    1.如果n大于所有成员变量类型所占用的字节数，那么结构的总大小必须为占用空间最大
      的变量占用的空间数的倍数;
    2.否则必须为n的倍数。
*/

#define show(t) \
{ \
    for(char* p = (char*)&t; p - (char*)&t < sizeof(t); ++p) \
        cout<<*p; \
    cout<<endl; \
}

int main()
{
    cout << "sizeof(A): " << sizeof(A) << "\nsizeof(B): " << sizeof(B) << endl;
    cout << "sizeof(BB): " << sizeof(BB) << "\nsizeof(C): " << sizeof(C) << endl;
    cout << "sizeof(Test): " << sizeof(Test) << endl;
    //利用先初始化为-然后逐个成员赋值让其自动填充-
    BB bb;
    memset(&bb, '-', sizeof(BB));
    bb.a = 0x61616161;
    bb.b = 0x62;
    bb.c = 0x63;
    bb.d = 0x64646464;
    bb.e = 0x6565656565656565;
    show(bb);
    //利用临时变量来让栈自动填充为-
    {
        C c;
        memset(&c, '-', sizeof(c));
    }
    C c = {{0x61616161, 0x62}, 0x63, {0x63, 0x64646464, 0x6565656565656565}};
    show(c);
    //利用临时变量来让栈自动填充为-
    {
        Test t;
        memset(&t, '-', sizeof(t));
    }
    Test t = {0x61, 0x62, 0x6363636363636363, 0x64646464, 0x65, 0x6666,
              0x6767676767676767
             };
    show(t);
    return 0;
}
