/**
 下面是一个利用共有内存实现进程之间的数据共享的Sample程序。
 **/

int createMyFileMap(HANDLE& h, size_t size, const char* str, void* &lp)
{
    h = CreateFileMapping((HANDLE)0xFFFFFFFF, 0, PAGE_READWRITE, 0, size, str);
    if (h == NULL) {
        return -1;
    }
    lp = MapViewOfFile(h, FILE_MAP_WRITE, 0, 0, size);
    if (lp == NULL) {
        return -2;
    }
    return 0;
}

#define _WRITE_0
#ifdef _WRITE_
//写内存程序
//MemWrite.cpp

#include "windows.h"
#include "iostream"
#include "cstring"
using namespace std;

class student {
public:
    long ID;
    char name[20];
    student(long id, const char* _name)
    {
        ID = id;
        strcpy(name, _name);
    }
};

int main()
{
    student stu1(123, "testName"), stu2(321, "name2222");
    student *stu[2] = {&stu1, &stu2};
    student *lpstu;
    HANDLE hMemShare;
    hMemShare = CreateFileMapping((HANDLE)0xFFFFFFFF, 0, PAGE_READWRITE, 0, sizeof(student), "TestMemShare");
    if (hMemShare == NULL) {
        cout << "Failed to Alloocate" << endl;
        return -1;
    }
    lpstu = (student *)MapViewOfFile(hMemShare, FILE_MAP_WRITE, 0, 0, sizeof(student));
    if (lpstu == NULL) {
        cout << "Failed to Map" << endl;
        return -1;
    }
    *lpstu = *stu[0];
    int aa = 1;
    while (1) {
        cout << "当前共享：" << lpstu->ID << endl;
        cin >> aa;
        if (aa == 1)
            *lpstu = *stu[0];
        else if (aa == 2)
            *lpstu = *stu[1];
    }
    UnmapViewOfFile(lpstu);
}

#else
//读内存程序
//MemRead.cpp
#include "windows.h"
#include "iostream"
using namespace std;

class student {
public:
    long ID;
    char name[20];
};

int main()
{
    student stu;
    student *lpstu;
    stu.ID = 0;
    strcpy(stu.name, "tst");
    HANDLE hMemShare = OpenFileMapping(FILE_MAP_READ, FALSE, "TestMemShare");
    if (hMemShare == NULL) {
        cout << "File Open Failed" << endl;
        return -1;
    }
    while (1) {
        lpstu = (student *)MapViewOfFile(hMemShare, FILE_MAP_READ, 0, 0, sizeof(student));
        if (lpstu == NULL) {
            cout << "Failed to Map" << endl;
            return -1;
        }
        stu = *lpstu;
        cout << stu.ID << endl << stu.name << endl;
        cin.get();
    }
    UnmapViewOfFile(lpstu);
}
#endif
