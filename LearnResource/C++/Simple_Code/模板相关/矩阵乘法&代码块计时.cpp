#include <iostream>
#include <ctime>
using namespace std;

//m*n 和 n*p 的矩阵相乘得到 m*p 的矩阵
template<int m, int n, int p>
void matMultiply(int (&a)[m][n], int (&b)[n][p], int (&c)[m][p])
{
    for (int i = 0; i < m; ++i)
        for (int j = 0; j < p; ++j) {
            c[i][j] = 0;
            for (int k = 0; k < n; ++k)
                c[i][j] += a[i][k] * b[k][j];
        }
}
//利用局部性原理优化后的实现代码
template<int m, int n, int p>
void matMultiply2(int (&a)[m][n], int (&b)[n][p], int (&c)[m][p])
{
    std::fill(&c[0][0], &c[m - 1][p], 0); //全部填充为0
    for (int i = 0; i < m; ++i)
        for (int k = 0; k < n; ++k)
            for (int j = 0; j < p; ++j)
                c[i][j] += a[i][k] * b[k][j];
}

//对语句块进行计时统计
#define tip() _tip(__LINE__)
inline void _tip(int line)
{
    static clock_t t1 = clock();
    static int lastLine = 0;
    cout << "--L:" << lastLine << "->" << line << '\t' << clock() - t1 << "ms" << endl;
    lastLine = line;
    t1 = clock();
}

//对函数进行计时统计
#define tipFunc(func) \
{ \
    cout << "--L:" << __LINE__; \
    clock_t t1 = clock(); \
    func; \
    cout << '\t' << clock() - t1 << "ms\t" << #func << endl; \
}

//数组较大,需要设置为全局的
const int m = 500, n = 700, p = 900;
int a[m][n] = {
    {1, 0, 0, 2},
    {0, 2, 0, 3},
    {0, 1, 4, 0}
};
int b[n][p] = {
    {1, 2, 3},
    {2, 3, 4},
    {3, 4, 5},
    {4, 5, 6}
};
int c[m][p] = {0};

int main()
{
    tipFunc(matMultiply(a, b, c));
    tipFunc(matMultiply2(a, b, c));
//  for (auto& it : c) {
//      for (auto& elem : it)
//          cout << elem << ' ';
//      cout << endl;
//  }
    tip();
    matMultiply2(a, b, c);
    tip();
    return 0;
}
