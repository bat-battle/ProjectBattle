/**
 下面是一个利用共享内存实现进程之间的数据共享(通信)的例程。
 **/
//读内存程序
#include <windows.h>
#include <iostream>
using namespace std;

int openMyFileMap(void* &lp,size_t size,const char* str)
{
	HANDLE h = OpenFileMapping(FILE_MAP_READ | FILE_MAP_WRITE,0,str);
	if(h == NULL)
	{
		cout<<"File Open Failed"<<endl;
		return -1;
	}
	lp = MapViewOfFile(h,FILE_MAP_READ | FILE_MAP_WRITE,0,0,size);
	if(lp == NULL)
	{
		cout<<"Failed to Map"<<endl;
		return -2;
	}
	return 0;
}

int main()
{
    while(1)
    {
        char name[128] = "";
        GetPrivateProfileString("IPC","MapFileName","",name,127,".\\set.ini");
        if(name[0]==0)
            WritePrivateProfileString("IPC","MapFileName","",".\\set.ini");
        void *pp=0;
        cout<<"open:"<<openMyFileMap(pp,128,name)<<endl;
        cout<<"MapFile of "<<name<<" is:\n";
        HANDLE hMemShare = OpenFileMapping(FILE_MAP_READ,0,name);
        if(hMemShare == NULL)
        {
            cout<<"Mapping File Open Failed"<<endl;
        }
        else
        {
            int *read;
            read = (int *)MapViewOfFile(hMemShare, FILE_MAP_READ,0,0,sizeof(int));
            if(read == NULL)
            {
                cout<<"Failed to ViewMap"<<endl;
            }
            cout<<*read<<endl;
            UnmapViewOfFile(read);
            CloseHandle(hMemShare);
        }
        cin.get();
    }
    return 0;
}
