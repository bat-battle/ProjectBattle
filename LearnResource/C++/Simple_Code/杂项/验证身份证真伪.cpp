#include<stdio.h>
int main()
{
	char id[100],t[]={'1','0','X','9','8','7','6','5','4','3','2'};
	int i,add,sec[]={7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2};
	while(scanf("%s",id)!=EOF){
		for(i=0,add=0;id[i]!=0 && i<17;i++)
			add += (id[i]-48)*sec[i];
		add %= 11;
		if(id[17]==t[add] && id[18]==0)
			puts("True");
		else if(id[17]!=0)
			puts("False");
		else{
			id[17] = t[add];
			id[18] = 0;
			printf("%s\n",id);
		}
	}
	return 0;
}

