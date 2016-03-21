%% Modified from `brandeis-dissertation.cls', changed 
% to conform to the University of Nebraska guidelines.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{layout-dissertation}%
  [2016/03/18 v1.0 Dissertation settings]
\newif\ifnu@blankclear
\DeclareOption{blankcleared}{\nu@blankcleartrue}
\DeclareOption{numbercleared}{\nu@blankclearfalse}
\newif\ifnu@minmar
\DeclareOption{minmargins}{\nu@minmartrue}
\DeclareOption{15margins}{\nu@minmarfalse}
\newif\ifnu@nochange@small@ftnt
\DeclareOption{12pt}{\def\nu@book@size{12pt}%
  \nu@nochange@small@ftntfalse}
\DeclareOption{11pt}{\def\nu@book@size{11pt}%
  \nu@nochange@small@ftnttrue}
\DeclareOption{10pt}{\def\nu@book@size{10}%
  \nu@nochange@small@ftnttrue}
\DeclareOption{oneside}{\def\nu@book@side{oneside}}
\DeclareOption{twoside}{\def\nu@book@side{twoside}}
\DeclareOption{draft}{\def\nu@book@final{draft}}
\DeclareOption{final}{\def\nu@book@final{final}}
\DeclareOption{openright}{\def\nu@book@openrght{openright}}
\DeclareOption{openany}{\def\nu@book@openrght{openany}}
\DeclareOption{leqno}{\PassOptionsToClass{book}{\currentoption}}
\DeclareOption{fleqno}{\PassOptionsToClass{book}{\currentoption}}
\DeclareOption{openbib}{\PassOptionsToClass{book}{\currentoption}}
\DeclareOption{openbib}{\def\nu@book@openbib{openbib}}
\ExecuteOptions{12pt,openright,final,oneside,%
   minmargins,copyright,nolot,lof}
\ProcessOptions*
\LoadClass[letterpaper,\nu@book@size,\nu@book@side,%
   \nu@book@final,\nu@book@openrght]{book}
\ifnu@nochange@small@ftnt
  \let\small\normalsize
  \let\footnotesize\normalsize
\fi
\let\nu@cleardoublepage@save\cleardoublepage
\newcommand{\nu@cleardoublepageblank}{%
  \clearpage
  \thispagestyle{empty}%
  \nu@cleardoublepage@save}
\ifnu@blankclear
  \AtBeginDocument{\let\cleardoublepage\nu@cleardoublepageblank}
\fi
\RequirePackage[doublespacing]{setspace}
\let\nu@thebibliography\thebibliography
\let\nu@endthebibliography\endthebibliography
\renewenvironment{thebibliography}%
    {\begin{singlespace}\nu@thebibliography}%
  {\nu@endthebibliography\end{singlespace}}
\let\nu@theindex\theindex
\let\nu@endtheindex\endtheindex
\renewenvironment{theindex}{%
    \addcontentsline{toc}{chapter}%
      {\protect\numberline{}\indexname}%
    \nu@theindex\begin{singlespace}\small}%
  {\end{singlespace}\nu@endtheindex}
\let\nu@quotation\quotation
\let\nu@endquotation\endquotation
\renewenvironment{quotation}%
    {\begin{singlespace}\nu@quotation}%
  {\nu@endquotation\end{singlespace}}
\everydisplay\expandafter{%
  \the\everydisplay
  \def\baselinestretch{1.2}\selectfont}
\smallskipamount=2pt plus 1.5pt minus 1.5pt
\smallskipamount=4pt plus 3pt minus 3pt
\bigskipamount=8pt plus 6pt minus 6pt
\RequirePackage[letterpaper]{geometry}
\ifnu@minmar
\geometry{left=1.5in, top=1in, right=1in, bottom=1in, marginparwidth=.5in}
\else
  \geometry{margin=1.5in,marginparwidth=1in}
\fi

\let\nu@ps@plain@saved\ps@plain
\let\nu@ps@empty@saved\ps@empty
\let\nu@ps@headings@saved\ps@headings
\let\nu@ps@myheadings@saved\ps@myheadings
\def\ps@plain{\geometry{includehead=false,includefoot}%
  \nu@ps@plain@saved}
\def\ps@pempty{\geometry{includehead=false,includefoot=false}%
  \nu@ps@empty@saved}
\def\ps@headings{\geometry{includehead,includefoot=false}%
  \nu@ps@headings@saved}
\def\ps@myheadings{\geometry{includehead,includefoot=false}%
  \nu@ps@myheadings@saved}
\AtBeginDocument{%
  \let\ps@plain\nu@ps@plain@saved
  \let\ps@empty\nu@ps@empty@saved
  \let\ps@headings\nu@ps@headings@saved
  \let\ps@myheadings\nu@ps@myheadings@saved
  \let\nu@ps@plain\@undefined
  \let\nu@ps@empty\@undefined
  \let\nu@ps@headings\@undefined
  \let\nu@ps@myheadings\@undefined}
\newcommand{\thesisfront}[1][]{%
  \@for\nu@option:=#1\do{%
     \@ifundefined{nu@tf@\nu@option}{%
       \@latex@error{\@backslashchar thesisfront: option `\nu@option'
       unknown}%
       {The option you have specified is unknown.  Check the spelling
and \MessageBreak consult the documentation for the\MessageBreak
brandeis-dissertation class.}}%
     {\@nameuse{nu@tf@\nu@option}}}%
  \frontmatter
  \bgroup
  \pagestyle{empty}
  \thesistitlepage\cleardoublepage
  \if@nu@onlinesubmission{\signaturepage}{\signaturepage*}%
  \cleardoublepage
  \if@nu@crpage{\copyrightpage{\@author}{\@graduationyear}%
      \cleardoublepage}%
  \ifx\@dedication\@empty\else
     \dedicationpage{\@dedication}%
     \cleardoublepage
  \fi
  \cleardoublepage
  \egroup
  \nu@optpage*{Acknowledgments}{\@acknowledgments}%
  \cleardoublepage
  \nu@abstract{\@thesisabstract}%
  \cleardoublepage
  \nu@optpage{Preface}{\@preface}%
  \cleardoublepage
  \renewcommand{\contentsname}{Table of Contents}
  \tableofcontents
  \cleardoublepage
  \if@nu@lot{\listoftables\cleardoublepage}%
  \if@nu@lof{\listoffigures\cleardoublepage}%
  \mainmatter}
