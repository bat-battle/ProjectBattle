#include<stdio.h>

void writeStr(const char* str, const char* file)
{
    FILE* fp1 = fopen(file, "w");
    if (fp1) {
        while (*str) {
            fprintf(fp1, "%02x", *str + 128);
            str++;
        }
        fclose(fp1);
    }
}

void readStr(char* str, const char* file, bool print = 0)
{
    FILE* fp1 = fopen(file, "r");
    if (fp1) {
        int a;
        char *p_str = str;
        while (fscanf(fp1, "%2x", &a) == 1) {
            *str = a - 128;
            str++;
        }
        *str = 0;
        fclose(fp1);
        if (print)
            puts(p_str);
    }
}

int main()
{
    const char *p1 = "12345";
    const char *p2 = "this is a simple string test!";
    char str[257];
    //for(int i=-128;i<128;i++)
    //  str[i+128] = i;
    //str[128] = '0';
    writeStr(p2, "out2.txt");
    readStr(str, "out2.txt", 1);
    //for(int i=0;i<257;i++)
    //  printf("%d ",(int)str[i]+128-i);
    return 0;
}
