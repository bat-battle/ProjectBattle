#include<iostream>
using namespace std;
float erjie(float a,float b,float c,float d){
	float t;
	t=a*d-c*b;
	return(t);
}
float sanjie(float a1,float a2,float a3,float a4,float a5,float a6,float a7,float a8,float a9){
	float t;
	t=a1*erjie(a5,a6,a8,a9)-a2*erjie(a4,a6,a7,a9)+a3*erjie(a4,a5,a7,a8);
	return(t);
}
float sijie(float a,float b,float c,float d,float e,float f,float g,float h,
			float i,float j,float k,float l,float m,float n,float o,float p){
	float t;
	t=a*sanjie(f,g,h,j,k,l,n,o,p)-b*sanjie(e,g,h,i,k,l,m,o,p)+
	  c*sanjie(e,f,h,i,j,l,m,n,p)-d*sanjie(e,f,g,i,j,k,m,n,o);
	return(t);
}
float wujie(float a1,float a2,float a3,float a4,float a5,float a6,float a7,
			float a8,float a9,float a10,float a11,float a12,float a13,float a14,
			float a15,float a16,float a17,float a18,float a19,float a20,float a21,
			float a22,float a23,float a24,float a25){
	float t=a1*a7*a13*a19*a25+a2*a8*a14*a20*a21+a3*a9*a15*a16*a22+a4*a10*a11*a17*a23
			+a5*a6*a12*a18*a24-a21*a17*a13*a9*a5-a22*a18*a14*a10*a1
			-a23*a19*a15*a6*a2-a24*a20*a11*a7*a3-a25*a16*a12*a8*a4;
	return(t);
}
void main(){	
	int i,n,m;
loop:
	printf("请输入您将要计算几阶行列式：");
	scanf("%d",&n);
		m=n*n;
		float p[100];
	printf("您计算的是%d阶行列式，请输入%d个数据\n",n,n*n);
	for(i=0;i<m;i++)
		scanf("%f",p+i);
	printf("您要计算的行列式是%d * %d的行列式\n",n,n);
	for(i=1;i<m+1;i++){
		if(i%n!=0)                                //显示刚才输入的行列式
			printf("%-7g",*(p+i-1));
		else
			printf("%-7g\n",*(p+i-1)); 
	}
	printf("该行列式的值是:");
	switch(n){
		case 1: printf("%-7g",*p);break;
		case 2: printf("%-7g",erjie(*p,*(p+1),*(p+2),*(p+3)));break;
		case 3: printf("%-7g",sanjie(*p,*(p+1),*(p+2),*(p+3),*(p+4),*(p+5),*(p+6),*(p+7),*(p+8)));break;
		case 4: printf("%-7g",sijie(*p,*(p+1),*(p+2),*(p+3),*(p+4),*(p+5),*(p+6),*(p+7),
				*(p+8),*(p+9),*(p+10),*(p+11),*(p+12),*(p+13),*(p+14),*(p+15)));break;
		case 5: printf("%-7g",wujie(*p,*(p+1),*(p+2),*(p+3),*(p+4),*(p+5),*(p+6),*(p+7),
				*(p+8),*(p+9),*(p+10),*(p+11),*(p+12),*(p+13),*(p+14),*(p+15),*(p+16),
				*(p+17),*(p+18),*(p+19),*(p+20),*(p+21),*(p+22),*(p+23),*(p+24)));break;
		default : printf("sorry，目前最大只能算5阶行列式\n");
	}
	puts("\n");
	goto loop;
	system("pause");
}

