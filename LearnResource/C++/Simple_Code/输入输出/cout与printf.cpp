#include<iostream>
#include<cstdio>
#include<cstdlib>
#include<ctime>
using namespace std;
const int Max = 1000;

int main(){
	int s,e,i;
	double t[3];
	char c=1;

	s=clock();
	for(i=0;i<Max;i++)
		printf("%c\n",c);
	e=clock();
	t[1]=(e-s)/1000.0;
	system("cls");

	s=clock();
	for(i=0;i<Max;i++)
		cout<<c<<endl;
	e=clock();
	t[2]=(e-s)/1000.0;

	cout<<"putchar: "<<t[0]<<"\nprintf: "<<t[1]<<"\ncout: "<<t[2];
	system("pause");
	return 0;
}
