C ] 转到定义
C O 后退
C I 前进
3l 向前三个字符
3h 向后三个字符
3$ 后面第三行的行尾
0  行首
^  非空格的行首
g0 当前行首，如果一行过长时，g0是移动到当前视觉上的行首
g^
g$
M/gm 当前窗口的中间
gM 当前行的中间
10| 第10列
3fa 移动到当前行内的后面第3个a字符处
3Fa 移动到当前行内的前面第3个a
3ta 移动到当前行内的后面第3个a字符前
3Ta 移动到当前行内的前面第3个a字符前
3; 重复fFtT 3次
'  最近打开的文件
10gg 到第10行
10% 倒数第10%行
2w 后面第二个单词首
2e 后面第二个单词尾
2E 后面第二个单词尾(空白分隔的)
2b 前面2个单词首
2B 前面2个单词首(空白分隔的)
2( 前面两个语句
2) 后面两个语句
2{ 前面两个段落
2} 后面两个段落
]m 下一个方法start
]M 下一个方法end
[* 上一个注释
]* 下一个注释
/ 向后搜索
? 向前搜索
* 向下搜当前光标的内容
# 后上搜当前光标的内容
gd 转到定义
gD 转到全局定义
ma 给当前打上a标记
mA 打上全局标记
`a 跳到当前文件a标记处
`A 
` 0-9最近打开的文件
`. 去到当前文件最后一次编辑
:ju 打印jump list
%  括号首尾跳动
C T 打开终端
C Y 向上滚动
C E 向下滚动
:r file 从其他文件读内容到光标处
:r! ls  从ls命令读内容
D 删除到行尾
:1,100d  删除1-100行

insert mode
C T 缩进
C D 减少缩进
C U 删除到行首
C W 删除前一个单词
D 删除到行尾
"reg 复制reg中的内容
3rc 用c替换当前光标后面3个字符
3R 替换3次本次输入的内容
ffff
1cc 修改1行
1S 修改1行
2s 修改2个字符
qa 记录动作为a
q 取消记录模式
2o world
C A 数字+1
C X 数字-1
~ 大小写转换
vwu 转小写
vwU 转大写
gU$ 转大写到行尾
gu$ 转小写到行尾
gq$ 格式化到行尾
:1,20ce 10 1到20行居中
:1,20le 10 1到20行居中
:1,20ri 10 1到20行居中
!!ls  把ls命令的输出放到行首
:s/old/new 在当前行进行替换操作
:%s/old/new 在所有行进行替换操作
v模式下o 切换光标位置
gv 选中上次选中的内容
vniw 选中单词不包含空格
vaw 选中单词包含空格
vas 选中句子
vis
vap 段落 
vip 
vab
vib block{{
va> a<>block
vi>
vat 选中成对的<>block
<html>
    <head>
    </head>
    <body>
    </body>
</html
vi'
vi"
vi`
const a = 'hell world'
const a = "hell world"
. 重复上次命令
q{a-zA-Z} 保存当前记录到a
q 退出录制
Q 重复上次录制的macro
@{a-zA-Z} 执行录制的macro

2@@ 重复上次执行的macro
:@ 以命令方式执行录制的macro
:@@
:g/pattern/cmd 对匹配到的内容执行命令
:g!/pattern/cmd 对未匹配到的内容执行命令
:so! file 从文件读vim命令
:so file 从文件读ex命令
:sl 3  sleep 3s
:ma cmd1 cmd2  map命令在Norlmal和Visual模式
:ma! cmd1 cmd2 map命令在Insert和命令模式
:unmap
:unmap!
:ma cmd 查看map命令
:ma! cmd
:cc  显示错误
:cn 显示下一个错误
:cp 显示上一个错误
:cl 显示所有错误
<C-G> 显示当前文件名
ga  显示光标字符的ascii码
g8  显示光标字符的UTF-8码
g <C-G> 显示当前行列字符信息
gQ 切换到Ex模式
:split
:vsplit
