/** 实现char* itoa(int value,char* str);将value保存到str中并返回
	扩展:实现char* itoa(int value,char* str,unsigned radix);
		 将value按radix进制保存到str中并返回
 **/
#include<stdio.h>

char* itoa(int num,char* str) {
    char temp;
    unsigned unum = (unsigned)num;
    int i=0,j,k=0;
    if(num<0) { //十进制负数
        unum = -unum;
        str[i++] = '-';
        k = 1;
    }
    //存储数字的每一位
    do {
        str[i++] = unum % 10 + '0';
        unum /= 10;
    } while(unum);
    str[i]='\0';	//最后一位置0！否则容易出现多余字符
    //数组逆序
    for(j=k; j<=(i-1)/2; j++) {
        temp = str[j];
        str[j] = str[i-1+k-j];
        str[i-1+k-j] = temp;
    }
    return str;
}

char* itoa(int num,char* str,unsigned radix) {
    char index[]= "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ",temp;
    unsigned unum = (unsigned)num;
    int i=0,j,k=0;
    if(radix==10 && num<0) { //十进制负数
        unum = -unum;
        str[i++] = '-';
        k = 1;
    }
    //存储数字的每一位
    do {
        str[i++] = index[(unum%radix) % 36];
        unum /= radix;
    } while(unum);
    str[i]='\0';	//最后一位置0！否则容易出现多余字符
    //数组逆序
    for(j=k; j<=(i-1)/2; j++) {
        temp = str[j];
        str[j] = str[i-1+k-j];
        str[i-1+k-j] = temp;
    }
    return str;
}

int main()
{
	int a, base = 16;
    char str[128];
	while(scanf("%d",&a)==1)
		printf("十进制%d对应的%d进制数为 %s\n\n",a,base,itoa(a,str,base));
		//puts(itoa(a,str));
	return 0;
}
