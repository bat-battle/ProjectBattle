#include <stdio.h>

void main()
{
	int i,Max,m,a,b;
	Max = 3000;
	for(a = 1;a<Max;a++)
	{
		for(i = 1,b = 0;i <= a/2;i++)
			if(!(a%i))
				b+=i;
		for(i = 1,m = 0;i <= b/2;i++)
			if(!(b%i))
				m+=i;
		if(a==m&&a < b)//之所以是a<b而非a!=b是为了防止出现重复 
			printf("%d,%d是亲密数---\n",a,b);
	}


	
} 
