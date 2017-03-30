//表达式求值
#include<iostream>
#include<cstdlib>
using namespace std;
template<class T>
struct Node {
    T data;
    Node<T> *next;
};

template<class T>
class LinkStack {
public:
    LinkStack();
    ~LinkStack();
    bool IsEmpty();
    LinkStack<T>& Push( T x );
    LinkStack<T>& Pop( T &x );
    T GetTop();
    void Process( char* p );//计算表达式
    int Op_val( char ch );   //求运算符优先数
    int Calculate( T x,T y,char p );
private:
    Node<T> *top;
};

template<class T>
LinkStack<T>::LinkStack() { //采用头插法创建栈
    top=NULL;
}

template<class T>
LinkStack<T>::~LinkStack() { //释放栈
    Node<T> *p,*q;
    p=top;
    while( p ) {
        q=p;
        p=p->next;
        delete q;
    }
}

template<class T>
bool LinkStack<T>::IsEmpty() { //判空
    return( top==NULL );
}

template<class T>
LinkStack<T>& LinkStack<T>::Push( T x ) { //进栈
    Node<T> *p;
    p=new Node<T>;
    p->data=x;
    p->next=top;
    top=p;
    return *this;
}

template<class T>
LinkStack<T>& LinkStack<T>::Pop( T &x ) { //出栈
    if( IsEmpty() ) {
        cout<<"栈空，禁止出栈！！"<<endl;
        exit(1);
    }
    Node<T> *p;
    p=top;
    x=p->data;
    top=p->next;
    delete p;
    return *this;
}

template<class T>
T LinkStack<T>::GetTop() { //获取栈顶元素
    if( IsEmpty() ) {
        cout<<"栈空，无法获取栈顶！！"<<endl;
        exit(1);
    }
    return( top->data );
}

template<typename T>
void LinkStack<T>::Process( char* p ) { //计算表达式
    LinkStack<char> op;
    int i = 0,tag;
    T sum = 0;
    op.Push('#');  //运算符op栈先进#
    do {
        tag = 1;
        if( p[i]>='0'&&p[i]<='9' )   //p[i]为数字时进栈
            Push( (p[i]-48) );
        else if( op.Op_val(p[i]) > op.Op_val(op.GetTop()) ) { //运算符优先数大则进op栈
            op.Push( p[i] );
            if( p[i]=='(' )
                tag=0;
        } else if( op.GetTop()=='('&& tag ) //op栈顶为左括号，则运算符进栈
            op.Push( p[i] );
        else {
            //运算符p[i]优先数小于op栈顶运算符则进行计算
            while(op.Op_val(p[i])<=op.Op_val(op.GetTop())&&op.GetTop()!='('&&op.GetTop()!='#') {
                T x,y;
                char p;
                Pop( x );
                Pop( y );
                op.Pop( p );
                sum = Calculate(x,y,p); //调用Caculate函数进行数值计算
                cout<<"输出各次计算值:";
                cout<<sum<<endl;
                Push( sum );
            }
            if( op.GetTop()=='#'&&p[i]!='#' ) //op栈顶只剩#并且p[i]!=#时p[i]进栈
                op.Push(p[i]);
            if( p[i]==')' && op.GetTop()=='(' ) { //括号匹配时'('出栈
                char p;
                op.Pop( p );
            }
        }
        i++;
    } while( !(p[i-1]=='#'&&op.GetTop()=='#') );  //p[i]和op栈顶同时为#号时循环终止
    cout<<endl<<"输出表达式值为:";
    cout<<sum<<endl;
}

template<typename T>
int LinkStack<T>::Op_val( char ch ) { //计算运算符优先数
    switch( ch ) {
    case'(':
        return 5;
        break;
    case')':
        return 2;
        break;
    case'*':
        return 4;
        break;
    case'/':
        return 4;
        break;
    case'+':
        return 3;
        break;
    case'-':
        return 3;
        break;
    case'#':
        return 1;
        break;
    default:
        return 0;
        break;
    }
}

template<typename T>
int LinkStack<T>::Calculate( T x, T y, char p ) { //数值计算并返回
    T sum = 0;
    switch( p ) {
    case'*':
        return y*x;
        break;
    case'/':
        return y/x;
        break;
    case'+':
        return y+x;
        break;
    case'-':
        return y-x;
        break;
    default:
        return 0;
        break;
    }
}

int main() {
    char ch[20];
    cout<<"请输入表达式并以#号结束："<<endl;
    cin>>ch;
    LinkStack<int> stack1;
    stack1.Process( ch );
    return 0;
}
