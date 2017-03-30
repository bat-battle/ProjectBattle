#include <iostream>
#include <fstream>
#include <string>
using namespace std;
/**
本代码主要使用了getline()函数,用法如下:
  输入流对象可以是标准输入流对象cin,也可以是一个文件输入流对象fin;
  (1)输入流对象的成员函数:
   basic_istream<char>&
   istream::getline(char *str, streamsize n, char delim = '\n');
   这个函数是成员函数，所以必须通过对象调用.streamsize为signed integer type
   @prama:str为C字符数组的首地址,保存最终读取的结果.注意是字符数组
   @prama:n为最多读取的字符个数
   @prama:delim可选,表示读取到该字符时自动停止读取,默认为换行符
  (2)全局函数
   basic_istream<char>&
   getline(basic_istream<char>& in, string& str);
   @prama:in为输入流对象的引用;
   @prama:str为需要保存读取的数据的目的字符串,注意是string对象的引用
**/

const char sep[3] = { 0x1F, 0x7C }; //分隔符
int main()
{
    //下面语句输出一条离线消息到文件
    ofstream fout("ol_msg.msg", ios::app);
    string fromUser = "userA";
    if (fout.is_open()) {
        fout << fromUser << sep << __TIME__ << sep << "hello!" << endl;
        fout.close();
    }
    ///第一种方式,每次读取一个字段,通过传递读取结束标志来自动找到字段的结束
    ifstream fin("ol_msg.msg");
    if (fin.is_open()) {
        cout << "From:\tOn:\t\tContent: " << endl;
        while (!fin.eof()) { //未到文件尾
            char _from[20];
            if (!fin.getline(_from, 20, sep[0]))
                break;
            fin.ignore(1); //忽略一个字符

            char _time[20];
            fin.getline(_time, 20, sep[0]);
            fin.ignore(1); //忽略一个字符

            string content;
            getline(fin, content); //读取该行剩余的内容即为消息内容
            cout << _from << "\t" << _time << "\t" << content << endl;
        }
        fin.close();
    }
    cout << endl;
    ///第二种方式,每次读取一行,然后再通过查找分隔符来分开各个字段
    ifstream fin2("ol_msg.msg");
    if (fin2.is_open()) {
        string line;
        while (getline(fin2, line)) { //成功读取到一行
            string _time, content;
            string::size_type pos = line.find(sep); //查找分隔符的位置
            fromUser = line.substr(0, pos); //提取左边的部分为第一字段
            line = line.substr(pos + 2); //将第一字段内容去掉

            pos = line.find(sep); //查找第二个分隔符
            _time = line.substr(0, pos); //提取第二字段

            content = line.substr(pos + 2); //剩余的为第三字段
            cout << fromUser << "\t" << _time << "\t" << content << endl;
        }
        fin2.close();
    }
    //ofstream f_del("ol_msg.msg"); //清空文件内容
    //f_del.close();
    return 0;
}
