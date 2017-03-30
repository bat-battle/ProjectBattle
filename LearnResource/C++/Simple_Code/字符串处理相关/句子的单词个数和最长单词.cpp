#include <iostream>
#include <string>
#include <cctype>  //isalpha
using namespace std;

int numOfWord(const string &str)
{
    unsigned len = str.length(), num = 0;
    for (int i = 0; i < len; i++) {
        if (isalpha(str[i]))
            ++num;
        else
            return num;
    }
    return num;
}
int longestWord(const string &str, int &maxLength)
{
    bool firstLetter = false; //是否是首字母
    maxLength = 0;
    int len = str.length(), max_i = 0, tempLength, temp_i;
    for (int i = 0; i <= len; i++) { //注意是i<=len,若写作i<len会略过最后一个单词
        if (isalpha(str[i])) {
            if (!firstLetter) {
                firstLetter = true;
                tempLength = 1;
                temp_i = i;
            } else
                ++tempLength;
        } else if (firstLetter) {
            firstLetter = false;
            if (tempLength > maxLength) {
                maxLength = tempLength;
                max_i = temp_i;
            }
        }
    }
    return max_i;
}
int main()
{
    cout << "please input a string :";
    string s;
    getline(cin, s);
    int wordNums = numOfWord(s), maxLength;
    cout << "\nstring \"" << s << "\" has " << wordNums << " words" << endl;

    int max_i = longestWord(s, maxLength);

    cout << "The longest word has " << maxLength << " charactor, which is: ";
    for (int i = 0; i < maxLength; i++)
        cout << s[i + max_i];
    cout << endl;
    return 0;
}
