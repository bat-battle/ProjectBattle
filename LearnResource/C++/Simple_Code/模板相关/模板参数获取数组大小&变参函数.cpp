#include<iostream>
#include<vector>
using namespace std;

class Vec {
public :
    template<typename T>
    static void addVector(vector<T> &out, const vector<T> &v1)
    {
        int i, j, s1 = out.size(), s2 = v1.size();
        for (i = 0; i < s1 && i < s2; ++i)
            out[i] += v1[i];
    }
    template<typename T, typename...Args>
    static void addVector(vector<T> &out, const vector<T> &v1, const Args...args)
    {
        addVector(out, v1);
        addVector(out, args...);
    }
    template<typename T>
    static void print(vector<T> &vec, const char* str = 0)
    {
        if (str) cout << str << endl;
        for (int i = 0; i < vec.size(); ++i)
            cout << vec[i] << " ";
        cout << endl;
    }
};

void vecTest()
{
    vector<int> a(4, 0), b(4, 1), c(4, 3);
    Vec::addVector(a, b, c, a, c);
    Vec::print(a, "a");
    Vec::print(b, "b");
}

// a template function which can get the length of array
// the parameter is a reference of T[n], the n is array's length
template <typename T, int n>
inline int getLength(const T(&a)[n])
{
    return n;
}
//±ä²Îº¯Êý
template <typename T1>
void showDatas(T1 head)
{
    cout << head << endl;
}
template <typename T1, typename ...T2>
void showDatas(T1 head, T2... tail)
{
    cout << head << ", ";
    showDatas(tail...);
}

int main()
{
    vecTest();
    int arr[100];
    cout << getLength(arr) << endl;
    showDatas(34, "simple string", 192.4, true);
    return 0;
}
