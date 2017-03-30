#include<iostream>
#include<iomanip>

using namespace std;

int main()
{
    cout<<setprecision(4)<<3.14159<<endl;
    cout<<setw(30)<<'a'<<endl;
    cout<<setw(30)<<setfill('%')<<3.14159<<endl; //上面设置的精度在这里仍有效
    cout<<setfill(' ')<<3.14159<<"$"<<endl; //上面设置的宽度在这里已失效
    cout<<setw(30)<<setiosflags(ios::right)<<3.14159<<endl;//填充已失效
    cout<<setw(30)<<3.14159<<endl; //上面设置的对齐标志仍有效
    return 0;
}
/**
输出结果如下：
3.142
                             a
%%%%%%%%%%%%%%%%%%%%%%%%%3.142
3.142$
                         3.142
                         3.142
**/
/*	头文件为 iomanip
setprecision(n)  设置小数点后保留 n-1 位    ==持久有效
setw(m)          设置总域宽为m (包含小数点) ==临时有效
setfill('%')     设置填充为字符'%'          ==临时有效
setiosflags(ios::left)  设置对齐方式为左对齐(默认为右对齐) ==持久有效
*/
