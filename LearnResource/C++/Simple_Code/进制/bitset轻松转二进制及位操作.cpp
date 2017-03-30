#include <iostream>
#include <string>
#include <bitset>
using namespace std;
//将一个数的每一位加到sum对应位上,注意bit和string的[]操作不一样
void bitAdd(string& sum, const bitset<32>& bit)
{
    for(int i = 0; i < 32; ++i)
        sum[31 - i] += bit[i];
}
//将sum中每一位都对3取余然后加上字符'0'得到只包含01的二进制串,然后让bitset计算该二进制表示对应的十进制
unsigned long bitMod(string& sum, int mod = 3)
{
    for(int i = 0; i < 32; ++i)
        sum[i] = (sum[i] % mod) + '0';
    return bitset<32>(sum).to_ulong(); //将一个string对象传给bitset然后再调用to_ulong成员函数
}
/** 示例输入:
4
1 2 1 1
7
1 2 1 3 2 1 2
*/
int main()
{
    int n, num;
    while(cin >> n && n > 0) { //如果这组测试数据包含几个整数
        string sum(32, 0); //用一个拥有32个字符的字符串存储多个数字对应二进制位求和结果
        for(int i = 0; i < n; ++i) { //依次输入n个整数
            cin >> num;
            bitAdd(sum, num); //对该数的每一位进行统计并增加到sum记录中
        }
        cout << bitMod(sum) << endl; //输出每一位mod之后的结果
    }
    //附加：用bitset进行十进制到二进制的转换
    int a;
    while(cin >> a) {
        bitset<32> bit(a); //这个整形数a可以用32位的二进制表示,所以加一个32
        cout << bit << endl;
        //下面是更人性化的二进制显示,即去除前导0
        string binary = bit.to_string(); //调用成员函数返回字符串形式
        cout<<binary.substr(binary.find('1'))<<endl; //得到从第一个1的位置开始的字符串
    }
    return 0;
}
