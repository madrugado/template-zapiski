% ������ �� 06.04.11
%

%
% �������� spmj-l.cls ��� ���� �������
%
\NeedsTeXFormat{LaTeX2e}% LaTeX 2.09 can't be used (nor non-LaTeX)
[1994/12/01]% LaTeX date must December 1994 or later
\ProvidesClass{zapiski}
              [2011/04/06 v1.0 Zapiski nauchnykh seminarov POMI Author Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsart}}
\ProcessOptions

\LoadClass[reqno]{amsart}[2009/07/02]

\RequirePackage{textcomp}
% ��� ��������� ����������� ������ ���������

% �������, ������� ������������� ��������� ��� ������ ������������ ������
\def\english{
\righthyphenmin=3
\def\prefacename{Preface}
\def\refname{References}
\def\abstractname{Abstract}
\def\bibname{Bibliography}
\def\chaptername{Chapter}
\def\appendixname{Appendix}
\def\contentsname{Contents}
\def\indexname{Index}
\def\figurename{Fig.}
\def\tablename{Table}
\def\partname{Part}
\def\pagename{Page}
\def\proofname{Proof}
\def\glossaryname{Glossary}
\@ifundefined{chapter}{}{\def\chaptername{Chapter}}
\def\keywordsname{Key words and phrases}

% Abstract � ������ ��-��������� ����������� ����� ��� � � "������� � �������"
% ������ � �������������� �������
% �������� ��� �������, ����� �� ��������� �������� ��-��������� � ����� ������
\def\engauthors##1{}
\def\engtitle##1{}

\global\def\@setabstractb{\relax}
\global\def\@setabstracta{%
  \ifvoid\abstractbox
  \else
    \skip@18\p@ \advance\skip@-\lastskip
    \advance\skip@-\baselineskip \vskip\skip@
    \box\abstractbox
    \prevdepth\z@ % because \abstractbox is a vtop
  \fi
}

\renewenvironment{abstract}{%
  \ifx\maketitle\relax
    \ClassWarning{\@classname}{Abstract should precede
      \protect\maketitle\space in AMS documentclasses; reported}%
  \fi
  \global\setbox\abstractbox=\vtop \bgroup
    \normalfont\Small
    \list{}{\labelwidth\z@
      \leftmargin3pc \rightmargin\leftmargin
      \listparindent\normalparindent \itemindent\z@
      \parsep\z@ \@plus\p@
      \let\fullwidthdisplay\relax
    }%
     \item\unskip\ignorespaces%
    \item[\hskip\labelsep\scshape\abstractname.]%
}{%
  \endlist\egroup
  \ifx\@setabstract\relax \@setabstracta \fi
}

} % ������������� ������ �� ���������� �����������

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% �������� ��������� �������� �����

\frenchspacing
\righthyphenmin 2

% ������� ��������. ��������!!!

\textwidth=113mm
\textheight=178mm 
\addtolength{\textheight}{-\topmargin}
\addtolength{\textheight}{-\headheight}
\addtolength{\textheight}{-\headsep}
\footskip=18pt
% 178mm ���� ������ � ������������
%\calclayout % ��� ���?


% ��� �� ��������� ����

\renewcommand{\datename}{���������}
%\def\@setdate{\flushright{\footnotesize\upshape\datename\enskip\@date}}
\def\@setdate{\vspace*{-\baselineskip}\vbox to -\baselineskip{\flushright{%\footnotesize
{\footnotesize\rmfamily\datename\enskip\@date}}}}

%
% ������������ ����� amsart
%

\def\@setabstracta{\relax}
\let\@engauthors=\@empty
\let\@engtitle=\@empty
%
% ��� ����� ��� �������� ������� � ��������, � ����� ����������� abstract'�
% � ����� ������

