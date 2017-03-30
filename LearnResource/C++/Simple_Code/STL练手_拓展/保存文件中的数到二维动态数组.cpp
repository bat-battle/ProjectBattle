/**
 * 将一个有多行，每行有多个数的文本中的数存储到一个二维vector中
 * 例如文件内容如下:
   23 33 34
   2 6 3 2 9
   1 3 5
   存储到vector中得到:
   [ [23,33,34],[2,6,3,2,9],[1,3,5] ]
 */
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
using namespace std;

int main()
{
    vector<vector<int> >res;
    int num;
    string line;
    stringstream oss;
    ifstream fin("in.txt");
    while (getline(fin, line)) {
        res.push_back(vector<int>());
        oss << line;
        while (oss >> num)
            res[res.size() - 1].push_back(num);
        oss.clear();
    }
    fin.close();
    for (auto &it : res) {
        for (auto &elem : it)
            cout << elem << " ";
        cout << endl;
    }
    return 0;
}
