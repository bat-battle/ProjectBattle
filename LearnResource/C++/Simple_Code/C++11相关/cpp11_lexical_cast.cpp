/*
 用C++11实现Boost库里的lexical_cast函数模板的功能
*/

#include <string>
#include <stdexcept>

namespace detail
{
const char* strue = "true";
const char* sfalse = "false";
template <typename To, typename From>
struct Converter
{
};
///to numeric
//to int
template <typename From>
struct Converter<int, From>
{
    static int convert(const From& from)
    {
        return std::stoi(from);
    }
};

//to long
template <typename From>
struct Converter<long, From>
{
    static long convert(const From& from)
    {
        return std::stol(from);
    }
};

//to long long
template <typename From>
struct Converter<long long, From>
{
    static long long convert(const From& from)
    {
        return std::stoll(from);
    }
};

//to double
template <typename From>
struct Converter<double, From>
{
    static double convert(const From& from)
    {
        return std::stof(from);
    }
};

//to float
template <typename From>
struct Converter<float, From>
{
    static float convert(const From& from)
    {
        return (float)std::stof(from);
    }
};

//to bool
template <typename From>
struct Converter<bool, From>
{
    static typename std::enable_if<std::is_integral<From>::value, bool>::type convert(From from)
    {
        return !!from;
    }
};
bool checkbool(const char* from, const size_t len, const char* s)
{
    for (size_t i = 0; i < len; i++)
    {
        if (from[i] != s[i])
        {
            return false;
        }
    }
    return true;
}

static bool convert(const char* from)
{
    int len = strlen(from);
    if (len == 4)
    {
        if (checkbool(from, len, strue))
            return true;
    }
    else if (len == 5 && checkbool(from, len, sfalse))
    {
        return false;
    }
    throw std::invalid_argument("argument is invalid");
}

//string through string to bool
template <>
struct Converter<bool, std::string>
{
    static bool convert(const std::string& from)
    {
        return detail::convert(from.c_str());
    }
};
//string through const char* to bool
template <>
struct Converter<bool, const char*>
{
    static bool convert(const char* from)
    {
        return detail::convert(from);
    }
};
//string through char* to bool
template <>
struct Converter<bool, char*>
{
    static bool convert(char* from)
    {
        return detail::convert(from);
    }
};

//string through const char[N] to bool
template <unsigned N>
struct Converter<bool, const char[N]>
{
    static bool convert(const char(&from)[N])
    {
        return detail::convert(from);
    }
};
//string through char[N] to bool
template <unsigned N>
struct Converter<bool, char[N]>
{
    static bool convert(const char(&from)[N])
    {
        return detail::convert(from);
    }
};

//to string
template <typename From>
struct Converter<std::string, From>
{
    static std::string convert(const From& from)
    {
        return std::to_string(from);
    }
};
}  //namespace detail

template <typename To, typename From>
typename std::enable_if<!std::is_same<To, From>::value, To>::type lexical_cast(const From& from)
{
    return detail::Converter<To, From>::convert(from);
}
template <typename To, typename From>
typename std::enable_if<std::is_same<To, From>::value, To>::type lexical_cast(const From& from)
{
    return from;
}


#include <iostream>
using namespace std;

void test()
{
    cout << lexical_cast<int>(1) <<endl;
    cout << lexical_cast<int>("1") << endl;
    cout << lexical_cast<long>("1") << endl;
    cout << lexical_cast<string>(1) << endl;
    cout << lexical_cast<bool>(1) << endl;
    cout << lexical_cast<double>("1.2") << endl;
    cout << lexical_cast<float>("1.2") << endl;
    string s = "true";
    cout << lexical_cast<bool>(s) << endl;
    char p[] = "false";
    cout << lexical_cast<bool>(p) << endl;
    const char* q = "false";
    cout << lexical_cast<bool>(q) << endl;
    cout << lexical_cast<bool>("false") << endl;
    cout << lexical_cast<bool>("test") << endl;
}

int main()
{
    try
    {
        test();
    }
    catch (const std::exception& e)
    {
        cout << e.what() << endl;
    }
    return 0;
}