\let\if@nu@onlinesubmission\@firstoftwo
\newcommand{\nu@tf@onlinesubmission}{%
  \let\if@nu@onlinesubmission\@firstoftwo}
\newcommand{\nu@tf@papersubmission}{%
  \let\if@nu@onlinesubmission\@secondoftwo}
\let\if@nu@crpage\@iden
\newcommand{\nu@tf@copyrightpage}{\let\if@nu@crpage\@iden}
\newcommand{\nu@tf@nocopyrightpage}{\let\if@nu@crpage\@gobble}
\let\if@nu@lot\@gobble
\newcommand{\nu@tf@lot}{\let\if@nu@lot\@iden}
\newcommand{\nu@tf@nolot}{\let\if@nu@lot\@gobble}
\let\if@nu@lof\@gobble
\newcommand{\nu@tf@lof}{\let\if@nu@lof\@iden}
\newcommand{\nu@tf@nolof}{\let\if@nu@lof\@gobble}
\setcounter{tocdepth}{1}
\let\nu@org@tableofcontents\tableofcontents
\renewcommand{\tableofcontents}{%
  \begin{singlespace}
    \nu@org@tableofcontents
  \end{singlespace}}
\let\nu@org@listoftables\listoftables
\renewcommand{\listoftables}{%
  \begin{singlespace}
    \nu@org@listoftables
 \end{singlespace}}
\let\nu@org@listoffigures\listoffigures
\renewcommand{\listoffigures}{%
  \begin{singlespace}
    \nu@org@listoffigures
  \end{singlespace}}
\renewcommand\mainmatter{%
  \clearpage
  \@mainmattertrue
  \pagenumbering{arabic}
  }
