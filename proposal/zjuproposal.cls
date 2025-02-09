% !Mode:: "TeX:UTF-8"
% !TEX root = main.tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zjuproposal}[2015/08/23 zjuproposal document class.
Created: 2014.09.15 by Sky and Hamburger, Last Modified: 2014.09.12 by Hamburger]

%---------- Option ----------
% 博士、硕士可选参数，用于区别格式
\newif\if@doctor
\newif\if@cpsupervisor\@cpsupervisortrue
\newif\if@anon\@anonfalse
\DeclareOption{doctor}{\@doctortrue}
\DeclareOption{master}{\@doctorfalse}
\DeclareOption{nocpsupervisor}{\@cpsupervisorfalse}
\DeclareOption{anon}{\@anontrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[cs4size,fancyhdr,fntef,openright,cap]{ctexbook}

%---------- 加载宏包 ----------
% 数学公式
\RequirePackage{amsmath,amssymb}
% 公式中的粗体
\RequirePackage{bm}
% 公式中的括号，例如subnumcases环境
\RequirePackage{cases}
%  pifont 宏包提供带圈的数字符号，这里用作脚注的标号，根据GB/T 7713.1-2006要求。
\RequirePackage{pifont}
% 插图包
\RequirePackage{graphicx}
% 设置图片，表格头字体选项
\RequirePackage{caption}
% 并排图形。subfigure、subfig 已经不再推荐，并与新的 subcaption不兼容！！！
\RequirePackage{subcaption}
% 中英文caption
\RequirePackage{bicaption}		% 请更新到最新版本，旧版本不在longtable环境产生作用
% 三线表
\RequirePackage{booktabs}
% 长表格宏包，tabu宏包longtabu环境需要。
\RequirePackage{longtable}
% 制表宏包，推荐使用，不使用其他制表宏包。
\RequirePackage{tabu}
% 下划线
\RequirePackage{ulem}
% 表格处理必备宏包
\RequirePackage{array}
% hyperref 宏包可根据交叉引用生成超链接，同时生成 PDF 文档的书签。
\RequirePackage{hyperref}

\renewcommand\figureautorefname{图}
\renewcommand\tableautorefname{表}
\renewcommand\equationautorefname{公式}

\AtEndOfClass{
	\hypersetup{
		unicode,
		% hyperfootnotes=false,
	    pdfstartview=FitH,
	    CJKbookmarks=true,
	    bookmarksnumbered=true,
	    bookmarksopen=true,
	    colorlinks=true,		% 链接颜色默认关闭，hidelink打开。
	    citecolor=blue,
	    linkcolor=blue,
	    anchorcolor=blue,
	    urlcolor=blue,
		hidelinks,			% 隐藏超链接的颜色和边框。
		draft,				% 草稿模式，提高编译速度，需要时注释掉就可以了。
	}
}
\AtBeginDocument{
	\hypersetup{%
		pdftitle={\ZJU@title},%
		pdfauthor={\ZJU@author},%
		pdfkeywords={},%
		pdfcreator={LaTeX with hyperref package, using ZJU LaTeX Thesis Template
		 for Master and Doctor}
	}
}
\urlstyle{same}
% 参考文献正文上标样式设置
\RequirePackage[sort&compress,numbers]{natbib}
% 解决在caption中用\cite，导致文献引用顺序混乱的问题
% 参考自BibTEX Tips and FAQ（btxFAQ.pdf）Question 18
\usepackage{notoccite}
% hypernat 可以让hyperref 和natbib 混合使用，但它需要放在这两者之后。
\RequirePackage{hypernat}
% 修复图表超链接不准的问题
\RequirePackage[all]{hypcap}
% footmisc 宏包提供了对脚注样式的控制功能。
% stable参数主要使脚注\footnote可以用在章节命令中；
% perpage
\RequirePackage[stable,perpage,symbol*]{footmisc}

%---------- 全局命令定义 ----------
% 修改原来CTEX@spaceChar为ZJU@spcaeChar，ctex2.0宏包已经没有CTEX@spaceChar命令。
\@namedef{ZJU@spaceChar}{\hspace{1em}}
% 用以产生2个字符空格。
\newcommand\ZJUspace{\protect\ZJU@spaceChar\protect\ZJU@spaceChar}

% 封面
\renewcommand*\title[1]{\gdef\ZJU@title{#1}}					% 论文中文标题
\newcommand*\englishtitle[1]{\long\gdef\ZJU@englishtitle{#1}}	% 论文英文标题
\renewcommand*\author[1]{\gdef\ZJU@author{#1}}					% 作者姓名
%\newcommand*\classification[1]{\gdef\ZJU@classification{#1}}	% 分类号
%\newcommand*\serialnumber[1]{\gdef\ZJU@serialnumber{#1}}		% 单位代码
%\newcommand*\secretlevel[1]{\gdef\ZJU@secretlevel{#1}}			% 密级
%\newcommand*\studentnumber[1]{\gdef\ZJU@studentnumber{#1}}		% 学号
\newcommand*\supervisor[1]{\gdef\ZJU@supervisor{#1}}			% 指导教师
\newcommand*\cpsupervisor[1]{\gdef\ZJU@cpsupervisor{#1}}		% 合作导师
\newcommand*\major[1]{\gdef\ZJU@major{#1}}						% 专业名称
\newcommand*\research[1]{\gdef\ZJU@research{#1}}				% 研究方向
\newcommand*\institute[1]{\gdef\ZJU@institute{#1}}				% 所在学院
\newcommand*\submitdate[1]{\gdef\ZJU@submitdate{#1}}			% 提交日期

% 正文部分文字的行距设置
\renewcommand\baselinestretch{1.56}

%---------- 页面设置 ----------
% \RequirePackage[
% 	% left=2.4cm,
% 	% right=2.2cm,
% 	% top=2.8cm,
% 	% bottom=2.2cm,
% 	xetex,
% 	showframe,
% ]{geometry}
% 纸张大小a4paper
\setlength\paperheight{297mm}
\setlength\paperwidth {210mm}	%  \paperwidth = h + \oddsidemargin+\textwidth+\evensidemargin + h
% 页面布局
\setlength\headheight{12\p@}	% 页眉高度
\setlength\headsep{12\p@}		% 页眉与正文间距
\setlength\topskip{16\p@}		% 每页第一行的行间距
\setlength\footskip{30\p@}		% 页脚基线与每一页最后一行文本基线的距离
\setlength\maxdepth{.5\topskip}	% \maxdepth + \topskip = typesize × 1.5
\setlength\textwidth{16.4cm}	% book.cls文档对texthight和textwidth的
\setlength\textheight{24.7cm}	% 定义比较复杂，但是比较合理
\setlength\marginparsep{10\p@}	% 边注与正文区域的间距
%\setlength\marginparpush{7\p@}	% 两个边注之间的距离，感觉设不设置无所谓
% 单双页面边栏设置
\if@twoside
	\setlength\oddsidemargin{2.6cm}
	\addtolength\oddsidemargin {-1in}
	\setlength\evensidemargin{2cm}
	\addtolength\evensidemargin {-1in}
	\setlength\marginparwidth{45\p@}
\else
	\setlength\oddsidemargin{2.4cm}		% 根据要求，默认单面打印左边距为2.4cm。
	\addtolength\oddsidemargin {-1in}	% 发现latex2e默认在页面四周各留出1in的空白，
	\setlength\evensidemargin{2.4cm}	% 所以要减去这1in。
	\addtolength\evensidemargin {-1in}	% oneside下奇偶页侧边空白相同。
	\setlength\marginparwidth{50\p@}
\fi
% 设置topmargin的尺寸
\setlength\topmargin{\paperheight}
\addtolength\topmargin{-2in}
\addtolength\topmargin{-\headheight}
\addtolength\topmargin{-\headsep}
\addtolength\topmargin{-\textheight}
\addtolength\topmargin{-\footskip}
\addtolength\topmargin{-.5\topmargin}

% 双面打印时空白页中间显示文本
\newcommand*{\ZJU@blankpage}{%
	\par\vspace*{\fill}%
	\centerline{This page is intentionally left blank.}\par
	\vspace{\fill}}
% 重新定义cleardouble，其原始定义在
\def\cleardoublepage{%
	\clearpage
	\if@twoside
	    \ifodd
			\c@page
		\else
		% 下面这个命令，如果不需要强调这是空白页，或者学校不允许，则可将其注释掉。
			\ZJU@blankpage
			\thispagestyle{ZJU@empty}%
			\hbox{}\newpage
			\if@twocolumn
				\hbox{}\newpage
			\fi
		\fi
	\fi
}

%---------- 页眉页脚 ----------
% 采用latex2e的底层代码，不用fancyhdr宏包。
% 页眉标记
\if@doctor
	\def\ZJU@D@M@thesis{浙江大学博士学位论文开题报告}
\else
	\def\ZJU@D@M@thesis{浙江大学硕士学位论文开题报告}
\fi

% 空白页：没有页眉页脚和页码
\def\ps@ZJU@empty{%
	\let\@oddhead\@empty%
	\let\@evenhead\@empty%
	\let\@oddfoot\@empty%
	\let\@evenfoot\@empty}

% plain样式：只有页脚居中页码
\def\ps@ZJU@plain{%
	\let\@oddhead\@empty%
	\let\@evenhead\@empty%
	\if@twoside
        \def\@oddfoot{\hfil\zihao{-5}\thepage}%
        \def\@evenfoot{\zihao{-5}\thepage\hfil}%
    \else
        \def\@oddfoot{\hfil\zihao{-5}\thepage\hfil}
        \let\@evenfoot=\@oddfoot
    \fi
}

% 文章主样式：分单双面打印样式
\if@twoside
	\def\ps@ZJU@headings{%
		\def\@oddhead{\vbox to\headheight{%
			\hb@xt@\textwidth{\zihao{-5}\songti\ZJU@D@M@thesis\hfill\leftmark}%
			\vskip2pt\hbox{\vrule width\textwidth height0.4pt depth0pt}}}
		\def\@evenhead{\vbox to\headheight{%
			\hb@xt@\textwidth{\zihao{-5}\songti\leftmark\hfill\ZJU@D@M@thesis}%
			\vskip2pt\hbox{\vrule width\textwidth height0.4pt depth0pt}}}
		\def\@oddfoot{\hfil\zihao{-5}\thepage}
        \def\@evenfoot{\zihao{-5}\thepage\hfil}
		% \let\@evenfoot=\@oddfoot
		\let\@mkboth\markboth}
\else
	\def\ps@ZJU@headings{%
		\def\@oddhead{\vbox to\headheight{%
			\hb@xt@\textwidth{\zihao{-5}\songti\ZJU@D@M@thesis\hfill\leftmark}%
			\vskip2pt\hbox{\vrule width\textwidth height0.4pt depth0pt}}}
		\let\@evenhead=\@oddhead
		\def\@oddfoot{\hfil\zihao{-5}\thepage\hfil}
		\let\@evenfoot=\@oddfoot
		\let\@mkboth\markboth}
\fi
% 重新定义\chaptermark，使其为\leftmark引用。
\renewcommand\chaptermark[1]{%
\markboth{\MakeUppercase{%
\ifnum \c@secnumdepth >\m@ne
	\if@mainmatter
		\@chapapp  \hskip1em%
	\fi
\fi
#1}}{}}

%---------- 本机字体设置 ----------
\RequirePackage{fontspec}
\setmainfont{TeX Gyre Termes}	%相当于MS Word中的Times New Roman。
\setsansfont{TeX Gyre Heros}	%相当于MS Word中的Helvetica。
\setmonofont{TeX Gyre Cursor}	%相当于MS Word中的Curier。
\RequirePackage{xeCJK}


% xeCJK 环境初始化
\xeCJKsetup{xeCJKactive=true}

% 打开/关闭CJK文字之间的空格，tex 源码中汉字间的换行符和空格都会被编译成空格
% 作者编写论文 tex 源码时一般写到一个逗号就换行再写 这样能最大限度的保证清晰
% 如不符合您的需求请自行解注释
%\xeCJKsetup{CJKspace=true}

\xeCJKsetup{CheckSingle=true} % 避免单个CJK字符独占一行

% 非简体中文常用字处理(生僻字、繁体字、日本汉字)
% 发现实际排版时此类字框会相对于行内上移一个微小的单位
% 故当封面作者名称含此类字时，只能预留相应的字框宽度，待后期补上
%\xeCJKDeclareCharClass{Ext-B}{ "20000 -> "2A6DF } % 看XeLaTeX文档写的 没软用
%\xeCJKsetup{AutoFallBack=true} % 如果不加这句 非简体中文汉字在章节标题和论文标题上显示异常

% 标点处理格式 行末半角 所有标点占一个汉字宽度 行首行末对齐
\xeCJKEditPunctStyle{hangmobanjiao}{enabled-global-setting = false}


% 设置中文正文字体为仿宋，加粗为黑体，斜体为楷体
\setCJKmainfont[BoldFont={SimHei}, ItalicFont={KaiTi}]{FangSong}
% 中文无衬线字体，不知道怎么设置，待以后解决。
% \setCJKsansfont{}
% 由于汉字都是等宽的，等宽字体通常应用在代码中，故这里选择用幼圆字体，具体有待以
% 后更改。
\setCJKmonofont{YouYuan}

%---------% 封面及中英标题页 ----------
% 定义封面及标题页设置中常用的下划线命令（默认宽度90pt）
\renewcommand\ULthickness{0.8pt}			% 重新定义下划线的厚度
\newcommand\ZJUunderline[2][90pt]{\uline{\hbox to #1{\hss#2\hss}}\hskip3pt}
% 重新定义\maketitle命令
\renewcommand\maketitle{
% \@mainmatterfalse
	\ZJUmakecover
	% \ZJUmakeCNtitlepage
	% 判断是否显示英文题名页，博士显示，硕士不显示。
	% \if@doctor
	% 	\ZJUmakeENtitlepage
	% \fi
	% \makeOSpage
}
% 封面
\newcommand\ZJUmakecover{
	\cleardoublepage
	\pdfbookmark[0]{封面}{anchor_cover}
	\thispagestyle{ZJU@empty}
	%分类号：\ZJUunderline[90pt]{\ZJU@classification}
	%\hfill
	%单位代码：\ZJUunderline[60pt]{\ZJU@serialnumber} \par
	%密\quad 级：\ZJUunderline[90pt]{\ZJU@secretlevel}
	%\hfill
	%学\ZJUspace 号：\ZJUunderline[60pt]{\if@anon\else\ZJU@studentnumber\fi} \par
	% \vspace{10mm}
	\begin{center}
		\includegraphics[width=60mm,trim=0 -30 0 -100]{../figures/logo/ZJDX.pdf}\par
		\vspace{4mm}
		{
			\if@doctor
				{\songti \zihao{-1}博士学位论文开题报告}
			\else
				{\songti \zihao{-1}硕士学位论文开题报告}
			\fi
		}\par
		\vspace{6mm}
		\includegraphics[width=22.8mm]{../figures/logo/QSY.pdf}
	\end{center}
	\vspace{6mm}
	% 新建一个长度寄存器，存放封面标题下划线宽度值
	\newlength{\titleulwidth@cover}
	\addtolength{\titleulwidth@cover}{260pt}
	\begin{center}
		\begin{tabular}[t]{>{\zihao{3}\bfseries}rl}
			中文论文题目: &
			{\begin{minipage}[t][60pt][t]{\titleulwidth@cover}
				\zihao{-2} \fangsong\bfseries
				\uline{\ZJU@title\hfill}
			\end{minipage}} \\%[20pt]
			\rule{0pt}{10mm}英文论文题目: &
			{\begin{minipage}[t][60pt][t]{\titleulwidth@cover}
				\newlength{\etitlelength}
				\fontsize{16}{23}\bfseries
				\settowidth{\etitlelength}{\ZJU@englishtitle}
% 使封面英文标题下划线数量能够适应因英文标题内容长短变化而引起的英文标题行数变化
% 而引起的下划线行数变化，下划线行数就是英文标题行数。目前最大的支持行数为3行，
% 不过行数可以根据需要扩展，只要符合页面格式的美观即可。不过论文编写规则中提到：
% 英文标题翻译应简短准确，一般不应超过150个字母，必要时可以加副标题。
				\ZJU@englishtitle\\*
				\ifdim\etitlelength<\titleulwidth@cover
					\raisebox{31pt}[0pt][0pt]{\parbox[t][][t]{\titleulwidth@cover}{
					\rule{\titleulwidth@cover}{\ULthickness}}}
				\else\ifdim\etitlelength<2\titleulwidth@cover
						\raisebox{67pt}[0pt][0pt]{\parbox[t][][t]{\titleulwidth@cover}{
						\rule{\titleulwidth@cover}{\ULthickness}\\*
						\rule{\titleulwidth@cover}{\ULthickness}}}
				\else\ifdim\etitlelength<3\titleulwidth@cover
						\raisebox{103pt}[0pt][0pt]{\parbox[t][][t]{\titleulwidth@cover}{
						\rule{\titleulwidth@cover}{\ULthickness}\\*
						\rule{\titleulwidth@cover}{\ULthickness}\\*
						\rule{\titleulwidth@cover}{\ULthickness}}}
				\fi\fi\fi
			\end{minipage}}\\*
		\end{tabular}
		\vfill
		\begin{tabular}{>{\zihao{4}\songti}r>{\zihao{4}\fangsong}l}
			申请人姓名: & \ZJUunderline[200pt]{\if@anon\else\ZJU@author\fi} \\[3mm]
			指导教师: & \ZJUunderline[200pt]{\if@anon\else\ZJU@supervisor\fi} \\[3mm]
			\if@cpsupervisor
				合作导师: & \ZJUunderline[200pt]{\if@anon\else\ZJU@cpsupervisor\fi} \\[3mm]
			\fi
			专业名称: & \ZJUunderline[200pt]{\ZJU@major} \\[3mm]
			研究方向: & \ZJUunderline[200pt]{\ZJU@research} \\[3mm]
			所在学院: & \ZJUunderline[200pt]{\ZJU@institute}
		\end{tabular}
	\end{center}
	\vskip 17mm
	\begin{center}
		{\zihao{-3}\songti\bfseries 提交日期\ZJUunderline[150pt]{%
		\if@anon\else\ZJU@submitdate\fi}}
	\end{center}
	%清空变量节省空间
	\global\let\ZJU@author\@empty
	\global\let\ZJU@supervisor\@empty
	\global\let\ZJU@cpsupervisor\@empty
	\global\let\ZJU@major\@empty
	\global\let\ZJU@research\@empty
	\global\let\ZJU@institute\@empty
	\global\let\ZJU@submitdate\@empty
	\global\let\author\relax
	\global\let\supervisor\relax
	\global\let\cpsupervisor\relax
	\global\let\major\relax
	\global\let\research\relax
	\global\let\institute\relax
	\global\let\submitdate\relax
}

%---------- 层次标题格式设置 ----------
\setcounter{secnumdepth}{4}		%设置为四级标题
\renewcommand\@chapapp{\thechapter }%

% 以下对标题格式采用laTeX2e底层命令主要是为了防止ctex宏包升级改变导致的命令不兼
% 容性，假如2.0之后宏包对1.02宏包命令不再支持，以后又要修改，不如一鼓作气。
% 现在以下命令可以正常工作，调整参数则慢慢来吧。
%% 章标题格式设置----小三仿宋加黑
\renewcommand\chapter{%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\phantomsection			% hyperref宏包的命令，超链接用。
	\thispagestyle{ZJU@plain}%
	\global\@topnum\z@%
	\@afterindenttrue%
	\secdef\@chapter\@schapter}
\def\@chapter[#1]#2{%
	\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
			\refstepcounter{chapter}%
			\addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp}#1}
		\else
			\addcontentsline{toc}{chapter}{#1}%
		\fi
	\else
		\addcontentsline{toc}{chapter}{#1}%
	\fi
	\chaptermark{#1}%
	% 在图目录和表目录中相应章节位置加垂直10pt的空白。
	\addtocontents{lof}{\protect\addvspace{10\p@}}%
	\addtocontents{lot}{\protect\addvspace{10\p@}}%
	\@makechapterhead{#2}
	\@afterheading}		% 不知道这个\@afterheading有什么用，先放着。
\def\@makechapterhead#1{%
	\vspace*{20\p@}%
	{\parindent \z@ \if@frontmatter\centering\else\raggedright\fi
	\fangsong\zihao{-3} \bfseries
	\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
			\@chapapp \hskip1em%
		\fi
	\fi
	\interlinepenalty\@M
	 #1\par\nobreak
	\vskip 24\p@}}
\def\@schapter#1{%
	\@makeschapterhead{#1}
	\@afterheading}
\def\@makeschapterhead#1{%
	\vspace*{20\p@}%
	{\parindent \z@ \raggedright
	\fangsong \zihao{-3} \bfseries
	\interlinepenalty\@M
	#1\par\nobreak
    \vskip 24\p@}}

% 新建一个章节标题宏，用法跟\chapter一样，只不过在无星号时，标题插入目录，但是没
% 有页码和中间点线。加星号功能跟\chapter一样，主要为了兼容。\mainmatter中chapter
% 编号计数器不变\npchapter和\chapter都为chapter计数器。
\newcommand\npchapter{
	\if@openright\cleardoublepage\else\clearpage\fi%
	\phantomsection			% hyperref宏包的命令，超链接用。
	\thispagestyle{ZJU@plain}%
	\global\@topnum\z@%
	\@afterindenttrue%
	\secdef\@npchapter\@schapter}
\def\@npchapter[#1]#2{%
	\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
			\refstepcounter{chapter}%计数器不变
			\addcontentsline{toc}{nopagechapter}{\protect\numberline{\@chapapp}#1}
		\else
			\addcontentsline{toc}{nopagechapter}{#1}%
		\fi
	\else
		\addcontentsline{toc}{chapter}{#1}%
	\fi
	\chaptermark{#1}%
	% 在图目录和表目录中相应章节位置加垂直10pt的空白。
	\addtocontents{lof}{\protect\addvspace{10\p@}}%
	\addtocontents{lot}{\protect\addvspace{10\p@}}%
	\@makechapterhead{#2}
	\@afterheading}

%%一级节标题格式设置----四号仿宋加黑
\renewcommand\section{\@startsection{section}{1}{\z@}%
									{2ex \@plus .2ex \@minus .2ex}%
									{1.8ex \@plus.2ex}%
									{\parindent \z@ \raggedright
									 \fangsong\zihao{4}\bfseries}}

%%二级节标题格式设置----小四号仿宋
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
									{1.6ex \@plus 0.4ex \@minus .2ex}%
									{1ex \@plus.2ex}%
									{\parindent \z@ \raggedright
									 \fangsong\zihao{-4}}}

%%三级节标题格式设置----小四号仿宋
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
									{1.4ex \@plus 0.3ex \@minus .2ex}%
									{0.9ex \@plus.2ex}%
									{\parindent \z@ \raggedright
									 \fangsong\zihao{-4}}}

\newif\if@frontmatter\@frontmatterfalse
% \frontmatter,\mainmatter,\backmatter重定义。
\renewcommand\frontmatter{%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\@frontmattertrue
	\@mainmatterfalse
	\pagenumbering{Roman}
	\pagestyle{ZJU@headings}}
\renewcommand\mainmatter{%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\@frontmatterfalse
	\@mainmattertrue
	\pagenumbering{arabic}
	\pagestyle{ZJU@headings}}
\renewcommand\backmatter{%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\@frontmatterfalse
	\@mainmatterfalse}

% 对\appendix进行重新定义，使之可以在\backmatter之后产生章节标题序号，且在书签栏
% 和目录上点击后可以正常跳转到相应的标题项。放弃原来对 \appendix的修改，在前部加
% 上\mainmattertrue会导致书签和目录项跳转产生问题。
\let\OLDappendix\appendix
\newif\if@appendixinbackmatter
\renewcommand\appendix{
	\if@mainmatter
		\@appendixinbackmatterfalse
		\OLDappendix
	\else
		\@appendixinbackmattertrue
		\@mainmattertrue
		\OLDappendix
		\renewcommand\@chapapp{附录~\thechapter}
		\gdef\thechapter{\@Alph\c@chapter}
	\fi}

%---------- 目录（目次） ----------
\renewcommand{\contentsname}{目\texorpdfstring{\ZJUspace}{}次}				% 重命名章节目录名。
\renewcommand{\listfigurename}{插\texorpdfstring{\ZJUspace}{}图}			% 重命名插图目录名。
\renewcommand{\listtablename}{表\texorpdfstring{\ZJUspace}{}格}				% 重命名表目录名。

% 下一条命令作用：在toc目录文件中插入‘\let\CTEX@spaceChar\relax’字符，用以删除目
% 录中的空格字符，其空格字符由\CTEX@spaceChar定义。
\addtocontents{toc}{\let\string\ZJU@spaceChar\relax}

% 目录位置尺寸设置
\renewcommand\@pnumwidth{1.55em}		% 放页码page这个盒子的宽度
\renewcommand\@tocrmarg{2.55em}			% 这个参数怎么没用，改动后看不到效果
\renewcommand\@dotsep{2.2} 				% 目录点间的距离
\setcounter{tocdepth}{2}				% 目录深度，到subsection。

% % 根据\contentsline 的原理，我自己写一个\ZJU@l@***的命令。
% % 嗯，发现这个命令并没有什么卵用。待以后在开发。
% \def\contentsline#1{\csname ZJU@l@#1\endcsname}

%% 章节目录
% \renewcommand\tableofcontents{%
% 	% 使用\npchapter，将标题插入目录，但是不产生页码和中间点线。
% 	\npchapter{\contentsname}
% 	\markboth{\contentsname}{}
% 	\@starttoc{toc}
% 	}

% 发现latex2e源码中有这么一行：\def\contentsline#1{\csname l@#1\endcsname}这样一
% 下子就明白了，以\l@*** 开头的命令的两个参数就是\contentsline使用说明的三个参数
% 中的后面两个参数，虽然定义的时候\contentsline只有一个参数。
% #1为目录内容，可以加上章节号title，\chapter中有定义；#2为页码page。
\renewcommand*\l@chapter[2]{%
	\ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}%
		% 下一行增加新一章章节标题在目录中与前面部分的间距
		% \vskip 2\p@ \@plus\p@
		% 下一行是章节序号所在box的宽度
		\setlength\@tempdima{1.5em}%
		\begingroup
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\leavevmode
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			\fangsong\zihao{-4} #1\nobreak
			% 下两行是增加章节标题项的中间点
			\leaders\hbox{$\m@th%
				\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
			\nobreak\hb@xt@\@pnumwidth{\hss #2}\par
			\penalty\@highpenalty
    	\endgroup
	\fi}

% 这个样式主要是为“目录”这个标题在目录页中的样式服务的，模板中要求“目录”没有页码
% 和中间点连接线，所以弄了这么个nopagechapter目录格式。你说我为什么不用其他方法，
% 这也是没办法，hyperref 宏包把\addcontentsline和\contentsline改了，主要是为了超
% 链接用，如果我把他们重新定义，超链接就会失效。
\newcommand*\l@nopagechapter[2]{%
	\ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}%
		\setlength\@tempdima{1.5em}%
		\begingroup
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\leavevmode
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			\fangsong\zihao{-4} #1\nobreak\hfill
			\nobreak\hb@xt@\@pnumwidth{\hss}\par
			\penalty\@highpenalty
    	\endgroup
	\fi}

% \@dottedtocline定义了5个参数，但是一下命令里只使用了两个，后面两个其实原理跟上
% 面介绍的一样，\contentsline带有3个参数，第一个参数展开后形成\l@***的命令，然后
% \l@***再展开，形成带有3个参数的\@dottedtocline{}{}{}，\@dottedtocline还需title
% 和page两个参数，而\contentsline剩下的两个参数刚好是title和page。
\renewcommand*\l@section{\@dottedtocline{1}{2em}{2.1em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{4em}{3em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{6em}{3.8em}}

%% 图目录
\renewcommand\listoffigures{%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\chapter{\listfigurename}
	\@starttoc{lof}}

\renewcommand*\l@figure{\@dottedtocline{1}{0\p@}{2.3em}}

%% 表目录
\renewcommand\listoftables{%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\chapter{\listtablename}
	\@starttoc{lot}}

\let\l@table\l@figure

% ---------- 参考文献样式 ----------
% 修改thebibliography 环境用于在目次中加入参考文献页。
\renewenvironment{thebibliography}[1]
     {\chapter{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \itemsep \z@ \@plus\p@ \@minus\p@
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

% 采用gbt7714-2005参考文献样式，
% 参考自https://github.com/githamburger/GBT7714-2005-BibTeX-Style
\bibliographystyle{gbt7714-2005}

% natbib宏包命令，参考文献上标设置。
\setcitestyle{super,square,comma}

% 重新定义 \ref 命令，使其前面自动加一个 ``~''。因为hyperref 宏包会通过 \AtBegin-
% Document 修改 \ref 的定义，因此我们对 \ref 的修改也必须使用\AtBeginDocument 命
% 令进行。同时我们需要修改 \eqref，使其括号前后不出现空隙。参考自njuthesis胡海星。
\AtBeginDocument{%
	\let\oldref\ref%
	\renewcommand*{\ref}[1]{\thinspace\oldref{#1}}%
	\renewcommand*{\eqref}[1]{(\oldref{#1})}
}

% ---------- 浮动体相关定义 ----------
% 设置浮动环境标题的字体大小。根据学位论文格式要求，插图和表格标题字体需要比正文
% 字体略小。
\captionsetup{%
	format=hang,
	labelsep=quad,		% 去掉图表号后的冒号。图序与图名文字之间空一个汉字宽度。
	skip=10pt,			% 标题与图标之间空10pt距离。
	font=small,			% 标题字体比正文小一号，这里取small。
	% width=0.75\textwidth 	% 标题最大宽度为0.75倍正文宽度。
%TODO:width影响bi-second居中
	}

% 根据学位论文格式要求，表格的标题必须位于表格上方，插图的标题必须位于插图下方。
\captionsetup[table]{position=above}
\captionsetup[figure]{position=below}

% 中英文双语bicaption定义
\DeclareCaptionOption{bi-first}[]{%
  \def\tablename{表}%
  \def\figurename{图}}
\DeclareCaptionOption{bi-second}[]{%
  \def\tablename{Tab}%
  \def\figurename{Fig}}
  
\captionsetup[bi-first]{bi-first}
\captionsetup[bi-second]{bi-second, list=off}



%% 以下为设置浮动对象和文字之间的距离。
% 版心顶部或者版心底部浮动体之间的垂直距离，默认为12pt plus 2pt minus 2pt。
\setlength{\floatsep}{10bp \@plus2pt \@minus1pt}

% 文本行之间浮动体（使用h位置选项）与上下文之间的距离，默认为12pt plus 2pt minus
% 2pt。
\setlength{\intextsep}{12bp \@plus2pt \@minus1pt}

% 版心顶部或底部的浮动体与文本之间的距离，默认为12pt plus 2pt minus 2pt。
\setlength{\textfloatsep}{12bp \@plus2pt \@minus1pt}

% 浮动页中，版心顶部的浮动体与版心顶边之间的距离，默认为0pt plus 1fil。
\setlength{\@fptop}{0bp \@plus1.0fil}

% 浮动页中浮动体直接的距离，默认为8pt plus 2fil。
\setlength{\@fpsep}{8bp \@plus2.0fil}

% 浮动页中，版心底部的浮动体与版心底边之间的距离，默认为0pt plus 1fil。
\setlength{\@fpbot}{0bp \@plus1.0fil}

%% 下面这组命令使浮动对象的缺省值稍微宽松一点，从而防止幅度对象占据过多的文本页
%% 面，也可以防止在很大空白的浮动页上放置很小的图形。
% 默认情况下，LaTeX要求每页的文字至少占据 20%，否则该页就只单独放置一个浮动环境。
% 而这通常不是我们想要的。我们将这个要求降低到 5%。
\renewcommand{\textfraction}{0.05}

% 在一文本页中，被置于版心顶部的所有浮动体的高度与版心高度的最大比值，默认为0.7，
% 这里修改为0.9，任何造成高度超过版心高度90% 的浮动体都被将阻止置于当前版心顶部。
\renewcommand{\topfraction}{0.9}

% 同上，只不过变成了版心底部，默认为0.3.
\renewcommand{\bottomfraction}{0.8}

% 在任意一个“浮动页”中，所有的浮动体高度与版心的高度的最小比值，默认为 0.5，这里
% 设置成0.85。因此，浮动页中空白与版心的比值不会超过1-\floatpagefraction。
\renewcommand{\floatpagefraction}{0.85}

% ---------- 中英文摘要及关键词 ----------
% 中文摘要环境
\newenvironment{cabstract}{%
	\chapter{摘\texorpdfstring{\ZJUspace}{}要}}{}
\newenvironment{eabstract}{%
	\chapter{Abstract}}{}

% 中英文关键词命令及其格式的自动定义；
% 参照thuthesis，薛瑞尼，P37/66，v4.8.1 (2014/12/09)。
% 这段宏定义搞了我一个下午才看懂，哎…… 这个 \@for 命令挺有用的。
\def\ZJU@parse@keywords#1{
	\expandafter\gdef\csname ZJU@#1\endcsname{} % todo: need or not?
	\expandafter\gdef\csname @#1\endcsname##1{
	\@for\reserved@a:=##1\do{
		\expandafter\ifx\csname ZJU@#1\endcsname\@empty\else
	    	\expandafter\g@addto@macro\csname ZJU@#1\endcsname{%
	    	\ignorespaces\csname ZJU@#1@separator\endcsname}
	  	\fi
	  	\expandafter\expandafter\expandafter\g@addto@macro%
	    \expandafter\csname ZJU@#1\expandafter\endcsname%
	    \expandafter{\reserved@a}}}}

% 根据以上宏定义，以下命令分别产生\@ckeywords{} 和 \@ekeywords{} 两个读取关
% 键词的宏，和加工后保存关键词的 \ZJU@ckeywords 和 \ZJU@ckeywords 的宏定义。
\ZJU@parse@keywords{ckeywords}
\ZJU@parse@keywords{ekeywords}

% 以下分别是中英文关键词的分隔符
\def\ZJU@ckeywords@separator{；}
\def\ZJU@ekeywords@separator{;}

% 用户界面命令，读取和排版关键词
\newcommand*\ckeywords[1]{%
	\@ckeywords{#1}
	\vspace{5ex}
	\noindent\textbf{关键词：}\ZJU@ckeywords}
\newcommand*\ekeywords[1]{%
	\@ekeywords{#1}
	\vspace{5ex}
	\noindent\textbf{Keywords:}\ \ZJU@ekeywords}

% ---------- 通用列表环境的重新定义 ----------
% 以下列表参数的修改主要是模仿book.cls，整体样式改动不大，只是修改了参数，但是去
% 掉了对twocolumn的支持。

%% 各级列表的缩进没有改变，所以注释掉了，如需改变，自己改。
% \setlength\leftmargini  {2.5em}
% \leftmargin  \leftmargini
% \setlength\leftmarginii  {2.2em}
% \setlength\leftmarginiii {1.87em}
% \setlength\leftmarginiv  {1.7em}
% \setlength\leftmarginv  {1em}
% \setlength\leftmarginvi {1em}

%% 标签与列表正文的间距和标签的宽度，因为参数没改，所以注释掉了。
% \setlength  \labelsep  {.5em}
% \setlength  \labelwidth{\leftmargini}
% \addtolength\labelwidth{-\labelsep}

% 鼓励在list前、后和item间分页。
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty

% 各级列表的参数结构参数设置
\def\@listi{\leftmargin\leftmargini
            \parsep\parskip
            \topsep\z@
            \itemsep\z@}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep \z@
              \parsep \z@
              \itemsep \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep \z@
              \parsep \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}

% ---------- 打算重新定义Enumerate，Itemize，先挖个坑 ----------


% ---------- 缩写、符号清单、术语表 ----------
% 以下尺寸详细说明见P33/112
\newenvironment*{denotation}[1][2.5cm]{
\chapter{缩写、符号清单、术语表}
\noindent
\begin{list}{}{
	\renewcommand\makelabel[1]{##1\hfil}
	\setlength{\itemindent}{0cm} 			% 标签缩进量
	\setlength{\labelsep}{1cm} 				% 标签与列表文本距离
	\setlength{\labelwidth}{#1} 			% 标签盒子宽度，如有需要可以自行修改
	\setlength{\listparindent}{0pt} 		% 同一\item 第二及以后段落缩进量
	\setlength{\rightmargin}{0cm}
	\setlength{\leftmargin}{\labelwidth}		% list环境整体向右推
	\addtolength{\leftmargin}{\labelsep}		% \labelwidth + \labelsep 的距离
	\setlength{\itemsep}{0pt plus2pt minus1pt}	% 标签间距
	\setlength{\parsep}{\itemsep} 				% 段落间距
	\setlength{\topsep}{0pt} 					% 标签与上文的间距
	\setlength{\partopsep}{3pt plus2pt minus2pt}
}}{\end{list}}

% ---------- 脚注样式 ----------
% 使用footmisc宏包和pifont宏包设置符合 GB/T 7713.1-2006 规范的脚注样式。注意，由
% 于pifont宏包提供的特殊符号的限制，一页之中最多只能有10个脚注。
% 这些命令设置跟脚注设置方法思路全都引用自南京大学计算机科学与技术系胡海星编写的
% 《NJU-Thesis:南京大学学位论文XeLaTeX模板》v1.1.18 (2015/7/16)版本。
\DefineFNsymbols*{circlednumber}[text]{%
	{\ding{192}} %
	{\ding{193}} %
	{\ding{194}} %
	{\ding{195}} %
	{\ding{196}} %
	{\ding{197}} %
	{\ding{198}} %
	{\ding{199}} %
	{\ding{200}} %
	{\ding{201}}}
\setfnsymbol{circlednumber}
% 脚注部分需要修改，段落部分单倍行距。
