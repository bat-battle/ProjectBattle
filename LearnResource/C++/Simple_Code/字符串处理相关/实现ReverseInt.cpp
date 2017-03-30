/** 整数各位反转：
input sample:
    1234
    -12345678
    2
    0
    -0
output sample:
    4321
    -87654321
    2
    0
    0
要求：能接收多组输入，对每组输入将其反转后的整数作为一行输出
**/

#include<stdio.h>
//将一个int数a反转后保存到一个int数中;
//考虑到int的范围,不能处理所有的输入:2012345678
int reverseInt2Int(int a)
{
    int sign = 1;   //符号标记位，1表示正，-1表示负
    int res = 0;    //保存计算结果
    if (a < 0) {    //负数，则把符号位置-1，原数取反
        sign = -1;
        a = -a;
    }
    while (a != 0) { //从个位开始每次取一位
        res = res * 10 + a % 10;
        a /= 10;
    }
    return sign * res; //逆序与符号位相乘
}
//将一个int数a反转后保存到一个字符数组中
char* reverseInt2Str(int a, char *str)
{
    int i = 0;
    if (a < 0) { //负数的情况下，增加符号位
        str[i++] = '-';
        a = -a; //下面只用于处理非负数
    } else if (a == 0) //为0时必须赋‘0’否则就为空串
        str[i++] = '0';
    while (a != 0) { //一直遍历到字符串尾
        str[i++] = a % 10 + 48; //变为数字0到9对应的字符
        a = a / 10;
    }
    str[i] = 0; //一定记得加这一步让串当前尾为空字符，否则会保留上次的结果尾巴
    return str;
}
int main()
{
    //定义保存数字字符串结果的数组,12是最小长度:int最大为21亿+(10位),
    //加一个可能的符号位，然后再加一(最后一个字符为空)
    char str[12] = "";
    int a;
    while (scanf("%d", &a) == 1)
        printf("<%s> \t%d\n", reverseInt2Str(a, str), reverseInt2Int(a));
    return 0;
}
