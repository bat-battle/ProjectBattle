#include<stdio.h>	//sprintf
#include<string.h>	//strcpy
#include<windows.h>	//GetPrivateProfileString..
#include<iostream>	//cout
using namespace std;
int main()
{
    char str[50];
    //Get..节点+键名+读取失败时默认值+[目的字符串+最大字符数]+ini文件位置(必须包含\\)
    GetPrivateProfileString("SET_VAR","Name","default",str,50,".\\set.ini");
    cout<<str<<endl;
    int getID = GetPrivateProfileInt("SET_VAR","ID",0,".\\set.ini");
    cout<<getID<<endl;
    strcpy(str,"wenbo");
    //Write..节点+键名+需写入的字符串+配置文件目录(必须包含\\)
    WritePrivateProfileString("SET_VAR","Name",str,".\\set.ini");
    sprintf(str,"%d",21);
    WritePrivateProfileString("SET_VAR","Age",str,".\\set.ini");
    cin.get();
    //写入注释，多次写入不会删除以前的
    sprintf(str,"#年龄\nage=%d%s",21,"");
    WritePrivateProfileString("SET_VAR2","age",str,".\\set.ini");
    memset(str,0,sizeof(str));	//灰常重要
    strcpy(str,"#学号\nstuID=1210313209");
    WritePrivateProfileSection("SET_VAR2",str,".\\set.ini");

    //从配置文件读取变量的配置参数，如果没有则填写默认值
    int value1;
    int save=GetPrivateProfileInt("Setting","value1",-1,".\\set.ini");
    if(save<4 || save>50) {
        WritePrivateProfileString("Setting","value1","10",".\\set.ini");
        value1 = 10;
    } else {
        value1 = save;
    }
    /**
     * 此外还有写函数:
     * WritePrivateProfileStruct
     * WritePrivateProfileSection:该函数第二个参数中数组必须清零再使用，否则乱码
     * WritePrivateProfileString()
     * 函数的第二个参数为0时将删除该节
     * 第三个参数为0时将删除该键及其值
     */
}