\gdef\@acknowledgments{}
\gdef\@advisor{}
\gdef\@dean{}
\gdef\@dedication{}
\gdef\@department{}
\gdef\@graduationmonth{May}
\xdef\@graduationyear{\the\year}
\gdef\@othercopyright{}
\gdef\@preface{}
\gdef\@thesisabstract{}
\newcommand{\acknowledgments}[1]{\gdef\@acknowledgments{#1}}
\newcommand{\advisor}[1]{\gdef\@advisor{#1}}
\newcommand{\dean}[1]{\gdef\@dean{#1}}
\newcommand{\dedication}[1]{\gdef\@dedication{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\graduationmonth}[1]{\gdef\@graduationmonth{#1}}
\newcommand{\graduationyear}[1]{\gdef\@graduationyear{#1}}
\newcommand{\othercopyright}[1]{\gdef\@othercopyright{#1}}
\newcommand{\preface}[1]{\gdef\@preface{#1}}
\newcommand{\thesisabstract}[1]{\gdef\@thesisabstract{#1}}
\newcommand{\reader}[1]{%
  \expandafter\gdef
    \expandafter\@committee
       \expandafter{\@committee\do{#1}}}
\gdef\@committee{}
\newcommand{\thesistitlepage}{
  \thispagestyle{empty}%
  \begin{center}
    \vspace*{.25in}%
    {\baselineskip=.8\baselineskip \@title\\}
    \vspace*{.25in}
    by\\
    \@author\\
    \vspace*{.5in}%
    A DISSERTATION\\
    \vspace*{.25in}%
    Presented to the Faculty of\\
    The Graduate College at the University of Nebraska\\
    In Partial Fulfillment of the Requirements\\
    For the Degree of Doctor of Philosophy\\
    \vspace*{.5in}
    Major: History\\
    \vspace*{.5in}
    Under the Supervision of Professor \@advisor\\
    \vspace*{.5in}
    Lincoln, Nebraska\\
    \vspace*{.5in}
    \@graduationmonth, \@graduationyear\\
  \end{center}%
  \clearpage}
\newcommand{\copyrightpage}[2]{%
  \thispagestyle{empty}%
  \begin{center}
    \vspace*{2.5in}
     \copyright ~Copyright by \\
    \vspace*{.05in}
    #1 \\
    \vspace*{.05in}
    #2
  \end{center}
  \vspace{0pt}\vfill%
  \begin{singlespace}
  \begin{raggedright}
    \small
    \@othercopyright
  \end{raggedright}
  \end{singlespace}
  \clearpage}
\newcommand{\dedicationpage}[1]{%
  \thispagestyle{empty}%
  \vspace*{2.5in}%
  \begin{center}%
    #1
  \end{center}%
  \clearpage}
\newenvironment{abstract}{%
  \pagestyle{empty}
  %\addcontentsline{toc}{chapter}{Abstract}
  \begin{onehalfspacing}
    \begin{center}
      {\@title \\}%
      \vspace*{.1in}%
      \@author, Ph.D.\\
      \vspace*{.1in}%
      University of Nebraska, 2016 \\
    \end{center}
    \begin{flushleft}
      Advisor: \@advisor
    \end{flushleft}
    \end{onehalfspacing}%
    \begin{doublespace}
    \noindent}%
  {\end{doublespace}%
  \clearpage}
\newcommand{\thesisabstracttwo}[1]{%
 \begin{abstract}#1\end{abstract}}
\let\if@nu@sig@lines\@secondoftwo
\newcommand{\signaturepage}{%
  \@ifstar{\let\if@nu@sig@lines\@firstoftwo\nu@sig@page}%
    {\let\if@nu@sig@lines\@secondoftwo\nu@sig@page}}
\newcommand{\nu@sig@page}{%
    \nu@upd@signline@lngth{\@advisor, Chair}
    \let\do\nu@upd@signline@lngth\@committee
    \thispagestyle{empty}%
    \begin{flushleft}%
      \vspace*{.15in}%
      The	signed	version	of	this	form	is	on	file	in	the	Graduate	
      School	of	Arts	and	Sciences.

      \vspace{0.5in}

      This dissertation, directed and approved by \@author's
      committee, has been accepted and approved by the Graduate
      Faculty of University of Nebraska-Lincoln in partial fulfillment of the
      requirements for the degree of:
      \vspace*{0.25in}%
      \begin{flushright}%
        \centerline{\bfseries DOCTOR OF PHILOSOPHY}%
        \par
        \parbox{3.6in}{%
          \vspace{.8in}%
          \if@nu@sig@lines{\nu@signline{2.9in}}{}%
          \@dean, Dean\\[-0.1in]Graduate School of Arts and Sciences}%
      \end{flushright}%
      \vspace*{0.4in}%
      Dissertation Committee:
      \par
      \nu@sig@page@item{\@advisor, Chair}%
      {\let\do\nu@sig@page@item\@committee}%
    \end{flushleft}
    \clearpage}
\newcommand{\nu@sig@page@item}[1]{%
  \if@nu@sig@lines{%
     \penalty10000\vskip.6in minus 1in%
     \nu@signline{\nu@comm@signline@lngth}}%
   {\par}%
  #1}
\newcommand{\nu@signline}[1]{%
  \rule[.5\baselineskip]{#1}{0.4pt}\hskip-#1\relax\ignorespaces}
\newlength{\nu@comm@signline@lngth}
\setlength{\nu@comm@signline@lngth}{2.5in}
\newcommand{\nu@upd@signline@lngth}[1]{%
  {\setbox0=\hbox{#1}%
  \ifdim \wd0>\nu@comm@signline@lngth
    \global\nu@comm@signline@lngth=\wd0
  \fi}}
\newenvironment{optionalpage}[1]{%
  \chapter*{#1}}%
  {\clearpage}
\newenvironment{optionalpage*}[1]{%
  \chapter*{#1}}%
  {\clearpage}
\newcommand{\nu@optpage}{%
  \@ifstar{\nu@optpage@i{optionalpage*}}{\nu@optpage@i{optionalpage}}}
\newcommand{\nu@optpage@i}[3]{%
  \ifx\@empty#3
     \expandafter\@gobble
  \else
     \expandafter\@iden
  \fi
  {\begin{#1}{#2}#3\end{#1}}}

% Fix page numbers to upper right
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhead[LE]{}
\fancyhead[RO]{}
\fancyhead[RE]{}
\fancyhead[LO]{}
\fancyfoot[C]{}
\renewcommand{\headrulewidth}{0pt}
\rhead{\thepage}

\fancypagestyle{plain}{%
  \fancyhf{}
  \rhead{\thepage}
}

\endinput
%%
%% End of file `brandeis-dissertation.cls'.
