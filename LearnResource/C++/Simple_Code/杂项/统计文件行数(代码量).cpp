#include <iostream>
#include <fstream>
#include <iomanip>
#include <string>
#include <vector>
#include <algorithm>
#include <unordered_map>
#include <ctime>     //clock()
#include <windows.h> //system(),DeleteFile()
using namespace std;

bool isCodeFileFormat(const string &fmt)
{
    return fmt == ".cpp" || fmt == ".cxx" || fmt == ".cc" || fmt == ".c" ||
        fmt == ".h" || fmt == ".hpp" || fmt == ".hxx";
}

typedef pair<string, int> pair_str_int;

vector<string> getDirFileList(const string &dir)
{
    cout << "reading file list from dir...";
    string cmd = "dir /S /B /O:N /A:-D \"" + dir + "\" >filelist";
    system(cmd.c_str()); //list all files of the folder to 'filelist'
    vector<string> res;
    string fileName;

    ifstream fin("filelist");
    while (getline(fin, fileName))   //get one line (a file name with path)
    {
        string::size_type pos = fileName.rfind('.'); //find the last char '.'
        if (pos != string::npos)
        {
            string fmt = fileName.substr(pos); //get the format of the file
            if (isCodeFileFormat(fmt))
                res.push_back(fileName);
        }
    }
    fin.close();
    DeleteFile("filelist");
    cout << "\r\t\t\t\t\t\t\r";
    return res;
}

bool getFileLine(string fName, pair<int, int> &lines, bool checkFmt = true)
{
    string::size_type pos = fName.rfind('.'); //find the last char '.'
    if (pos == string::npos) //ignore files with no file format
        return false;
    if (checkFmt)
    {
        string fmt = fName.substr(pos); //get file format
        if (!isCodeFileFormat(fmt))
            return false;
    }

    ifstream fin(fName.c_str()); //open the file to read the content
    int cnt = 0, cnt_space = 0;  //file lines, space lines
    string str;
    while (getline(fin, str))    //read a line every time, stastic the lines
    {
        if (str.find_first_not_of(" \t") == str.npos) //check if is a space line
            ++cnt_space;
        ++cnt;
    }
    fin.close();

    cout << cnt << "\t" << cnt_space << "\t" << cnt - cnt_space << "\t"
         << fName << endl;
    clog << cnt << "\t" << cnt_space << "\t" << cnt - cnt_space << "\t"
         << fName << endl;
    lines = make_pair(cnt, cnt_space);
    return true;
}

int main(int argc, char *argv[])
{
    vector<string> args;
    if (argc < 2)   //have no command parameters with file names or paths
    {
        cout << "Please input/drag the file or dir that you want view, "
             "one path per line ([ctrl + z] to stop):" << endl;
        string files_or_dirs;
        while (cin >> files_or_dirs)
            args.push_back(files_or_dirs);
        cin.clear();
        cin.sync();
    }
    else
    {
        args.reserve(argc - 1);
        for (int i = 1; i < argc; ++i)
            args.push_back(argv[i]);
    }

    ofstream logFile("code_lines.log");
    streambuf *sb_log = clog.rdbuf(logFile.rdbuf()); //redirect log output to file

    cout << "lines" << "\tspace" << "\tleft" << "\tfile-name" << endl;
    clog << "lines" << "\tspace" << "\tleft" << "\tfile-name" << endl;
    int sum = 0;       //total lines
    int sum_space = 0; //total space lines
    int fileNums = 0;  //the number of file
    unordered_map<string, int> folderLines;

    for (auto &fName : args)
    {
        pair<int, int> lines;
        vector<string> fileList;
        string::size_type pos = fName.rfind('.'); //find the last char '.'

        if (pos != string::npos)   //if there is a '.' in the path name
        {
            DWORD dwAttr = GetFileAttributes(fName.c_str());
            if(INVALID_FILE_ATTRIBUTES == dwAttr)  //failed to get its attr
                continue;
            else if (dwAttr & FILE_ATTRIBUTE_DIRECTORY)  //is a directory
                fileList = getDirFileList(fName);
            else  //is a file, so check its format
            {
                string fmt = fName.substr(pos); //get file format
                if (isCodeFileFormat(fmt))
                    fileList.push_back(fName);
                else
                    continue;
            }
        }
        else
            fileList = getDirFileList(fName);

        for (auto &elem : fileList)   //deal with each file from the file list
        {
            if (getFileLine(elem, lines, false))
            {
                ++fileNums;
                sum += lines.first;
                sum_space += lines.second;
                folderLines[elem.substr(0, elem.rfind('\\'))] += lines.first;
            }
        }
    }

    cout << sum << "\t" << sum_space << "\t" << sum - sum_space << "\t"
         << fileNums << " files total" << endl;
    clog << sum << "\t" << sum_space << "\t" << sum - sum_space << "\t"
         << fileNums << " files total" << endl;

    cout << "\n ++ statistic each folder:" << endl;
    clog << "\n ++ statistic each folder:" << endl;
    vector<pair_str_int> vec;
    vec.reserve(folderLines.size());
    for (auto &folder : folderLines)
        vec.push_back(folder);

    //sort by path name asc, set sort rule by lamda expression
    sort(vec.begin(), vec.end(), [](pair_str_int & x, pair_str_int & y)
    {
        return x.first < y.first;
    });

    cout << "sort by path name asc:" << endl;
    clog << "sort by path name asc:" << endl;
    for (auto &folder : vec)   //output code lines of each folder
    {
        cout << setw(6) << folder.second << ": [" << folder.first << "]" << endl;
        clog << setw(6) << folder.second << ": [" << folder.first << "]" << endl;
    }

    //sort by code lines desc, set sort rule by lamda expression
    sort(vec.begin(), vec.end(),  [](pair_str_int & x, pair_str_int & y)
    {
        return x.second > y.second;
    });

    cout << "\nsort by code lines desc:" << endl;
    clog << "\nsort by code lines desc:" << endl;
    for (auto &folder : vec)   //output code lines of each folder
    {
        cout << setw(6) << folder.second << ": [" << folder.first << "]" << endl;
        clog << setw(6) << folder.second << ": [" << folder.first << "]" << endl;
    }

    cout << "\ntime cost: " << clock() / 1000.0 << " s" << endl;

    clog.rdbuf(sb_log); //restore log output
    cin.get();
    return 0;
}
