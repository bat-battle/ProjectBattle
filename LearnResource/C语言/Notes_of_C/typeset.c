#include <stdio.h>
#include <string.h>

#define N 80

void edit(char *s)
{
	int i = 0,sp = 0,w = 0,inw = 0,v = 0,r = 0;
	char buf[N], *str;
	for(;s[i] != '\0';i++){
		if(s[i]==' ')//计算空格的个数 
		{
			printf("come in if\n");
			sp++;
			inw = 0;
		}
		else if(!inw)//当前一个是空格时进入方法，inw的初始值，代表人为地在之前设定了一个空格 
		{
			w++;
			inw = 1;
		}
	}
	if(w <= 1)
		return;
	v = sp / (w - 1);//评价每两个单词之间的空格数 
	r = sp % (w - 1);//多余的空格数 
	strcpy(buf, s);
	for(str = buf;;){
		printf("come in for\n");
		while(*str == ' ')//这里应该是当str指向的字符是空格终止，此后不应该再对指针进行操作，所以 *str++ == ' '是错误的，因为当循环条件不满足时，并不代表着while循环终止，还会对str进行加一操作 
		{
			str++;
		}
		     
		for(;*str&&*str != ' ';)
		{
			*s = *str;//对单个字符进行复制 
			s++;
			str++;
		}
		if( --w == 0)
			return;
		for(i = 0;i<v;i++)
		{
			*s++ = ' ';//赋值空格 
		
		}
		if(r){
			*s++ = ' ';//赋值多余的空格 
			--r;
		}
	}
}

char input[N];


void main(){
	printf("please input....\n");
	gets(input);
	edit(input);
	printf("after editing is \n");
	printf("%s",input);
	
}
