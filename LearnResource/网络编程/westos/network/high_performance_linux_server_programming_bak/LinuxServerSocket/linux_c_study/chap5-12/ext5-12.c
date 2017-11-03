#include <sys/types.h>

#include <unistd.h>
#include <stdio.h>

char file[20],string[8];
char* tmp="./tmp.";

int main()
{
    char* s;
    int fd;
    s = (char*)malloc(10);
    sprintf(s, "%d", getpid());

    printf("success\n");
    strcpy(file, tmp);
    strcat(file,s);

    if( (fd=creat(file,0644)) == -1)
    {
        fprintf(stderr,"file: %s create failed\n", file);
        exit(1);
    }

    write(fd, "TMP file", 9);
    close(fd);
    exit(0);

}
