#include <stdio.h>
#include <conio.h>
void main(int argc,char **argv)
{
	system("cls");
	FILE *fp; 
	int lflag = 0, wflag = 0, cflag = 0;
	int ccount = 0, lcount = 0, wcount = 0;
	int inword = 0, in_line = 0;
	char *s;
	char c;
	if(argc < 2){
		printf("please input -l or -w or -c to explain your requests.\n");
		return ;
	}
	while(argc-- > 1&&(*++argv)[0] == '-'){
		for(s=argv[0]+1;*s!='\0';s++){
			switch(*s){
			case 'l':
				lflag = 1;
				printf("l\n");
				break;
			case 'w':
				wflag = 1;
				printf("w\n");
				break;
			case 'c':
				cflag = 1;
				printf("c\n");
				break;
			default:
				printf("you must input command. \n");
				break;
			}
		}
	}

	fp = fopen(*argv,"r");
    if(fp==NULL)
    {
    	printf("error:cannt open the file");
    	return;
	}
	while((c=fgetc(fp))!=EOF)
	{
		if(cflag == 1)
			ccount++;
		if(wflag == 1){ //计算文件单词数，行数的正确方法 
			if(c == ' '||c == '\n'||c == '\t')
			{
				inword = 0;
			}else if(!inword)
			{
				wcount++;
				inword = 1;
			}
		}
		if(lflag == 1)
		{
			if(c == '\n')
				in_line = 0;
			else if(!in_line)
			{
				lcount++;
				in_line = 1;
			}
			
		}
	}
	fclose(fp);
	if(cflag)
		printf("有 %d 个字符",ccount);
	if(wflag)
		printf("有 %d 个单词",wcount);
	if(lflag)
		printf("有 %d 行",lcount);

	
	
 } 
