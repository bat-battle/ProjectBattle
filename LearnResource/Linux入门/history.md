#history历史命令使用方法详解

1、使用HISTTIMEFORMAT在历史中显示TIMESTAMP
通常情况下，当你在命令行中键入history时，终端中将显示你刚输入的命令及其编号。如果出于审查命令的目的，和命令一起显示时间戳将会很有帮助，如下所示。
# export HISTTIMEFORMAT='%F %T ' 
# history | more 
1 2008-08-05 19:02:39 service network restart 
2 2008-08-05 19:02:39 exit 
3 2008-08-05 19:02:39 id 
4 2008-08-05 19:02:39 cat /etc/redhat-release
[注：你也可以设置alias语句来查看最近的历史命令] 
alias h1='history 10' 
alias h2='history 20' 
alias h3='history 30'
2、用Ctrl ＋ R搜索历史命令
我非常确信这应该是你最常使用的history特性，当你执行了一串相当长的命令之后，你只要用关键字搜索一下历史命令然后重新执行这条命令而不需要将整条命令再输一遍。方法是：按下Ctrl
+R然后输入关键字。
在以下示例中，我搜索“red”，则显示以前的命令中含有”red”的命令“cat/etc/redhat-release”。
［注：在命令行提示符下按下Ctrl＋R，终端将显示如下提示―reverse-i-search‖］
 (reverse-i-search)`red`: cat/etc/redhat-release 
［注：当看到你要的命令后按回车键，就可以重新执行这条命令了］ 
#cat /etc/redhat-release 
Fedora release 9 (Sulphur)
而有的时候你需要在执行一条历史命令之前编辑它.比如，你可以像下面那样搜索“httpd”，终端显示历史命令“service
httpd stop”，选择它把“stop”改为“start”然后执行它
[注: 在命令提示符下按 Ctrl+R , 将会显示提示符‖reverse-i-search‖]
 (reverse-i-search)`httpd`: service httpdstop
