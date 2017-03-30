#include <set>
#include <iostream>
#include <iterator>
using namespace std;

int main()
{
    set<int> positive_num;
    ///插入
    positive_num.insert(3);
    positive_num.insert(1);
    positive_num.insert(2);
    positive_num.insert(5);
    positive_num.insert(4);
    positive_num.insert(1);//1已经存在所以set中不会再次插入

    set<int> odd_num;
    odd_num.insert(5);
    odd_num.insert(1);
    odd_num.insert(3);
    odd_num.insert(9);
    odd_num.insert(7);
    odd_num.insert(3);//3已经存在所以set中不会再次插入

    ///遍历set，可以发现元素是有序的
    //set<int>::iterator set_iter1=eg1.begin(); //在支持C++11的环境下可以用下面的语句代替
    auto set_iter1 = positive_num.begin();

    for (; set_iter1 != positive_num.end(); ++set_iter1)
        cout << *set_iter1 << " ";
    cout << endl;
    //当然，还可以完全使用C++11来遍历
    for(auto &elem : positive_num)
        cout << elem << " ";
    cout << endl;
    //另外一种比较精巧的遍历输出方式，需要头文件<iterator>
    copy(positive_num.begin(), positive_num.end(), ostream_iterator<int>(cout, " "));
    cout << endl;

    ///使用size()函数可以获得当前元素个数
    cout << "there are " << positive_num.size() << " elements in the positive_num set" << endl;

    ///使用find()查找某个元素，返回访问该元素的迭代器；如果不存在则返回尾部迭代器end()
    int num;
    cout << "请输入一个你要查找的正整数：";
    cin >> num;
    auto set_iter2 = positive_num.find(num);
    if(set_iter2 != positive_num.end())
        cout<< *set_iter2 << "在这个集合中" <<endl;

    ///获得两个set的并
    //方式1，借助于插入
    set<int> merged_num1;
    merged_num1.insert(positive_num.begin(), positive_num.end());
    merged_num1.insert(odd_num.begin(), odd_num.end());
    //方式2，用算法库(http://classfoo.com/ccby/article/tZTzs)提供的函数（已保存到pdf）
    set<int> merged_num2;
    set_union(positive_num.begin(), positive_num.end(), odd_num.begin(), odd_num.end(),
              inserter(merged_num2, merged_num2.begin()));

    //输出合并后的集合内容
    cout << "两个集合的并集元素有：";
    copy(merged_num2.begin(), merged_num2.end(), ostream_iterator<int>(cout, " "));
    cout << endl;

    //获得两个set的交
    set<int> jiao_num;
    set_intersection(positive_num.begin(), positive_num.end(), odd_num.begin(), odd_num.end(),
                     inserter(jiao_num, jiao_num.begin()));
    cout << "交集：";
    copy(jiao_num.begin(), jiao_num.end(), ostream_iterator<int>(cout, " "));
    cout << endl;

    //获得两个set的差
    set<int> cha_num;
    set_difference(positive_num.begin(), positive_num.end(), odd_num.begin(), odd_num.end(),
                   inserter(cha_num, cha_num.begin()));
    cout << "差集：";
    copy(cha_num.begin(), cha_num.end(), ostream_iterator<int>(cout, " "));
    cout << endl;

    //获得两个set的对称差，也就是假设两个集合分别为A和B那么对称差为AUB-A∩B，也就是不都存在的元素，即只有一个集合存在的元素
    set<int> dc_cha_num;
    set_symmetric_difference(positive_num.begin(), positive_num.end(), odd_num.begin(), odd_num.end(),
                             inserter(dc_cha_num, dc_cha_num.begin()));
    cout << "对称差集：";
    copy(dc_cha_num.begin(), dc_cha_num.end(), ostream_iterator<int>(cout, " "));
    cout << endl;
    
    //删除集合中等于给定值的元素
    merged_num1.erase(5);

    return 0;
}
