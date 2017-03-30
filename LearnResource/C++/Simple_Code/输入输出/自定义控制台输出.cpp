#include<windows.h>
#include<stdio.h>
//设置前景
#define FG_R    FOREGROUND_RED
#define FG_G    FOREGROUND_GREEN
#define FG_B    FOREGROUND_BLUE
#define FG_HL   FOREGROUND_INTENSITY    //高亮显示
//设置背景
#define BG_R    BACKGROUND_RED
#define BG_G    BACKGROUND_GREEN
#define BG_B    BACKGROUND_BLUE
#define BG_HL   BACKGROUND_INTENSITY    //高亮显示

#define SetText(attr) SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),attr)

#define setBlue() SetText(FG_HL | FG_B)
#define setGreen() SetText(FG_HL | FG_G)
#define setWhite() SetText(FG_HL | FG_R | FG_G | FG_B)
#define setDefault() SetText(FG_R | FG_G | FG_B)

void test()
{
    puts("这是一个改变控制台颜色的例子！\n——————————————————\n");
    HANDLE handle = GetStdHandle(STD_OUTPUT_HANDLE);
    SetConsoleTextAttribute(handle, FG_HL | FG_R);//设置为红色
    puts("*我把将前景色设置为红色了,背景还是黑色*\n——————————————————\n");
    SetConsoleTextAttribute(handle, FG_HL | FG_R | BG_B);
    puts("*我把将前景色设置为红色了,背景变蓝色了*\n——————————————————\n");
    SetConsoleTextAttribute(handle, FG_HL | BG_HL | FG_G | BG_R | BG_G | BG_B);
    puts("*我把将前景色设置为绿色了,背景变白色了*\n——————————————————\n");

    SetConsoleTextAttribute(handle, FG_HL | FG_R | FG_G | FG_B);
}

int main()
{
    setBlue();
    printf("hadoop-2.4.1  ");
    setGreen();
    puts("hadoop-2.4.1.tar.gz");
    setWhite();
    puts("szu@u2:/usr/hadoop$ cd hadoop-2.4.1/\n"
         "szu@u2:/usr/hadoop/hadoop-2.4.1$ is");
    setBlue();
    printf("bin\tinclude\tlibexec\t\tlogs\netc\tlib\t");
    setWhite();
    printf("LICENSE.txt\tNOTICE.txt\t");
    setBlue();
    puts("sbin\ttmp");

    setWhite();
    puts("szu@u2:/usr/hadoop/hadoop-2.4.1$ cd sbin/");
    setGreen();
    puts("distribute-exclude.sh\tstart-all.cmd\n"
         "hadoop-daemon.sh\tstart-all.sh\n"
         "hadoop-daemons.sh\tstart-balancer.sh\n"
        );
    setWhite();
    puts("szu@u2:/usr/hadoop/hadoop-2.4.1/sbins$ ./start-dfs.sh\n"
         "starting namenodes in[u1]");
    getchar();
    setDefault();
    test();
    return 0;
}
