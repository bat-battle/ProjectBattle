/**
 * 借助strtok实现split
 */
#include <string.h>
#include <stdio.h>
#include <ctype.h>

#include<iostream>
#include<string>
using namespace std;
void splitWords()
{
    string line, word, alpha(53,'-');  //alpha保存可能的单词中的字符，即大小写字母或连字符
    string::size_type pos=0, posEnd=0;
    for(int i=0; i<26; ++i) {
        alpha[i] = 'A' + i;
        alpha[i+26] = 'a' + i;
    }
    //获取一行输入
    while(getline(cin,line)) {
		pos = 0;
        while(pos!=string::npos) {  //未到字符串尾
            pos = line.find_first_of(alpha,pos); //找到第一个特定字符位置
            posEnd = line.find_first_not_of(alpha,pos); //找到第一个不是特定字符的位置
			if(pos==posEnd) //未找到第一个特定字符
				break;
			word = line.substr(pos,posEnd-pos); //把特定字符组成的单词提取
			if(word!="-") //如果提取结果仅仅为一个连字符则不是英语单词
				cout<<word<<endl; //如果是一个单词，则输出该单词
            pos = posEnd; //从刚查找到的第一个不是特定字符的位置开始继续搜索
        }
    }
}

int main(int argc,char *argv[])
{
	/* //C版本
    if(argc>1)
        freopen(argv[1],"r",stdin);
    else
        freopen("artical.txt","r",stdin);
    freopen("words.txt","w",stdout);
    char s[1024] = " this is  a test,simple * test2!  ";
    const char *d = " ,.!?$:;()[]{}~#&%^…_@|<>'\"\\\t*+=/，。！？：；‘`·《》【】　 ";
    while(gets(s)) {
        char *p = strtok(s,d);
        while(p) {
            printf("%s\n",p);
            p=strtok(NULL,d);
        }
    }
	*/
    //C++形式
    splitWords();
    return 0;
}
