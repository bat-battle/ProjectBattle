#include <iostream>
#include <cstring>
using namespace std;

class CMyString {
public:
    CMyString(const char* pData = NULL);
    ~CMyString();
    //deep copy
    CMyString(const CMyString& str);
    CMyString& operator=(const CMyString& str);

    //get a sub string from the original string
    CMyString substr(int start, int n)const;
    //return the length of the string, do not contain the '\0'
    inline size_t length() const;
    //add another object to current object
    inline CMyString& operator+=(const CMyString& obj);
    //support two object add or a char* string add with an object
    friend CMyString operator+(const CMyString& obj1, const CMyString& obj2);
    //judge two object is equal? or a char* string with an object
    inline friend bool operator==(const CMyString& obj1, const CMyString& obj2);
    //define a friend function to support operator<< for output directly
    inline friend ostream& operator<<(ostream &out, const CMyString& obj);
    //define a friend function to support operator>> for input directly
    inline friend istream& operator>>(istream &in, CMyString& obj);
private:
    char* m_pData;
};

CMyString::CMyString(const char* pData)
{
    if (pData == NULL) { //check for special input value
        m_pData = new char[1];
        m_pData[0] = '\0';
    } else {
        m_pData = new char[strlen(pData) + 1];
        strcpy(m_pData, pData);
    }
}

CMyString::~CMyString()
{
    delete[] m_pData;
}

CMyString::CMyString(const CMyString& str)
{
    m_pData = new char[strlen(str.m_pData) + 1];
    strcpy(m_pData, str.m_pData);
}

CMyString& CMyString::operator=(const CMyString& other)
{
    if(this == &other)
        return *this;
    delete[] m_pData;
    m_pData = NULL;
    m_pData = new char[strlen(other.m_pData) + 1];
    strcpy(m_pData, other.m_pData);
    return *this;
}

CMyString CMyString::substr(int start, int n) const
{
    int len = length();
    if(start < 0) //support negative subscript(-length,-1] and positive[0,length-1)
        start += len;
    if(start < 0 || start >= len) //subscipt out of range, return a empty string
        return "";
    if(n < 0 || start + n > len) //length out of range, force into start to end
        n = len - start;
    CMyString res;
    delete[] res.m_pData; //release original memory
    res.m_pData = NULL;
    res.m_pData = new char[n + 1](); //allocate memory and initialize to 0
    strncpy(res.m_pData, &m_pData[start], n);
    return res;
}

size_t CMyString::length() const
{
    return strlen(m_pData);
}

CMyString& CMyString::operator+=(const CMyString& obj)
{
    *this = *this + obj;
    return *this;
}

CMyString operator+(const CMyString& obj1, const CMyString& obj2)
{
    CMyString res;
    delete[] res.m_pData;
    res.m_pData = NULL;
    int len1 = obj1.length(), len2 = obj2.length();
    res.m_pData = new char[len1 + len2 + 1];
    strncpy(res.m_pData, obj1.m_pData, len1);
    strncpy(res.m_pData + len1, obj2.m_pData, len2 + 1);
    return res;
}

bool operator==(const CMyString& obj1, const CMyString& obj2)
{
    return 0 == strcmp(obj1.m_pData, obj2.m_pData);
}

ostream& operator<<(ostream &out, const CMyString& obj)
{
    out << obj.m_pData;
    return out;
}

istream& operator>>(istream &in, CMyString& obj)
{
    in >> obj.m_pData;
    return in;
}
///usage demo
int main()
{
    CMyString str1("hello"), str2(str1), str3, str4;
    cout << "str2: " << str2 << endl;
    str3 = str1 = "hello";
    str4.operator = ("lym");
    cin >> str3;
    cout << "str3: " << str3 << endl;
    cout << "str3+str4: " << str3 + str4 << endl;
    cout << "hello:" + str4 << endl << str3 + "webary" << endl;
    cout << boolalpha << ("hello" == str3) << endl;
    CMyString str5("0123456789");
    cout << str5.substr(2, 11) << "," << str5.substr(2, 6) << ","
         << str5.substr(12, 6) << "," << str5.substr(2, -6) << ","
         << str5.substr(-7, 5) << "," << str5.substr(-13, 5) << "," << endl;

    cout<<(str1+=str3)<<endl;
    cout<<str1<<endl;
    return 0;
}
