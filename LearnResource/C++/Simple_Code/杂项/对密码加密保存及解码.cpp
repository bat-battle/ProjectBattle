#include <stdio.h>
#include <string.h>
#include <ctype.h>
void fun(const char* pw, char* pw_new, int flag = -1)
{
    const int pwTable[16] = {2, 1, 3, 4, 1, 4, 2, 0, 3, 2, 3, 4, 2, 0, 1};
    int i, len = strlen(pw);
    for (i = 0; i < len; i++) {
        if (i == pwTable[i % 16])
            pw_new[i] = pw[i] ^ 32;
        else
            pw_new[i] = pw[i] + (i % 2 * 2 - 1) * flag * pwTable[i % 16];
    }
}
int main()
{
    char pw[64], pw_new[64];
    while (gets(pw)) {
        memset(pw_new, 0, sizeof(pw_new));
        fun(pw, pw_new);
        puts(pw_new);
        fun(pw_new, pw_new, 1);
        puts(pw_new);
        if (!strcmp(pw, pw_new))
            printf("解码完全正确\n");
        else
            printf("解码有误\n");
    }
    return 0;
}
