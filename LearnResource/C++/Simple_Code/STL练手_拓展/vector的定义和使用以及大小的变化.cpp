#include <iostream>
#include <vector>
using namespace std;

//对二维数组进行操作 - 将每个元素加1
void add1(vector<vector<int> >& vec)
{
    for(int i = 0; i < vec.size(); ++i)
        for(int j = 0; j < vec[i].size(); ++j) {
            vec[i][j] += 1;
        }
}
//显示二维数组中每个元素值
void show(const vector<vector<int> >& vec)
{
    for(auto& it : vec) {
        for(auto& elem : it) {
            cout << elem << " ";
        }
        cout << endl;
    }
    cout << endl;
}
//显示三维数组
void show(const vector<vector<vector<int> > >&vec)
{
    for(auto& it1 : vec) {
        for(auto& it2 : it1) {
            for(auto& elem : it2) {
                cout << elem << " ";
            }
            cout << endl;
        }
        cout << endl;
    }
    cout << endl;
}
void showSize(const vector<int>& vec, const char* str = "")
{
    if(str != NULL && str[0] != '\0') {
        cout << str << endl;
    }
    cout << "size(): " << vec.size() << "\tcapcity(): " << vec.capacity() << endl;
}
void delFrom3dVector(vector<vector<vector<int> > >& vec
                     , int i, int j, int k)
{
    //方式1：使用数组访问到该组，再删除对应元素
    vec[i][j].erase(vec[i][j].begin() + k);
    //方式2：完全使用迭代器找到该位置
    vector<vector<vector<int> > >::iterator iter1 = vec.begin();
    while(i-- > 0 && iter1 != vec.end()) {
        ++iter1;
    }
    if(iter1 == vec.end()) {
        return ;
    }
    vector<vector<int> >::iterator iter2 = iter1->begin();
    while(j-- > 0 && iter2 != iter1->end()) {
        ++iter2;
    }
    if(iter2 == iter1->end()) {
        return ;
    }
    vector<int>::iterator iter3 = iter2->begin();
    while(k-- > 0 && iter3 != iter2->end()) {
        ++iter3;
    }
    iter2->erase(iter3);
}
int main()
{
    /*
    vector<vector<int> > arr(4, vector<int>(5, 0)); //创建二维数组
    for(int i = 0; i < arr.size(); ++i) //遍历二维数组
        for(int j = 0; j < arr[i].size(); ++j)
            arr[i][j] = i + j;
    show(arr);
    add1(arr);
    show(arr);
    */
    //未设定初始大小,则实际大小size()和能容纳的元素数量capacity()均为0
    vector<int> arr1;
    showSize(arr1, "vector<int> arr1:");
    //每调用一次push_back()实际大小加1,能容纳的元素数量根据实际情况选择是否增倍
    for(int i = 0; i < 10; ++i) {
        arr1.push_back(1);
        showSize(arr1);
    }
    //调用resize(value)时实际大小变为重新设定的值value,若value<=当前能容纳的
    //元素数量,则能容纳的元素数量不变;否则变为设定的值value
    arr1.resize(8)   ;
    showSize(arr1, "\narr1.resize(8):");
    cout << endl << "loop: push_back(1):" << endl;
    for(int i = 0; i < 10; ++i) {
        arr1.push_back(1);
        showSize(arr1);
    }
    //每调用一次erase()实际大小减1,能容纳的元素数量不变
    cout << endl << "loop: erase(arr1.begin()+3):" << endl;
    for(int i = 0; i < 10; ++i) {
        arr1.erase(arr1.begin() + 3); //删除3号元素arr1[3]
        showSize(arr1);
    }
    cout << endl << "loop: erase(arr1.end()-1):" << endl;
    for(int i = 0; i < 5; ++i) {
        arr1.erase(arr1.end() - 1); //删除最后一个元素
        showSize(arr1);
    }
    //调用clear()后实际大小变为0,能容纳的元素数量不变
    arr1.clear();
    showSize(arr1, "\nclear():");
    //注意：当调用了erase()和clear()后能容纳的元素数量不变，也就是说这块内存还被
    //这个vector对象占有，不能被其他进程或者对象抢占，因此在内存管理比较严格的
    //场景中我们若希望主动放弃这块内存的使用权，可以调用如下语句：
    vector<int>(arr1).swap(arr1);
    showSize(arr1, "\nvector(arr1).swap(arr1):");
    arr1.resize(40);
    showSize(arr1, "\narr1.resize(40):");
    showSize(arr1, "\narr1.assign(10):");
    //定义时设定了大小,则实际大小和能容纳的元素数量均为初始设定值
    vector<int> arr2(3);
    showSize(arr2, "\nvector<int> arr2(3):");
    //调用reserve(value)后实际大小不变;若value<=当前能容纳的元素数量
    //则能容纳的元素数量不变;否则能容纳的元素数量变为设定的值value
    arr2.reserve(2);
    showSize(arr2, "\nreserve(2):");
    arr2.reserve(5);
    showSize(arr2, "\nreserve(5):");
    //调用insert()可以在任意有效位置插入元素,size()和capacity()变化趋势同push_back()
    arr2.insert(arr2.begin(), 2);
    showSize(arr2, "\ninsert(arr2.begin(),2):");
    //演示三维数组中元素的删除
    //创建三维数组
    vector<vector<vector<int> > > arr3(3, vector<vector<int> >(4, vector<int>(5)));
    for(int i = 0; i < arr3.size(); ++i)
        for(int j = 0; j < arr3[i].size(); ++j)
            for(int k = 0; k < arr3[i][j].size(); ++k) {
                arr3[i][j][k] = i + j + k;
            }
    show(arr3);
    delFrom3dVector(arr3, 1, 2, 3);
    show(arr3);
    return 0;
}
