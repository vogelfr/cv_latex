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
\ProvidesClass{coverletter}[2019/03/25 Cover Letter]

\DeclareOption{german}{\def\cv@german}
\DeclareOption{titlenotbold}{\def\cv@titlenotbold}

\newcommand{\cv@hlcolor}{MidnightBlue}
\DeclareOption*{\let\cv@hlcolor\CurrentOption}

\ProcessOptions\relax


% This class is based on article
\LoadClass[a4paper,10.5pt,parskip=full]{article}


% Packages needed
\RequirePackage{etoolbox}
\RequirePackage{enumitem}
\RequirePackage{suffix}
\RequirePackage{fontspec}
\RequirePackage{titlesec}
\RequirePackage{url,parskip}
\RequirePackage{color,graphicx}
\RequirePackage[usenames,dvipsnames, HTML]{xcolor}
\RequirePackage{wrapfig}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[\ifdef{\cv@debug}{showframe}{}]{geometry}
\RequirePackage{tabularx}
\RequirePackage{xparse}
\RequirePackage[bottom]{footmisc}

\ifdef{\cv@german}{
	\RequirePackage[ngerman]{babel}
	\RequirePackage[ngerman]{datetime2}
}{
	\RequirePackage[british]{babel}
	\RequirePackage[english]{datetime2}
}

% What is the Name?
\newcommand{\setname}[1]{\newcommand{\cv@name}{\detokenize{#1}}}

% What is the place?
\newcommand{\setplace}[1]{\newcommand{\cv@place}{\detokenize{#1}}}

% What is the date?
\DTMsavenow{letterdate}
\newcommand{\setdate}[3]{\DTMsavedate{letterdate}{#3-#2-#1}}

% What is the footer text?
\newcommand{\setfooter}[1]{\newcommand{\cv@footertext}{\detokenize{#1}}}

% What is the title of the cover letter?
\newcommand{\settitle}[1]{\newcommand{\cv@title}{\detokenize{#1}}}

% What is the subtitle?
\newcommand{\setsubtitle}[1]{\newcommand{\cv@subtitle}{\detokenize{#1}}}

% What picture should be used?
\newcommand{\setsignature}[1]{\newcommand{\cv@signaturepath}{\detokenize{#1}}}

% How thick should the section line be?
\newcommand{\cv@hlheight}{1.4pt}
\newcommand{\sethlheight}[1]{\renewcommand{\cv@hlheight}{#1}}


% Geometry

\geometry{
	top=20mm,
	bottom=20mm,
	left=20mm,
	right=20mm
}


% New column type for date column, takes width as argument

\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}


% Fonts

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[BoldFont={Lato Regular}]{Lato Light}
%\newfontfamily\titlefont[]{Catamaran Light}
\newfontfamily\titlefont[BoldFont={Lato Bold}]{Lato Regular}


% Accent elements

\newcommand{\HRule}[1][\linewidth]{\par
	\vspace*{\dimexpr-\parskip-\baselineskip+10pt}
	\noindent\rule{#1}{\cv@hlheight}\par
	\vspace*{\dimexpr-\parskip-.5\baselineskip+10pt}}

\newcommand{\sectionrule}{{\color{\cv@hlcolor}\HRule}} % Accent line


\renewcommand{\thefootnote}{{\color{\cv@hlcolor}\arabic{footnote}}} % Footnote number color
\renewcommand{\footnoterule}{ % Footnote line color
	\kern -3pt
	{\color{\cv@hlcolor}\hrule width 2in}	
	\kern 2.6pt
}


\newcommand{\cv@arraystretch}{1.5}


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
	

\AfterEndPreamble{
}

\newcommand{\@minipagerestore}{\setlength{\parskip}{\medskipamount}}

\newenvironment{sender}
{
	\hfill
	\begin{minipage}[t]{.6\textwidth}
		\raggedleft
}{
	\end{minipage}\\[1em]
}

\newenvironment{addressee}
{
	\begin{minipage}[t]{85mm}
		\raggedright
	}{
	\end{minipage}
	\vfill
}

\newcommand{\printdate}{
	\begin{flushright}
	\cv@place, \ifdef{\cv@german}{den }{}
	\DTMusedate{letterdate}
	\end{flushright}\par
}

\newcommand{\printtitle}{
	{\titlefont\color{\cv@hlcolor}
		\ifdef{\cv@titlenotbold}{
			\MakeUppercase{\cv@title}\\
			\cv@subtitle
		}{
			\textbf{\MakeUppercase{\cv@title}}\\
			\cv@subtitle
		}
	}
}

\newcommand{\printsignature}{
	\vspace{1em}
	\includegraphics[height=1cm]{\cv@signaturepath}
}

\newcommand\insertitem[1]{\item[-] #1}

\DeclareDocumentCommand \printattachments { >{\SplitList{;}} m }
{
	\vfill
	\footnoterule
	\ifdef{\cv@german}{Anhänge}{Attachments}
	\begin{itemize}[noitemsep]
		 \ProcessList{#1}{\insertitem}
	\end{itemize}
	
}

