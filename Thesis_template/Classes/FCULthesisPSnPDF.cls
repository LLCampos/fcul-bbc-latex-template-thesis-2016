% FCULthesis v1.0
% By Bruno Martins <bmartins@xldb.di.fc.ul.pt> and Rui Lopes <rlopes@di.fc.ul.pt>
% Adapted for BBC by Andre Lamurias <alamurias@lasige.di.fc.ul.pt>, 2014
% Based on CUEDthesis v1.0
% By Harish Bhanderi <harish.bhanderi@cantab.net
% Version 1.0 released 15/07/2002
%-------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Classes/FCULthesisPSnPDF}[2006/06/02 v1.0 FCUL thesis class]
%-------------------------- initial code -----------------------

%If you want to use a Report style document then uncomment the following 3 lines and comment the below 8 book style lines:
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
%\ProcessOptions\relax
%\LoadClass[a4paper]{report}
%\ifx\pdfoutput\undefined
%   \LoadClass[dvips, a4paper]{report}
%\else
%   \LoadClass[pdftex, a4paper]{report}
%\fi

\newif\if@thtypephd
\newif\if@thtypemsc
\newif\if@thtypequalify
\newif\if@thtypecepei
\newif\if@thdifcul
\newif\if@thbc
\newif\if@thbio
\newif\if@thcsc
\@thtypephdfalse
\@thtypemscfalse
\@thtypequalifyfalse
\@thtypecepeifalse
\@thdifculfalse
\@thbcfalse
\@thbiofalse
\@thcscfalse
\DeclareOption{msc}{ \@thtypemsctrue }
\DeclareOption{difcul}{ \@thdifcultrue }
\DeclareOption{bc}{ \@thbctrue }
\DeclareOption{bio}{ \@thbiotrue }

%If you want to use a Book style document then uncomment the following 3 lines and comment the above 8 report style lines:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\ifx\pdfoutput\undefined
   \LoadClass[dvips, a4paper]{book}
\else
   \LoadClass[pdftex, a4paper]{book}
\fi

% turn of those nasty overfull and underfull hboxes
\hbadness=10000
\hfuzz=50pt

\usepackage{amssymb}
\usepackage{graphics}
\usepackage{eucal}
\usepackage[english]{babel}
\usepackage[usenames, dvipsnames]{color}
\usepackage[perpage]{footmisc}
\usepackage[round, sort, numbers, authoryear]{natbib}
\usepackage{ifthen}
\usepackage{tabularx}
\usepackage{latexsym}
\usepackage{amsmath}
%\usepackage{mathtext}
\usepackage{url}
\usepackage{xspace} 
\usepackage{setspace}
\usepackage{nomencl}
\usepackage{listings}
%\usepackage[latin1]{inputenc}
\usepackage{eurosym}
\usepackage{textcomp}
\usepackage{subfigure}
\usepackage{fancyhdr}
%\usepackage{palatino} % uncomment this line in order to use the Adobe Palatino fonts designed by Hermann Zapf
%\usepackage{StyleFiles/epigraph}
\usepackage{algorithm}
\usepackage{algorithmic}
\usepackage{watermark}
\usepackage{ifpdf} 