［注: 看到你想要的命令后按下左键或者右键,就可以在执行这条命令之前编辑它了］ 
# service httpd start
3、四种不同的方法快速执行之前的命令
有时出于某些原因你需要执行之前的命令，下面的四种方法可以用来重复最后执行的命令：
1.用向上键（up arrow ）查看上条命令，按回车执行。 
2.在命令行中输入!!并按回车。 
3.在命令行中输入!-1并按回车。 
4.按Ctrl+P显示上条命令，按回车执行。
4、执行历史命令中的特定命令
在下面的例子中，如果你想再次执行第四条命令，执行！4即可
#history | more 
1 service network restart 
2 exit 
3 id 
4 cat /etc/redhat-release 
# !4 cat /etc/redhat-release 
Fedora release 9 (Sulphur)
5、执行以特定字开头的历史命令
输入！和你要重新执行的命令的前几个字母。在下面的例子中，输入！ps，回车，执行历史命令中以“ps”开头的“psaux
| grep yp”
#!ps 
psaux | grep yp 
root 16947 0.0 0.0 36516 1264 ? Sl 13:10 0:00 ypbind 
root 17503 0.0 0.0 4124 740 pts/0 S+ 19:19 0:00 grep yp
6、用HISTSIZE控制历史命令的总数
把下面的两行添加到.bash_profile然后重新登录bash（译者注：用source
.bash_profile即可）查看有什么变化，在这个例子中，bash命令历史记录中只能储存450条命令。
#vi ~/.bash_profile 
HISTSIZE=450
HISTFLESIZE=450
7、使用HISTFILE改变历史文件名
默认情况下，命令历史被储存在.bash_history文件中，把下面的一行添加到.bash_profile文件中，重新登录shell，则.commandline_warrior文件将取代.bash_history文件用来储存历史命令。你可以使用这个命令来追踪不同终端中执行的命令，届时只需要将不同终端中所执行的命令保存在不同的历史文件中即可。
#vi ~/.bash_profile 
HISTFILE=/root/.commandline_warrior
8、使用HISTCONTROL来消除命令历史中的连续重复条目
在下面的例子中pwd被输入了三次，当你使用history的时候，你会看到这三条命令连续出现。设置HISTCONTROL为ignoredups,来消除重复命令：
#pwd 
# pwd 
# pwd 
# history | tail -4 
44 pwd 
45 pwd 
46 pwd 
47 history | tail -4 
[注: 上面pwd被执行了三次之后，历史中有三条pwd命令]
# export HISTCONTROL=ignoredups 
# pwd 
# pwd 
# pwd 
# history | tail -3 
56 export HISTCONTROL=ignoredups 
57 pwd 58 history | tail -4 
[注：即使上面pwd被执行了三次，历史中也只有一条pwd命令]
9、使用HISTCONTROL在整个历史中去除重复命令
上面的ignoredups去除连续重复的命令，要消除整个命令历史中的重复命令，把HISTCONTROL设置成erasedups
#export HISTCONTROL=erasedups 
# pwd 
# service httpd stop
#history | tail -3 
38 pwd 
39 service httpd stop 
40 history | tail -3 
# ls -ltr 
# service httpd stop 
# history | tail -6 
35 export HISTCONTROL=erasedups 
36 pwd 
37 history | tail -3 
38 ls –ltr 
39 service httpd stop 
40 history | tail -6 
[注: 之前在pwd后面的servicehttpd stop命令被除去了]
10、使用HISTCONTROL强制history忽略某条特定命令
在执行一条命令时，你可以将HISTCONTROL设置为ignorespace并在该命令前加上一个空格来指示history忽略这条命令。可以预见的是，很多初级系统管理员将为他们能从history中成功隐藏某条命令而振奋。
了解ignorespace的工作方式是很好。不过，实践中最好不要从history中去掩盖任何命令。
#export HISTCONTROL=ignorespace 
# ls –ltr 
# pwd 
# service httpd stop 
[注: 在service的前面加上一个空格，以便在命令历史中忽略它]
# history | tail -3 
67 ls –ltr 
68 pwd 
69 history | tail -3
11、使用c选项清除所有的历史命令
有时候你或许想要清除之前的历史命令。而你又想让history继续工作：
#history –c
12、替换命令历史中的内容
当你搜索历史命令时，你可能希望执行一个与刚刚查找到的历史命令具有相同的参数的命令。
在本例中，vi之后的"!!:$" 可以将前一个命令的参数做为当前命令的参数。
#ls anaconda-ks.cfg 
anaconda-ks.cfg 
# vi !!:$ 
vi anaconda-ks.cfg
在下面的例子中，紧跟在vi后的参数“!^”把上一个命令的第一个参数传递给当前命令。
#cp anaconda-ks.cfg anaconda-ks.cfg.bak 
anaconda-ks.cfg 
# vi !^ 
vi anaconda-ks.cfg
13、替换特定命令的特定参数
在下例中，!cp:2
在命令历史中查找以cp开头的命令，并将其第二个参数做为当前命令(ls -l)的参数。
#cp ~/longname.txt /really/a/very/long/path/long-filename.txt 
# ls -l !cp:2 
ls -l /really/a/very/long/path/long-filename.txt
在下面的例子中“!cp:$”寻找先前以cp为开头的命令，并把该条指令的最后一个参数（在这个例子中依旧是第二个参数）替换到“ls
–l”中。
#ls -l !cp:$ 
ls -l /really/a/very/long/path/long-filename.txt
14、用HISTSIZE禁用history
如果你想禁用history，又不让bashshell记录你的命令，像下面那样把HISTSIZE设为0即可。
#export HISTSIZE=0 
# history 
# [注: 执行history后没有显示任何信息]
15、用HISTIGNORE让history在存储时忽略某些指令
有时你不想在记录里看到诸如“pwd”,“ls”之类的基本指令，可以用HISTIGNORE忽略这些指令。
注意在HISTIGNORE中添加“ls”，只忽略“ls”不忽略“ls
–l”。一定要准确的写出要忽略的的指令。
#export HISTIGNORE=“pwd:ls:ls –ltr: ”
#pwd 
# ls 
# ls –ltr 
# service httpd stop 
# history | tail -3 
79 export HISTIGNORE=“pwd:ls:ls -ltr: ” 
80 service httpd stop 
81 history 
[注: history命令不显示pwd和ls]
