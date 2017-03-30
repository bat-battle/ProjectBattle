/**
 已知strcpy函数的原型是：
 char *strcpy(char *dst, const char *src);

 实现strcpy函数
 解释为什么要返回char *
 假如考虑dst和src内存重叠的情况，strcpy该怎么实现
 **/
#include<stdio.h>
#include<assert.h>

char * Strcpy(char *dst,const char *src)   //[1]
{
    assert(dst != NULL && src != NULL);    //[2]
    char *ret = dst;  //[3]
    while ((*dst++=*src++)!='\0'); //[4]
    return ret;
}
int main()
{
    char s1[128],s2[128];
    gets(s1);
    Strcpy(s2,s1);
    puts(s2);
    return 0;
}
/**
[1]const修饰
源字符串参数用const修饰，防止修改源字符串。

[2]空指针检查
(A)不检查指针的有效性，将使代码不具有健壮性。
(B)检查指针的有效性时若使用assert(!dst && !src);
char *转换为bool即是类型隐式转换，这种功能虽然灵活，但更多的是导致出错概率增大和维护成本升高。
(C)检查指针的有效性时使用assert(dst != 0 && src != 0);
直接使用常量（如本例中的0）会减少程序的可维护性。而使用NULL代替0，如果出现拼写错误，编译器就会检查出来。

[3]返回目标地址
(A)必须保存原始的dst值。

[4]'\0'
(A)循环若写成while (*dst++=*src++);有隐式类型转换，不安全且维护成本高。
(B)循环若写成while (*src!='\0') *dst++=*src++;
循环体结束后，dst字符串的末尾没有正确地加上'\0'。

2.为什么要返回char *？
返回dst的原始值使函数能够支持链式表达式。
链式表达式的形式如：
int len=strlen(strcpy(strA,strB));
又如：
char * strA=strcpy(new char[10],strB);

3.假如考虑dst和src内存重叠的情况，strcpy该怎么实现
char s[10]="hello";
strcpy(s, s+1); //应返回ello，
//strcpy(s+1, s); //应返回hhello，但实际会报错，因为dst与src重叠了，把'\0'覆盖了
所谓重叠，就是src未处理的部分已经被dst给覆盖了，只有一种情况：src<=dst<=src+strlen(src)
C函数memcpy自带内存重叠检测功能，下面给出memcpy的实现my_memcpy。

char *my_memcpy(char *dst, const char* src, int cnt)
{
    assert(dst != NULL && src != NULL);
    char *ret = dst;
    if (dst >= src && dst <= src+cnt-1) { //内存重叠，从高地址开始复制
        dst = dst+cnt-1;
        src = src+cnt-1;
        while (cnt--)
            *dst-- = *src--;
    } else { //正常情况，从低地址开始复制
        while (cnt--)
            *dst++ = *src++;
    }
    return ret;
}

char * strcpy(char *dst,const char *src)
{
    assert(dst != NULL && src != NULL);
    char *ret = dst;
    my_memcpy(dst, src, strlen(src)+1);
    return ret;
}

*/
