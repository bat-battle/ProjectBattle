/*
*  配置文件读取类。 可读取.ini格式的配置文件
*/
/*
//#define _GNU_SOURCE
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
*/
#include <string>
#include <vector>
#include <fstream>
#include <iostream>
using namespace std;
class INI_Util {
    typedef struct {
        string key;		//关键字
        string value;	//键值
    } Record;
    typedef struct {
        string node;		//节点名
        vector<Record> set;	//记录集合
    } Group;
    vector<Group> conf;

    string defaultNode;	//默认查找节点
    string state;		//搜索状态,查找失败是存储失败原因

public:
//定义一个自动访问容器中每个元素的宏，需要C++11的支持(auto)
#define For_each(it,vec) for(auto it=vec.begin();it<vec.end();++it)
    INI_Util(const string &iniFileName) {
        loadINI(iniFileName);
        defaultNode = state = "";
    }
    //载入一个ini文件
    void loadINI(const string &iniFileName);
    //获取查询结果
    string getRecord(const string &key,const string node = "");
    //获取查询状态
    string getState()const {
        return state;
    }
    //设置默认节点
    void setDefaultNode(const string &node) {
        defaultNode = node;
    }
    //获取当前默认节点
    const string& getDefaultNode()const {
        return defaultNode;
    }
public:
    //去除字符串s首尾的空格和\t
    const static string& trim(string &s) {
        if(s.empty())
            return s;
        s.erase(0,s.find_first_not_of(" \t"));
        s.erase(s.find_last_not_of(" \t") + 1);
        return s;
    }
};

void INI_Util::loadINI(const string &iniFileName) {
    ifstream readINI(iniFileName);
    if(readINI.is_open()) {
        //清除以前的信息
        For_each(it,conf)
        it->set.clear();
        conf.clear();
        string line;
        string::size_type pos;
        string tmpNode = "";
        while(getline(readINI,line)) {
            trim(line);
            if(line[0]=='[' && line[line.length()-1]==']') {  //检查该行是不是声明节点
                tmpNode = line.substr(1,line.length()-2);
                continue;
            }
            pos = line.find('=');
            if(pos==line.npos)
                continue;
            string tmpKey = line.substr(0,pos);
            string tmpValue = line.substr(pos+1);
            bool found = false;
            For_each(it,conf) {
                if(it->node == tmpNode) {
                    it->set.push_back((Record) { trim(tmpKey),trim(tmpValue) });
                    found = true;
                    break;
                }
            }
            if(!found) {    //当前数据集没有存储该节点，先创建该节点，再插入新键值对
                conf.push_back((Group){ tmpNode,vector<Record>() });
                conf.rbegin()->set.push_back((Record){ tmpKey,tmpValue });
            }
        }
        readINI.close();
    }
}

string INI_Util::getRecord(const string &key,const string node) {
    if(key=="") {
        state = "key is invalid!";
        return "";
    }
    string findNode = node;
    if(node=="")
        findNode = defaultNode;
    state = "Node '"+findNode+"' not found!";
    For_each(it,conf) {
        if(it->node==findNode) {
            state = "key '"+key+"' not found!";
            For_each(it2,it->set) {
                if(it2->key==key) {
                    state = "key '"+key+"' find out!";
                    return it2->value;
                }
            }
            break;
        }
    }
    return "";
}

//测试运行部分
#include <ctime>
int main() {
    int start = clock();
    INI_Util ini("set.ini");
    cout<<clock()-start<<endl;

    ini.setDefaultNode("MyCNN");
    for(int i=0; i<10000; ++i) {	//Windows ：40ms
        string find = ini.getRecord("key_name");
        ini.getRecord(find);
        //cout<<find<<" = "<<ini.getRecord(find)<<endl;
        //cout<<ini.getState();
    }
    cout<<clock()-start<<endl;
    cin.get();
    return 0;
}
