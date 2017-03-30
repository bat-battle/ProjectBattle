#include <iostream>
#include <string>
#include <bitset>
using namespace std;

//可以将十进制的decimal转化为base进制的数保存到result
string& transform(unsigned decimal,unsigned base,string &result)
{
	if(base==0)
		return result;
    char str[65] = "0"; //防止出现ecimal为0返回空串
    int n;
    for(n=0;decimal;++n) {
        int ch = decimal % base;
        if(ch >= 10)
            str[n] = ch - 10 + 'A';
        else
            str[n] = ch + '0';
        decimal /= base;
    }
    for(int i = 0; i < n / 2; i++) {
        char t = str[i];
        str[i] = str[n - 1- i];
        str[n - 1 - i] = t;
    }
    result = str;
    return result;
}
//通过位操作转换为2进制(支持对负数的转换)
char* getBinaryStr(unsigned num,char dst[])
{
    if(dst==0) //特殊输入处理
        return 0;
    int i=-1, j=i;
    while((num & (0x80000000>>++i))==0 && i<31);//只检查前31位,应对num==0
    for(j=i; i<32; ++i)
        dst[i-j] = 48 + ((num & (0x80000000>>i))!=0);
    dst[i-j] = '\0';
    return dst;
}
//利用STL快速求得二进制
string& to_binary(unsigned decimal,string &result)
{
    bitset<64> bs(decimal);
    result = bs.to_string().substr(bs.to_string().find('1'));
    return result;
}
int main()
{
    unsigned decimal;
    string result(33,'\0');
    cout<<"输入一个要转换的实数:";
    while(cin>>decimal) {
        cout<<"转换后:"<<endl;
        cout<<"2 进制:\n"<<transform(decimal,2,result)<<endl;
        cout<<to_binary(decimal,result)<<endl;
        cout<<getBinaryStr(decimal,&result[0])<<endl;
        cout<<"8 进制:\n0"<<transform(decimal,8,result)<<endl;
        cout<<"16进制:\n0x"<<transform(decimal,16,result)<<endl;
        cout<<"\n输入一个要转换的实数:";
    }
    return 0;
}