%Bibliography and Code Listings
%uncomment next lines to change bibliography name to references and Listings to Code Listings
\let\oldbibliographystyle\bibliographystyle
\renewcommand{\bibliographystyle}[1]{\renewcommand{\bibname}{References}\oldbibliographystyle{#1}}
\renewcommand\lstlistlistingname{\textbf{Code Listings}}

% Nomenclature
\makeglossary
\renewcommand\nomgroup[1]{%
  \ifthenelse{\equal{#1}{A}}{%
   \item[\textbf{Roman Symbols}] }{%             A - Roman
    \ifthenelse{\equal{#1}{G}}{%
     \item[\textbf{Greek Symbols}]}{%             G - Greek
      \ifthenelse{\equal{#1}{R}}{%
        \item[\textbf{Superscripts}]}{%              R - Superscripts
          \ifthenelse{\equal{#1}{S}}{%
           \item[\textbf{Subscripts}]}{{%             S - Subscripts
	    \ifthenelse{\equal{#1}{X}}{%
	     \item[\textbf{Other Symbols}]}{{%    X - Other Symbols
	    \ifthenelse{\equal{#1}{Z}}{%
	     \item[\textbf{Acronyms}]}%              Z - Acronyms
              			{{}}}}}}}}}}

\newif \ifpdf
    \ifx \pdfoutput \undefined
        % for running latex
        \pdffalse
    \else
        % for running pdflatex
        \pdfoutput = 1    % positive value for a PDF output
                          % otherwise a DVI
        \pdftrue
\fi

\ifpdf
%-->
%--> Google.com search "hyperref options"
%--> 
%--> http://www.ai.mit.edu/lab/sysadmin/latex/documentation/latex/hyperref/manual.pdf
%--> http://www.chemie.unibas.ch/~vogtp/LaTeX2PDFLaTeX.pdf 
%--> http://www.uni-giessen.de/partosch/eurotex99/ oberdiek/print/sli4a4col.pdf
%--> http://me.in-berlin.de/~miwie/tex-refs/html/latex-packages.html
%-->
\usepackage[pdftex,plainpages=false,pdfpagelabels,pdfpagelayout=SinglePage,bookmarks,bookmarksopen=true,bookmarksnumbered=true,breaklinks=true,linktocpage,pagebackref,colorlinks=true,linkcolor=OliveGreen,urlcolor=Black,citecolor=Blue,anchorcolor=green,hyperindex=true,hyperfigures]{hyperref} 

    \DeclareGraphicsExtensions{.png, .jpg, .pdf}
    \usepackage[pdftex]{graphicx}
    \pdfcompresslevel=9
    \graphicspath{{ThesisFigs/PNG/}{ThesisFigs/PDF/}{ThesisFigs/}}
\else
    \usepackage[ dvips, 
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref,
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = blue,
                 anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref}

    \DeclareGraphicsExtensions{.eps, .ps}
    \usepackage{epsfig}
    \usepackage{graphicx}
    \graphicspath{{ThesisFigs/EPS/}{ThesisFigs/}}
\fi

%define the page size including an offset for binding
%\setlength{\topmargin}{0.0in}
%\setlength{\oddsidemargin}{0in}
%\setlength{\evensidemargin}{0in}
%\setlength{\textheight}{700pt}
%\setlength{\textwidth}{500pt}

%A4 settings
\ifpdf
   \pdfpageheight=297mm
   \pdfpagewidth=210mm
\else
   \setlength{\paperheight}{297mm}
   \setlength{\paperwidth}{210mm}
\fi

\setlength{\hoffset}{0.00cm}
\setlength{\voffset}{0.00cm}

\setlength{\evensidemargin}{0cm}
\setlength{\oddsidemargin}{1cm}
\setlength{\topmargin}{1mm}
\setlength{\headheight}{1.36cm}
\setlength{\headsep}{1.00cm}
\setlength{\textheight}{20.84cm}
\setlength{\textwidth}{14.5cm}
\setlength{\marginparsep}{1mm}
\setlength{\marginparwidth}{3cm}
\setlength{\footskip}{2.36cm}

\newcommand{\submittedtext}{{Uma tese submetida para o grau de}}
%
%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degreename#1{\gdef\@degreename{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The full (unabbreviated) name of the thesis
\def\thesisname#1{\gdef\@thesisname{#1}}
% Speciality
\def\speciality#1{\gdef\@speciality{#1}}
% The name of your college or department(eg. Trinity, Pembroke, Maths, Physics)
\def\college#1{\gdef\@college{#1}}
% The name of your college or department(eg. Trinity, Pembroke, Maths, Physics)
\def\department#1{\gdef\@deptartment{#1}}
% The name of your University
\def\university#1{\gdef\@university{#1}}
% Defining the crest
\def\crest#1{\gdef\@crest{#1}}
\def\crestsmall#1{\gdef\@crestsmall{#1}}
% Defining the thesis keywords
\def\keywords#1{\gdef\@thkeywords{#1}}
% Defining the thesis keywords (portuguese)
\def\keywordspt#1{\gdef\@thkeywordspt{#1}}


% Defining a subsubsubsection environment
\def\subsubsubsection#1{\paragraph{#1}~\\} 

% These macros define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}{
\begin{alwayssingle}
  \pagestyle{empty}
  \cleardoublepage
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{quote} \begin{flushright}}
{\end{flushright} \end{quote} \end{alwayssingle}
}

% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}{
\begin{alwayssingle}
\pagestyle{empty}
\cleardoublepage
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}
}

% DISCLAIMER
%
% The disclaimer environment uses the footnote font size. The disclaimer message
% itself appears in a quote environment, i.e. tabbed in at both sides, and
% on its own page.
                                                                                    
\newenvironment{disclaimer}{
\begin{alwayssingle}
\pagestyle{empty}
\cleardoublepage
\vspace{0.5cm}
\begin{quote}\footnotesize}
{\normalsize \end{quote}\end{alwayssingle}
}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}{
\begin{alwayssingle}
\pagestyle{empty}
\cleardoublepage
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}\begin{quote}}
{\end{quote}\end{alwayssingle}
}

%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.
% 
%There is also a correspondent environment for an abstract in portuguese
%
\newenvironment{abstracts}{
\begin{alwayssingle}
\pagestyle{empty} \cleardoublepage
  \begin{center}
  \vspace*{0.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\ifthenelse{\isundefined{\@thkeywords}}{}{\end{quote} \vspace{0.2cm} \begin{quote}{\bfseries Keywords: }{\@thkeywords}}\end{quote}\end{alwayssingle}
}
\newenvironment{abstractspt}{
\begin{alwayssingle}
\pagestyle{empty} \cleardoublepage
  \begin{center}
  \vspace*{0.5cm}
  {\Large \bfseries  Resumo}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\ifthenelse{\isundefined{\@thkeywordspt}}{}{\end{quote} \vspace{0.2cm} \begin{quote}{\bfseries Palavras Chave: }{\@thkeywordspt}}\end{quote}\end{alwayssingle}
}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.
% 
%There is also a correspondent environment for an abstract in portuguese
%
\newenvironment{abstractslong}{
\begin{alwayssingle}
\pagestyle{empty} \cleardoublepage
%\addcontentsline{toc}{chapter}{Abstract} %adds Abstract to contents page
  \begin{center}
  \vspace*{0.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.3cm} \begin{quote}}
{\ifthenelse{\isundefined{\@thkeywords}}{}{\end{quote} \vspace{0.2cm} \begin{quote}{\textbf{Keywords: }}{\@thkeywords}}\end{quote}\end{alwayssingle}
}
\newenvironment{abstractslongpt}{
\begin{alwayssingle}
\pagestyle{empty} \cleardoublepage
  \begin{center}
  \vspace*{0.5cm}
  {\Large \bfseries  Resumo Alargado}
  \end{center}
  \vspace{0.3cm} \begin{quote}}
%{\ifthenelse{\isundefined{\@thkeywordspt}}{}{\end{quote} \vspace{0.2cm} \begin{quote}{\textbf{Palavras Chave: }}{\@thkeywordspt}}
{\end{quote}\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately
%There is also a correspondent environment for an abstract in portuguese
%
\newenvironment{abstractseparate}{
\begin{alwayssingle}
\pagestyle{empty} \cleardoublepage
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@collegeordept} \par}
    {{\@university} \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\ifthenelse{\isundefined{\@thkeywords}}{}{\linebreak ~ \linebreak {\textbf{Keywords: }}{\@thkeywords}}
\end{alwayssingle}}

%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}
{\setcounter{page}{1}
  \renewcommand{\thepage}{\roman{page}}}
{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}


\if@thtypemsc
  \degreename{MESTRADO}
  \degree{MESTRE}
  \thesisname{DISSERTA\c{C}\~{A}O}
\fi

\if@thdifcul
  \college{\href{http://www.fc.ul.pt}{FACULDADE DE CI\^{E}NCIAS}}
  \department{\href{http://www.di.fc.ul.pt}{DEPARTAMENTO DE INFORM\'{A}TICA}}
  \university{\href{http://www.ul.pt}{UNIVERSIDADE DE LISBOA}}
  \crest{\includegraphics[width=10cm]{logo_fcul}}
  \crestsmall{\includegraphics[width=1cm]{ULISBOA_VERTICAL_RGB}}
\fi

\if@thbc
  \speciality{BIOLOGIA COMPUTACIONAL}
\fi

\if@thbio
  \speciality{BIOINFORM\'{A}TICA}
\fi


%\if@thtypephd
% \newcommand{\thintjuri}[2]{\newcommand{\@thintjuriA}{#1} \newcommand{\@thintjuriB}{#2}} % % juri members coming from DI
% \newcommand{\thextjuri}[2]{\newcommand{\@thextjuriA}{#1} \newcommand{\@thextjuriB}{#2}} % % external juri members
%\else
% \newcommand{\thintjuri}[2]{\newcommand{\@thintjuriA}{#1} \newcommand{\@thintjuriB}{#2}} % juri members coming from DI
% \newcommand{\thextjuri}[1]{\newcommand{\@thextjuri}{#1}} % external juri member
%\fi


%define title page layout
% cover lengths
\newlength{\@thtopadj}         % adjustment to top of page
\newlength{\@thlogoskip}       % space after logo
\newlength{\@thtitleskipcover} % space after title cover
\newlength{\@thtitleskipint}   % space after title interior page
\newlength{\@thauthskip}       % space after author name
\newlength{\@thsubjskip}       % space after thesis name
\newlength{\@thadvskip}        % space after the date in the interior page
\newlength{\@thjuritab}        % indent to give to juri's names
\newlength{\@thjuriskip}       % space after juri names
\newlength{\@thlogowidth}      % width of fcul logo (height is adjusted automatically)
% internal cover lengths
\newlength{\@thicovtopskip}    % adjustment to top of page
\newlength{\@thicovtitleskip}  % space after title
\newlength{\@thicovauthskip}   % space after author name
\newlength{\@thicovdegskip}    % space after degree
\newlength{\@thicovfcskip}     % space in between fcul/di name
\newlength{\@thkeywordskip}    % gap between abstract text and keywords
% length settings
\setlength{\@thtopadj}{-3.5cm}
\setlength{\@thlogoskip}{1.0cm}
\setlength{\@thtitleskipcover}{1.2cm}
\setlength{\@thtitleskipint}{2.1cm}
\setlength{\@thauthskip}{0.5cm}
\setlength{\@thsubjskip}{0.3cm}
\setlength{\@thadvskip}{1.5cm}
\setlength{\@thicovtopskip}{1.3cm}
\setlength{\@thicovtitleskip}{2.4cm}
\setlength{\@thicovauthskip}{1.4cm}
\setlength{\@thicovdegskip}{1cm}
\setlength{\@thicovfcskip}{0.3cm}
\setlength{\@thlogowidth}{130mm}
\setlength{\@thkeywordskip}{0.3cm}
\setlength{\@thjuritab}{1.1cm}
\if@thtypephd
    \setlength{\@thjuriskip}{1.4cm}
\else
    \setlength{\@thjuriskip}{2cm}
\fi
\setlength{\@thicovtopskip}{1.8cm}
\setlength{\@thicovtitleskip}{2.4cm}
\setlength{\@thicovauthskip}{1.4cm}
\setlength{\@thicovdegskip}{1cm}
\setlength{\@thicovfcskip}{0.3cm}
\setlength{\@thlogowidth}{130mm}
\setlength{\@thkeywordskip}{0.3cm}
% the command
\renewcommand{\maketitle}{
{
\if@thdifcul
  \pagestyle{empty}
  \vspace*{\@thtopadj}
\begin{center}
\centerline{{\@university}}
\centerline{{\@college}}
\centerline{{\@deptartment}}
\end{center}
  \centerline{{\@crest}}
  \begin{center}
   % \vspace{\@thlogoskip}
    {\Large
       \bf{\@title}
    }
    \vskip \@thtitleskipcover
    {\large
      \if@thauthemail
        \bf{\href{mailto:\@thauthemail}{\@author}}
      \else
        \bf{\@author}
      \fi
    }
    \vskip \@thauthskip
    {
\@thesisname

\@degreename\ EM BIOINFORM\'{A}TICA E BIOLOGIA COMPUTACIONAL  

    \if@thtypemsc
ESPECIALIDADE EM \@speciality
     \fi
     
  \vspace{\@thsubjskip}
  {Disserta\c{c}\~{a}o orientada por:\\ Prof. Doutor \@thadv}\\
  \if@coadv{Dr. \@thcoadv} \fi

    }

    \vspace{\@thsubjskip}

    {\@degreedate}
  \end{center}
\cleardoublepage
% end of the exterior thesis cover
% To produce the interior thesis cover
%\begin{center}
%\centerline{{\@university}}
%\centerline{{\@college}}
%\centerline{{\@deptartment}}
%\end{center}
%  \centerline{{\@crest}}
%  \begin{center}
%    %\vspace{\@thlogoskip}
%    {\Large
%       \bf{\@title}
%    }
%    \vskip \@thtitleskipcover
%    {\large
%      \if@thauthemail
%        \bf{\href{mailto:\@thauthemail}{\@author}}
%      \else
%        \bf{\@author}
%      \fi
%    }
%    \vskip \@thauthskip
%    {
%    }
%    \vspace{\@thsubjskip}
%    \@thesisname
%    
%    \@degreename\ EM BIOINFORM\'{A}TICA E BIOLOGIA COMPUTACIONAL  
%    
%        \if@thtypemsc
%    ESPECIALIDADE EM \@speciality
%         \fi
%    
%    
%        \vspace{\@thsubjskip}
%  {Disserta\c{c}\~{a}o orientada por:\\ Prof. Doutor \@thadv}\\
%  \if@coadv{Dr. \@thcoadv} \fi
%  
%    \vspace{\@thsubjskip}
%      
%    {\@degreedate}
%  \end{center}
%  \cleardoublepage
\else
\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
  \begin{center}
    { \Huge {\bfseries {\@title}} \par}
{\large \vspace*{35mm} {{\@crest} \par} \vspace*{25mm}}
    {{\Large \@author} \par}
{\large \vspace*{1ex} {{\@college} \par} 
        \vspace*{1ex} {{\@deptartment} \par}
        \vspace*{1ex} {{\@university} \par}
        \vspace*{25mm}{{\it {\submittedtext}~{\@degree}} \par}
        \vspace*{2ex} {\@degreedate}
}
  \end{center}
  \null\vfill
\end{alwayssingle}
\fi
}
}

% if there is a co-advisor
\newif\if@coadv
\@coadvfalse  % defaults to no coadvisor

% make room for the advisor
% the student's advisor
\newcommand{\thesisadvisor}[2]{
  \newcommand{\@thadv}{#1}
  \newcommand{\@thadvsex}{#2}
  \ifthenelse{\equal{#2}{2}} {
      \newcommand{\@theadvisetxt}{orientada pela Prof.$^{\underline{a}}$ Doutora}
    } {
      \newcommand{\@theadvisetxt}{orientada pelo Prof. Doutor}
    }
}   % the student's advisor

% make room for the co-advisor
% the student's co-advisor
\newcommand{\thesiscoadvisor}[2]{
  \newcommand{\@thcoadv}{#1}
  \newcommand{\@thcoadvsex}{#2}
  \ifthenelse{\equal{#2}{2}} {
      \newcommand{\@thecoadvisetxt}{e pela Prof.$^{\underline{a}}$ Doutora}
    } {
      \newcommand{\@thecoadvisetxt}{e pelo Prof. Doutor}
    }
  \@coadvtrue
  \setlength{\@thadvskip}{0.5cm}
}

\newif\if@thauthemail
\@thauthemailfalse

\newcommand{\authemail}[1]{
  \newcommand{\@thauthemail}{#1}
  \@thauthemailtrue
}

\let\@altdoc=\document
\let\end@altdoc=\enddocument
\renewenvironment{document}{
\begin{@altdoc}
\renewcommand\baselinestretch{1.2}
\baselineskip=18pt plus1pt
}{\end{@altdoc}}

\newcommand{\chapterpath}[1]{
\ifpdf
    \graphicspath{{#1/Figs/PNG/}{#1/Figs/PDF/}{#1/Figs/}{#1/#1Figs/}{#1}}
\else
    \graphicspath{{#1/Figs/EPS/}{#1/Figs/}{#1/#1Figs/}{#1}}
\fi
}

\newcommand{\includex}[2]{
  \chapterpath{#1}
  \include{#1/#2}
}

\newcommand{\inputx}[2]{
  \chapterpath{#1}
  \input{#1/#2}
}

\ifx\printglossary\undefined
	\newcommand{\printglossary}[0]{\printnomenclature}
\fi

%
% epigraphs on \part pages
%
\let\@epipart\@endpart
\renewcommand{\@endpart}{\thispagestyle{epigraph}\@epipart}

\newcommand{\epipart}[2]{
  \epigraphhead{
    \epigraph{\emph{#1}}{#2}
  }
  \thispagestyle{empty}
}

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\thechapter. #1 }}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhf{}
\fancyhead[RO]{\bfseries\rightmark}
\fancyhead[LE]{\bfseries\leftmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}

\def\cleardoublepage{\clearpage\if@twoside%
  \ifodd\c@page\else\hbox{}\thispagestyle{empty}\newpage%
  \if@twocolumn\hbox{}\newpage\fi\fi\fi}
