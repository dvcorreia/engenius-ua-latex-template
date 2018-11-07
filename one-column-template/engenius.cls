% Latex Document Class used exclusively by Engenius UA 
% (c) 2018, Diogo Correia and João Santos, MIT Licensed
% Original Repository: https://github.com/dvcorreia/engenius-ua-latex-template
%

% Define Document preset and configurations ---------------------
\LoadClass[10pt]{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{engenius}[2018/11/07 Engenius Latex Custom Class]

% Packages ------------------------------------------------------

\RequirePackage{hyperref}
\RequirePackage{blindtext}
\RequirePackage{float}

% Page Layout
\RequirePackage{titlesec}

% Fonts and Language

% Output Font Encoding, add support to accented chars
\RequirePackage[T1]{fontenc}

% Allow User to type accented char directly from keyboard
\RequirePackage[utf8]{inputenc}

% Postscript Version of Latin Modern Default Font
\RequirePackage{kpfonts}

% Document Margins
\RequirePackage[left=0.75in,right=0.75in,top=0.75in,bottom=1in]{geometry}

% Header/Footers
\RequirePackage{fancyhdr}

% Column Uttility
\RequirePackage{multicol}
\RequirePackage{ragged2e}
\RequirePackage{datetime} \yyyymmdddate
\RequirePackage[nottoc]{tocbibind}

% Page Layout Definition -----------------------------------------
\titleformat{\section}{\Large\bfseries}{\thesection}{0.75em}{}%[\titlerule]
\titleformat{\subsection}{\large\bfseries}{\thesubsection}{0.5em}{}
\titleformat{\subsubsection}{\normalsize\bfseries}{\thesubsubsection}{0.5em}{}

% Department Identification Colors

\RequirePackage{color}

\def\dep@ec{\def\dep@red{50}\def\dep@green{115}\def\dep@blue{220}} % blue
\def\dep@epower{\def\dep@red{255}\def\dep@green{153}\def\dep@blue{0}} % orange
\def\dep@business{\def\dep@red{255}\def\dep@green{15}\def\dep@blue{15}} % red
\def\dep@cpower{\def\dep@red{35}\def\dep@green{209}\def\dep@blue{96}} % green
\def\dep@svd{\def\dep@red{184}\def\dep@green{107}\def\dep@blue{255}} % purple
\def\dep@chassis{\def\dep@red{255}\def\dep@green{221}\def\dep@blue{87}} % yellow
\def\dep@default{\def\dep@red{51}\def\dep@green{51}\def\dep@blue{255}} % blue

% Declaration Options ---------------------------------------------
\DeclareOption{ec}{\dep@ec
  \let\dep@redT=\dep@red
  \let\dep@greenT=\dep@green
  \let\dep@blueT=\dep@blue
  \def\dep@textA{Department of}
  \def\dep@textB{Electronics and Communications}}
  
\DeclareOption{epower}{\dep@epower
  \let\dep@redT=\dep@red
  \let\dep@greenT=\dep@green
  \let\dep@blueT=\dep@blue
  \def\dep@textA{Department of}
  \def\dep@textB{Electric Powertrain}}
  
\DeclareOption{business}{\dep@business
  \let\dep@redT=\dep@red
  \let\dep@greenT=\dep@green
  \let\dep@blueT=\dep@blue
  \def\dep@textA{Department of}
  \def\dep@textB{Business}}
  
\DeclareOption{cpower}{\dep@cpower
  \let\dep@redT=\dep@red
  \let\dep@greenT=\dep@green
  \let\dep@blueT=\dep@blue
  \def\dep@textA{Department of}
  \def\dep@textB{Combustion Powertrain}}
  
\DeclareOption{svd}{\dep@svd
  \let\dep@redT=\dep@red
  \let\dep@greenT=\dep@green
  \let\dep@blueT=\dep@blue
  \def\dep@textA{Department of}
  \def\dep@textB{Suspension/Dynamics}}
  
\DeclareOption{chassis}{\dep@chassis
  \let\dep@redT=\dep@red
  \let\dep@greenT=\dep@green
  \let\dep@blueT=\dep@blue
  \def\dep@textA{Department of}
  \def\dep@textB{Chassis}}
  
\DeclareOption{default}{\dep@default
  \let\dep@redT=\dep@red
  \let\dep@greenT=\dep@green
  \let\dep@blueT=\dep@blue
  \def\dep@textA{Choose your}
  \def\dep@textB{Department!}}

% Default
\ExecuteOptions{default}

\ProcessOptions

% Departments definitions
\def\depofec{Electronics/Communications}
\def\depofeccolor{\dep@ec\textcolor[RGB]{\dep@red,\dep@green,\dep@blue}{\vrule width 14mm height 1.000mm depth 0mm}}

\def\depofepower{Electric Powertrain}
\def\depofepowercolor{\dep@epower\textcolor[RGB]{\dep@red,\dep@green,\dep@blue}{\vrule width 14mm height 1.000mm depth 0mm}}

\def\depofbusiness{Business}
\def\depofbusinesscolor{\dep@business\textcolor[RGB]{\dep@red,\dep@green,\dep@blue}{\vrule width 14mm height 1.000mm depth 0mm}}

\def\depofcpower{Combustion Powertrain}
\def\depofcpowercolor{\dep@cpower\textcolor[RGB]{\dep@red,\dep@green,\dep@blue}{\vrule width 14mm height 1.000mm depth 0mm}}

\def\depofsvd{Suspension/Dynamics}
\def\depofsvdcolor{\dep@svd\textcolor[RGB]{\dep@red,\dep@green,\dep@blue}{\vrule width 14mm height 1.000mm depth 0mm}}


\def\depofchassis{Chassis}
\def\depofchassiscolor{\dep@chassis\textcolor[RGB]{\dep@red,\dep@green,\dep@blue}{\vrule width 14mm height 1.000mm depth 0mm}}

% Commands and Variables -----------------------------------------
\def\ualogo{src/uaLogo.png}
\def\engeniuslogo{src/engeniusLogo.png}
\def\UA{University of Aveiro}

\def\mydate{\leavevmode\hbox{\twodigits\day-\twodigits\month-\the\year}}
\def\twodigits#1{\ifnum#1<10 0\fi\the#1}

\newcommand{\email}[1]{\href{mailto:#1}{#1}}

\bibliographystyle{unsrt}

% Revisions --------------------------------------
\newcommand{\revisions}{\stepcounter{section}\section*{Revisions}}
\newcommand{\revisionof}[5]{\large\textbf{#1},\\\normalsize Dep. #2,\\#3,\\ \small version #4, #5\par}

% Code snippets ----------------------------------------------------

\RequirePackage{minted}
\RequirePackage[skins,listings]{tcolorbox}

\newtcolorbox{codebox}[1]{
colback=white,colframe=black,fonttitle=\sffamily\bfseries\normalsize,
title=#1}

\setminted{fontsize=\footnotesize,breaklines,breakanywhere,fontfamily=helvetica}

% Page Header and Footer -----------------------------------------
\RequirePackage{graphicx}
\RequirePackage{scalerel}

% Define Header and Footer Style --------------------------
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{
    \includegraphics[height=0.25in]{\engeniuslogo}\space\space\space
    \includegraphics[height=0.25in]{\ualogo}
}
\fancyhead[R]{\large\dep@textA\space\dep@textB}
\fancyfoot[R]{\thepage}
\renewcommand{\footrulewidth}{0.5pt}

% Maketitle renewcommand -----------------------------------------

\newcommand{\titletwo}[1]{\gdef\@titletwo{#1}}
\newcommand{\version}[1]{\gdef\@version{#1}}

\renewcommand{\maketitle}{

    % Bar
    \smash{\rlap{\textcolor[RGB]{\dep@redT,\dep@greenT,\dep@blueT}{\vrule width \textwidth height 30.000mm depth -20mm}}}
    
    % Title
    \begin{multicols}{2}
    \begin{FlushLeft}
    {\LARGE \textbf{\@title} \\ \Large\textbf{\@titletwo}\columnbreak}
    \end{FlushLeft}
    
    % Date
    \begin{FlushRight}
    {\LARGE \mydate\\\small version \@version\par}
    \end{FlushRight}
    \end{multicols}

    % Authors
    \begin{center}
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}
    \end{center}

    \noindent\hrulefill
    \vspace*{1\baselineskip}
}




