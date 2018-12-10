% MIT License
% 
% Copyright (c) 2018 Frédéric Vogel, info [at] fredericvogel.ch
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2018/12/08 CV]

\DeclareOption{german}{\def\cv@german}
\DeclareOption{headernotbold}{\def\cv@headernotbold}
\DeclareOption{placenotemph}{\def\cv@placenotemph}
\DeclareOption{detailsmall}{\def\cv@detailsmall}

\newcommand{\cv@hlcolor}{MidnightBlue}
\DeclareOption*{\let\cv@hlcolor\CurrentOption}

% What is the Name?
\newcommand{\setname}[1]{\newcommand{\cv@name}{\detokenize{#1}}}

% What is the title?
\newcommand{\settitle}[1]{\newcommand{\cv@academic}{\detokenize{#1}}}

% What is the footer text?
\newcommand{\setfooter}[1]{\newcommand{\cv@footertext}{\detokenize{#1}}}

% What picture should be used?
\newcommand{\setimage}[1]{\newcommand{\cv@imagepath}{\detokenize{#1}}}

% How much should the picture be moved?
\newcommand{\cv@imagevspace}{-20pt}
\newcommand{\cv@imagewidth}{3cm}
\newcommand{\setimagedim}[2]{\renewcommand{\cv@imagewidth}{#1}\renewcommand{\cv@imagevspace}{#2}}

% How wide should the date column be?
\newlength{\cv@datewidth}
\setlength{\cv@datewidth}{3.9cm}
\newcommand{\setdatewidth}[1]{\setlength{\cv@datewidth}{#1}}

% How wide should the section line be?
\newcommand{\cv@hlheight}{1.4pt}
\newcommand{\sethlheight}[1]{\renewcommand{\cv@hlheight}{#1}}

\ProcessOptions\relax


% This class is based on article
\LoadClass[a4paper,10.5pt]{article}


% Packages needed
\RequirePackage{etoolbox}
\RequirePackage{suffix}
\RequirePackage{fontspec}
\RequirePackage{titlesec}
\RequirePackage{url,parskip}
\RequirePackage{color,graphicx}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{wrapfig}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{geometry}
\RequirePackage{tabularx}
\RequirePackage[bottom]{footmisc}

% Geometry

\geometry{
	top=15mm,
	bottom=20mm,
	left=15mm,
	right=15mm
}


% New column type for date column, takes width as argument

\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}



% Fonts

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[BoldFont={Lato Regular}]{Lato Light}
\newfontfamily\titlefont[]{Catamaran Light}


% Accent elements

\newcommand{\sectionrule}{{\color{\cv@hlcolor}\rule[-5pt]{\textwidth}{\cv@hlheight}}} % Accent line

\renewcommand{\thefootnote}{{\color{\cv@hlcolor}\arabic{footnote}}} % Footnote number color
\renewcommand{\footnoterule}{ % Footnote line color
	\kern -3pt
	{\color{\cv@hlcolor}\hrule width 2in}	
	\kern 2.6pt
}


% Section formating

\titleformat{\section}{\color{\cv@hlcolor}\Large\raggedright}{}{0em}{}[]
\titlespacing{\section}{0pt}{1.25ex}{0.5ex}


% Footer

\AfterEndPreamble{
	\pagestyle{fancy}
	\fancyhf{}
	% If the option german was given, print page in German
	\ifdef{\cv@german}{
		\rfoot{Seite \thepage~von \pageref{LastPage}}
	}{
		\rfoot{Page \thepage~of \pageref{LastPage}}
	}
	% If a footnote text was given, print that and the name, otherwise only the name
	\ifdef{\cv@footertext}{
		\cfoot{\cv@name}
		\lfoot{\cv@footertext}
	}{
		\lfoot{\cv@name}
	}
}

% Changing the line on top of footnotes to the accent color
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{\cv@hlheight}
\renewcommand{\footrule}{\hbox to\headwidth{%
		\color{\cv@hlcolor}\leaders\hrule height \footrulewidth\hfill}}



% Print the title and the image (if available)
\AfterEndPreamble{
	\ifdef{\cv@imagepath}{
		\begin{wrapfigure}{r}{\cv@imagewidth}
			\vspace{\cv@imagevspace}
			\includegraphics[width=\cv@imagewidth]{\cv@imagepath}
		\end{wrapfigure}
	}{}
		
	{\titlefont\color{\cv@hlcolor}
		
		{\Huge \textbf{\cv@name}}\\
		\ifdef{\cv@academic}{
			{\large \cv@academic}
		}{}
		\bigskip
	}
}


% A CV-Section
\newenvironment{cvsection*}[1]
{
	\ifstrempty{#1}
	{}{
		\section{#1}
	}
}{}

% A CV-Section with line at the end
\newenvironment{cvsection}[1]{
	\begin{cvsection*}{#1}
}{
	\end{cvsection*}
	\sectionrule
}
% An environment for a section with three columns, the first with the specified width,
% the second one variable, the third right aligned

\newenvironment{cvlist}{
	\noindent\tabularx{\textwidth}{@{}L{\cv@datewidth} >{\raggedright\arraybackslash}X r} %@{} needed for left align
}{
	\endtabularx
}

\newcommand{\cventryhead}[3]{#1 & \ifdef{\cv@headernotbold}{#2}{\textbf{#2}} & #3 \\} % The headline of an entry
\WithSuffix\newcommand\cventryhead*[3]{#1 & #2 & #3 \\} % A unbold version of the headline

\newcommand{\cventryplace}[1]{& \ifdef{\cv@placenotemph}{#1}{\emph{#1}} & \\} % The place of an entry, emphasized

\newcommand{\cventrydetail}[1]{& \ifdef{\cv@detailsmall}{\small #1}{#1} & \\} % A detail about an entry


% An environment for two columns, the first one with the specified width

\newenvironment{cvtwocolumn}{
	\noindent\tabularx{\textwidth}{@{}L{\cv@datewidth} l}
}{
	\endtabularx
}

\newcommand{\cvtwoentry}[2]{#1: & #2\\} % The default entry for the environment