\def\@setaddresses{\par
  \nobreak \begingroup
\footnotesize
  \def\author##1{\addvspace\bigskipamount}%
%  \def\\{\unskip, \ignorespaces}%
% � ��� ������� ������ ��������������
  \interlinepenalty\@M
  \def\address##1##2{\begingroup
%    \par\addvspace\bigskipamount\indent
    \par\addvspace\bigskipamount
% ������ �� �� ������
    \@ifnotempty{##1}{(\ignorespaces##1\unskip) }%
%    {\scshape\ignorespaces##2}\par\endgroup}%
    {\noindent\ignorespaces\normalfont\rmfamily##2}\par\endgroup}%
   \def\curraddr##1##2{}
%  \def\curraddr##1##2{\begingroup
%    \@ifnotempty{##2}{\nobreak\indent{\itshape Current address}%
%      \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/:\space
%      ##2\par}\endgroup}%
% � ����� �� ��� �����? ��������!!!
  \def\email##1##2{\nobreak\addvspace\smallskipamount\begingroup
    \@ifnotempty{##2}{\nobreak\noindent{\itshape E-mail}\/:%
      \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/\space
      \footnotesize\ttfamily##2\par}\endgroup}%
% � ��� �������� � �������� ��������, ������ �����������
  \def\urladdr##1##2{\begingroup
    \@ifnotempty{##2}{\nobreak\indent{\itshape URL}%
      \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/:\space
      \ttfamily##2\par}\endgroup}%
% URL ���� �� ������������. � ���� ��? ��� ������ � ��� �� �����? ��������!!!
  \addresses
  \endgroup
}

%
% %%%%%
%

% ���-�� ����� ������ �������

\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \bfseries
% ����  \itshape
    #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}

%%%%%%%%%%

% ������� ������� \engtitle � \engauthors ��� ��������� �������� �������� 
% � ������� �������, ���������� � ����� ������

\newcommand*{\engtitle}[1]{\gdef\@engtitle{#1}}
\newcommand*{\engauthors}[1]{\gdef\@engauthors{#1}}

% ����������� � ����������
% � ������� �� ����� ��� � ����� ������, ���� ������ ������������
% � ���������� ����� ����� ���������, �.�. ��� � amsart'�

\renewenvironment{abstract}{%
  \global\setbox\abstractbox=\vtop \bgroup
    \normalfont
}{%
\egroup
  \ifx\@setabstract\relax \@setabstracta \fi
}

%
% ��������������� ������� ��������� ������� ������ �� ��������, 
% �������� ������ ����
%

\renewcommand{\andify}{%
%  \nxandlist{\unskip, }{\unskip{} �~}{\unskip{} �~}}
  \nxandlist{\unskip, }{\unskip, }{\unskip, }}
% �� ��������� ������ "�" �� �����

%
% � �������� �� �� ������ ������� � ��������� �����
% ����� ��� � ���������

% ��� ����� ������� ����������� ��������� flushleftquote
% � ������������ ��� ��������� �������

\newenvironment{flushleftquote}{%
  \list{}{\leftmargin12pt\raggedright}\item[]%
}{%
  \endlist
}

\def\@setauthors{%
  \begingroup
  \trivlist
  %\centering\footnotesize 
  \@topsep30\p@\relax
  \advance\@topsep by -\baselineskip
  \item\relax
  \andify\authors
  \def\\{\protect\linebreak}%
% \MakeUppercase{\authors}%
  {\begin{flushleftquote}\bfseries{\authors}\end{flushleftquote}}%
  \endtrivlist
  \vskip5pt
  \endgroup
}

\def\@settitle{\begin{flushleftquote}%
  \baselineskip14\p@\relax
    \bfseries
\uppercasenonmath\@title
  \@title
  \end{flushleftquote}%
}

% AMS������ �������� �� �����

\def\@setcopyright{}

% ������ ����� ��� ������������
% ��������� � �������� ����������
% ����� ���������� �� ����� ������ � ������ � ���� ��������� ���������� 
% ���� �� ��������, ������� �� �������� ����������� � scriptsize ������ 
% ��� �����
 
\def\ch@ngefonts{\let\tempfont=\scriptsize \let\scriptsize=\footnotesize}
\def\Ch@ngefonts{\let\scriptsize=\tempfont}
\let\@@evenhead=\@evenhead
\renewcommand{\@evenhead}{\raisebox{0pt}[\headheight][0pt]%
{\ch@ngefonts\vbox{\hbox to\textwidth{\strut \@@evenhead}\Ch@ngefonts\hrule}}}
\let\@@oddhead=\@oddhead
\renewcommand{\@oddhead}{\raisebox{0pt}[\headheight][0pt]%
{\ch@ngefonts\vbox{\hbox to\textwidth{\strut \@@oddhead}\Ch@ngefonts\hrule}}}


% ���������� ������, ��� ����� � �.�. 
% ������ ��� ��� ������������ � ���������� ������� SPbMJ � Plenum'��
\def\originfo#1#2#3#4{\def\origvolume{#1}\def\origissue{#2}%
  \def\origmonth{#3}\def\origyear{#4}}
\originfo{00}% volume number
  {0}%        % issue number
  {Yyyy}%     % month
  {0000}%     % year
\def\origpages#1#2{\def\origfirstpage{#1}\def\origlastpage{#2}}
\origpages{0}% first page
  {0}%        % last page
\def\enginfo#1#2#3#4{\def\engvolume{#1}\def\engissue{#2}%
  \def\engmonth{#3}\def\engyear{#4}}
\enginfo{00}% volume number
  {0}%        % issue number
  {Yyyy}%     % month
  {0000}%     % year

% ���������� ������� ��� ���
% ����� �� ������������, ������ ��� ������������ � Plenum'��
\def\UDC#1{\def\@UDC{#1}}
\let\@UDC=\@empty
\def\@setUDC{\ifx\@empty\@UDC\else{\bfseries UDC \@UDC}\fi}


%    ���������� �������
\def\publnamef{%
  \hbox{������� �������}}
\def\publnames{%
  \hbox{��������� ����}}
\def\russianvolinfo{%
  \hbox{��� \origvolume, \origyear\ �.}}
\AtBeginDocument{%
  \def\@serieslogo{%
    \vbox to\headheight{%
      \parindent\z@ \parfillskip\z@ \fontsize{8}{8\p@}\selectfont
      \noindent\hbox{\vbox{\hfill\publnamef\linebreak\indent\hfill\publnames
      \linebreak\indent\hfill\russianvolinfo}}\linebreak
      \null\hfill 
      \endgraf
      \vss
    }%
  }%
}

% ������������ maketitle

\def\@maketitle{%
  \normalfont\normalsize
  \let\@makefnmark\relax  \let\@thefnmark\relax
%  \ifx\@empty\@subjclass\else \@footnotetext{\@setsubjclass}\fi %� ��� ������ ���
  \ifx\@empty\@keywords\else \@footnotetext{\@setkeywords}\fi
  \ifx\@empty\thankses\else \@footnotetext{%
    \def\par{\let\par\@par}\@setthanks}\fi
%%%%
  \@mkboth{\@nx{\shortauthors}}{\@nx\shorttitle}%
% ������-�� ��� ������� �� ��������, �������� ��� ���������� ���-�� �� amsart
  \global\topskip24\p@\relax % 5.5pc   "   "   "     "     "
  \ifx\@empty\authors \else \@setauthors \fi
  \@settitle
  \@setabstracta
  \normalsize
% � ��� ���������� ����� abstract'�
  \ifx\@empty\@dedicatory
  \else
%    \baselineskip18\p@
    \baselineskip14\p@
    \vtop{\flushright{\bfseries\@dedicatory\@@par}%
% ��������� ������, ���������� �������
      \global\dimen@i\prevdepth}\prevdepth\dimen@i
  \fi
  \mycontentslabel
% ��������� ��������������� ������� � aux-���� ��� �������� �������� 
% ����������
  \if@titlepage
    \newpage
  \else
    \dimen@18\p@ \advance\dimen@-\baselineskip
    \vskip\dimen@\relax
  \fi
} % end \@maketitle

% ���������� abstract � ����� ������

\def\@setabstractb{%
 \ifvoid\abstractbox
 \else
   \skip@8\p@ \advance\skip@-\lastskip
% � �� ������ ������������ ������ ��������
%   \advance\skip@-\baselineskip 
   \vskip\skip@
   \unvbox\abstractbox
   \prevdepth\z@ % because \abstractbox is a vtop
 \fi
}

% � ��� ����� "�������� ����" ���������

\def\@setkeywords{%
  {\itshape \keywordsname}\/:\enspace \@keywords\@addpunct.}

% ����� ������ ���������

% � ��� large sf

\def\section{\@startsection{section}{1}%
  \z@{.7\linespacing\@plus\linespacing}{.5\linespacing}%
%  {\normalfont\scshape\centering}}
  {\normalfont\large\scshape\centering}}
\def\specialsection{\@startsection{section}{1}%
  \z@{\linespacing\@plus\linespacing}{.5\linespacing}%
%  {\normalfont\centering}}
  {\normalfont\large\scshape\centering}}

% ��������� �������, ����� ������ ��� ��� ��������

% � ������ ����������
% �� ���� ����������� ������� ���������� ������ �� ����� � ������, �� �����
% ������� ������������ �������? -- �������� �.�.
%
\def\@biblabel#1{\@ifnotempty{#1}{#1.}}

%
% ����� �� ���������� �� ��� ��� ��� ����������
%
\def\enddoc@text{%
  \ifx\@empty\@engauthors \else
  \ifx\@empty\@engtitle \else\@setengtitle\fi\fi
  \ifx\@empty\@setabstractb \else\@setabstractb\fi
%  \ifx\@empty\@translators \else\@settranslators\fi
  \ifx\@empty\@date \else\@setdate\fi
  \ifx\@empty\addresses \else\@setaddresses\fi
}

% ����� �� spmj-l

%    Miscellaneous information associated with translation.
%    [bnb, 2003/06/03]
\def\translnote#1{%
  \ifx\@empty\@translnotes \def\@translnotes{#1}%
  \else\g@addto@macro\@translnotes{\par\vspace{3\p@}#1}\fi}
\let\@translnotes=\@empty
\def\@settranslnotes{%
  \par\begingroup
    \addvspace{3\p@\@plus5\p@}%
    \flushright\normalfont\Small
    \@translnotes\par
  \endgroup}
\newcommand{\eo}[1]{\translnote{English original provided by #1}}
\newcommand{\rv}[1]{\translnote{Revised version provided by #1}}
\newcommand{\op}[1]{\translnote{Originally published in #1}}
\newcommand{\eb}[1]{\translnote{Edited by \uppercase{#1}}}

% � ��� ������ ����� ���������? !!!

\def\@setengtitle{%
  \par\begingroup
    \addvspace{12\p@\@plus5\p@}%
    \normalfont
    \@engauthors\ \@engtitle\par
  \endgroup}

% �������� ������� ������� � ��������� � ����� ������

%  Various style differences between SPMJ and amsart.
%  [bnb, 2004/12/14]
%  Add section sign before section numbers; also in table of contents.
 \def\@checksectlevel{\ifnum\@toclevel=\@ne \S\fi}
 \def\@seccntformat#1{%
   \protect\textup{\protect\@secnumfont
     \protect\@checksectlevel
     \csname the#1\endcsname
     \protect\@secnumpunct
   }%
 }

 \renewcommand{\tocsection}[3]{%
   \indentlabel{\@ifnotempty{#2}{\ignorespaces#1 \S#2.\quad}}#3}
% ���� �� ���� ����� ������� ������ ����������, �� ����� ����������������
% � ������ ���������� amsart'������
% �������� � �.�. 

%  Subsection numbers bold.
\def\@secnumfont{%
    \ifnum\@toclevel=\tw@ \bfseries \fi
}
%  Omit page numbers from in-article contents.
\renewcommand{\addcontentsline}[3]{%
  \addtocontents{#1}{\protect\contentsline{#2}{#3}{}}}

%
% �������� ������������� �� russcorr
%

%\newcommand*{\tg}{\mathop{\operator@font tg}\nolimits}
%\newcommand*{\ctg}{\mathop{\operator@font ctg}\nolimits}
%\newcommand*{\cosec}{\mathop{\operator@font cosec}\nolimits}
%\newcommand*{\arctg}{\mathop{\operator@font arctg}\nolimits}
%\newcommand*{\arcctg}{\mathop{\operator@font arcctg}\nolimits}
%\newcommand*{\sh}{\mathop{\operator@font sh}\nolimits}
%\newcommand*{\ch}{\mathop{\operator@font ch}\nolimits}
%\newcommand*{\cth}{\mathop{\operator@font cth}\nolimits}
\@ifundefined{th}{}{%
 \PackageInfo{russcorr}{Command \string\th\space is being redefined}
}
\def\th{\mathop{\operator@font th}\nolimits}
%\let\eps\varepsilon
%\let\vphi\varphi

\DeclareSymbolFont{AMSa}{U}{msa}{m}{n}
\DeclareSymbolFont{AMSb}{U}{msb}{m}{n}
\DeclareMathSymbol{\varkappa}{\mathord}{AMSb}{"7B}
\DeclareMathSymbol{\leqslant}{\mathrel}{AMSa}{"36}
\DeclareMathSymbol{\geqslant}{\mathrel}{AMSa}{"3E}

\def\contentsname{����������}
\def\figurename{���.}
\def\partname{�����}
%\def\listfigurename{������ ��������}
%\def\listtablename{������ ������}
\def\refname{����������}
% ����� ����� ����� ������ �����
\def\bibname{����������}
%\def\indexname{���������� ���������}
\def\tablename{�������}
%\def\abstractname{���������}
\@ifundefined{chapter}{}{\def\chaptername{�����}}
\def\proofname{��������������}
\def\appendixname{����������}
%\def\prefacename{�����������}
\def\keywordsname{�������� �����}


%\if@textyo
%\DeclareTextComposite{\"}{OT1}{�}{`\�}
%\DeclareTextComposite{\"}{OT1}{�}{`\�}
%\fi

%
% ������� � ���������
%

\def\@captionheadfont{\rmfamily}
\def\@captionfont{\normalfont}

\def\CONT#1#2#3#4{\relax}
\def\mycontentslabel{\@bsphack
  \protected@write\@auxout{}%
         {\string\CONT{\authors}{\@title}{\origissue}{\thepage}}%
  \@esphack}
\def\nocontents{\gdef\mycontentslabel{\relax}}

% �������-������
\chardef\llq=128
\chardef\rrq=129

\endinput

%%%%%%%%%%%%%
%
% � ���������� ���������� �����, ���� �� ����-������ �����
%

\def\ukazatel{%
\def\ips{20mm}
\def\ps{10mm}
\frenchspacing
\rightskip=\ips
\parindent=0pt
\parfillskip=-\ips
% �������, �������� ���������� ������� �������, ������� ��������, ������
% \dotfill, ����� ����� ������� � ��������
\gdef\CONT##1##2##3##4{\hangindent=8mm{\bfseries\ignorespaces##1\unskip}
 {\mdseries\quad\ignorespaces##2\unskip}
 \dotfill\hbox to \ips{\hfil\itshape\ignorespaces##3\unskip\upshape,
  \hbox to \ps{\hfil\ignorespaces##4\unskip}}\par}
% ���������� ������ ��� ������ ����
% ������ �. �., ��. ������ �. �., ������ �. �.
\gdef\SCONT##1##2##3##4##5{\hangindent=8mm{\bfseries\ignorespaces##1,\unskip}
 {\mdseries\quad\ignorespaces ��.~##2\unskip}
 \dotfill\hbox to \ips{\hfil\itshape\ignorespaces##4\unskip\upshape,
  \hbox to \ps{\hfil\ignorespaces##5\unskip}}\par}
%
% ��� ���������� ��������� ��� ������������ ����, ������� � ������ 
% ��������� ����� ����� ����� ��������
%
\AtBeginDocument{%
  \def\@serieslogo{%
    \vbox to\headheight{%
      \parindent\z@ \parfillskip\z@ \fontsize{8}{8\p@}\selectfont
      \noindent\publname\linebreak
      \russianvolinfo
      \null\hfill 
      \endgraf
      \vss
    }%
  }%
\nocontents
\title[������� ���������]%
{������� ��������� ������� \\ \llq ������� � ������\rrq \\ 
$\text{�.~\origvolume, \origyear~�.}$}
\maketitle
\vbox to-1pc{\rightline{\upshape\No\hbox to\ps{\hfil �.}}\vss}
}
}


