/**
 要求：不使用字符串处理库函数,自己动手实现strlen、strcpy、strcat、strcmp、strchr的功能
 **/
#include<stdio.h>
//求字符串的长度
unsigned strlen(const char* src)
{
    if(src==0 || *src=='\0')
        return 0;
    char *ptr = (char*)src;
    while(*ptr != '\0')
        ++ptr;
    return ptr - src;
}

//strcpy见单独文件

//连接两个字符串
char* strcat ( char * dst , const char * src )
{
    if(dst==0 || src==0)
        return dst;
    char *pszOrigDst = dst;
    while( *dst !='\0')
        dst++;
    while( (*dst++ = *src++)!='\0' )
        ;
    return pszOrigDst;
}
/*如果dest > source,则返回值大于0，
  如果dest = source,则返回值等于0，
  如果dest < source,则返回值小于0。*/
int strcmp(const char *dst, const char *src)
{
    if(NULL==dst || NULL==src)
        return 0;
    while (*dst && *src && (*dst == *src)) {
        ++dst;
        ++src;
    }
    return *dst - *src;
}
//在字符串src中找到第一个c的位置并返回
const char* strchr(const char* src,char c)
{
    if(src==0 || c=='\0')
        return 0;
    while(*src!='\0') {
        if(*src==c)
            return src;
        ++src;
    }
    return 0; //没有找到该字符
}

int main()
{
    char aa[128] = "123", bb[11] = "456";
    char *pStr = strcat(aa,bb);
    puts(pStr);
    printf("strlen(aa)=%d,strcmp(aa,bb)=%d\n%s\n",strlen(aa),strcmp(aa,bb),strchr(aa,'5'));
    return 0;
}
