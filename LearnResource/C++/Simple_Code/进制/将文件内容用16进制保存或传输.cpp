#include<ctime>
#include<cstring>
#include<fstream>
#include<iostream>
using namespace std;
class CXXFStream {
    fstream file;
    unsigned size;
    char ox2d[55];  //保存16进制对应位的十进制数;48~57表示0~9;
public:
    CXXFStream(const char* _name, ios_base::openmode _mode): file(_name, _mode |= ios::binary)
    {
        if (!file) {
            size = 0;
            return;
        }
        file.seekg(0, ios::end);
        size = (long)file.tellg();
        file.seekg(0, ios::beg);//move the pointer to the start
        int i;
        for (i = 0; i < 10; ++i) //0~9
            ox2d[i] = i;
        for (i = 49; i < 55; ++i) //a~f、A~F
            ox2d[i] = ox2d[i - 32] = i - 39;
    }
    ~CXXFStream()
    {
        file.close();
    }
    unsigned readString(char* _str, unsigned _count)
    {
        if (size == 0 || _str == 0 || _count == 0)
            return 0;
        char ch[1];
        unsigned i = 0;
        for (i = 0; i < _count && file.read(ch, sizeof(ch)); ++i) { //读取文件中的内容
            sprintf(_str + 2 * i, "%02x", int(ch[0]) + 128);
        }
        return i;
    }
    void writeString(const char* _str, unsigned _count)
    {
        if (_str == 0 || _count == 0)
            return ;
        unsigned i = 0;
        for (i = 0; i < _count; ++i) {
            char ch[1] = {getOX(_str[i << 1], _str[1 + (i << 1)]) - 128};
            file.write(ch, sizeof(ch));
        }
    }
    void close()
    {
        file.close();
    }
    int getOX(int a, int b) //将2个16进制转换为一个10进制数返回
    {
        if (a > 47 && a < 103 && b > 47 && b < 103)
            return (ox2d[a - 48] << 4) + ox2d[b - 48];
        else
            return 48;
    }
    const unsigned& getSize()
    {
        return size;
    }
    fstream& getStream()
    {
        return file;
    }
};

char fileData[16000000];//支持16M的文件
int main()
{
    char fileName[256] = "a";
    cout << "请输入需要读取的文件的文件名: ";
    cin >> fileName;
    CXXFStream Fin(fileName, ios::in), Fout("输出文件.doc", ios::out);
    //char *pCH = new char[2*Fin.getSize()+1];
    cout << "已读取" << Fin.readString(fileData, Fin.getSize()) << "字节" << endl;
    Fout.writeString(fileData, Fin.getSize());
    Fin.close();
    Fout.close();
    //system("pause");
    return 0;
}
