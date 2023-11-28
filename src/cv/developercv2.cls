%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Developer CV
% LaTeX Class
% Version 2.0 (2024-02-11)
%
% This class originates from:
% http://www.LaTeXTemplates.com
%
% Authors:
% Jan Vorisek (jan@vorisek.me)
% With modifications by David Bourgault (contact@davidbourgault.ca)
% Based on a template by Jan Küster (info@jankuester.com)
% Modified for LaTeX Templates by Vel (vel@LaTeXTemplates.com)
%
% License:
% The MIT License
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{developercv2}[2019/01/28 Developer CV class v2.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{extarticle} % Load the base class

%----------------------------------------------------------------------------------------
%	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\setlength{\parindent}{0mm} % Suppress paragraph indentation

\usepackage[hidelinks]{hyperref} % Required for links but hide the default boxes around links

\pagestyle{empty} % No headers or footers

\usepackage{moresize} % Provides more font size commands (\HUGE and \ssmall)

%----------------------------------------------------------------------------------------
%	PAGE LAYOUT
%----------------------------------------------------------------------------------------

\usepackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
	paper=letterpaper, % Paper size, change to letterpaper for US letter size
	top=1.7cm, % Top margin
	bottom=1.3cm, % Bottom margin
	left=2cm, % Left margin
	right=2cm, % Right margin
	headheight=0.75cm, % Header height
	footskip=1cm, % Space from the bottom margin to the baseline of the footer
	headsep=0.5cm, % Space from the top margin to the baseline of the header
	% showframe, % Uncomment to show how the type block is set on the page
}

\usepackage{enumitem}

\setlist[itemize]{leftmargin=*}

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Output font encoding for international characters

\usepackage[default]{raleway}
\usepackage[default]{sourcecodepro}

\renewcommand*\familydefault{\sfdefault} % Force the sans-serif version of any font used

%------------------------------------------------

\usepackage{fontawesome} % Required for FontAwesome icons

% Command to output an icon in a black square box with text to the right
\newcommand{\icon}[3]{% The first parameter is the FontAwesome icon name, the second is the box size and the third is the text
	\vcenteredhbox{\makebox(#2, #2){\large\csname fa#1\endcsname}}% Icon and box
	\hspace{0.2cm}% Whitespace
	\vcenteredhbox{#3}% Text
}

%----------------------------------------------------------------------------------------
%	GRAPHICS DEFINITIONS
%----------------------------------------------------------------------------------------

\usepackage{tikz} % Required for creating the plots
\usetikzlibrary{shapes, backgrounds}
\tikzset{x=1cm, y=1cm} % Default tikz units

% Command to vertically centre adjacent content
\newcommand{\vcenteredhbox}[1]{% The only parameter is for the content to centre
	\begingroup%
		\setbox0=\hbox{#1}\parbox{\wd0}{\box0}%
	\endgroup%
}

%----------------------------------------------------------------------------------------
%	CHARTS
%----------------------------------------------------------------------------------------

\newcounter{barcount}

% Environment to hold a new bar chart
\newenvironment{barchart}[1]{ % The only parameter is the maximum bar width, in cm
	\newcommand{\barwidth}{0.3}
	\newcommand{\barsep}{0.1}

	% Command to add a bar to the bar chart
	\newcommand{\baritem}[2]{ % The first argument is the bar label and the second is the percentage the current bar should take up of the total width
		\pgfmathparse{##2}
		\let\perc\pgfmathresult

		\pgfmathparse{#1}
		\let\barsize\pgfmathresult

		\pgfmathparse{\barsize*##2/100}
		\let\barone\pgfmathresult

		\pgfmathparse{(\barwidth*\thebarcount)+(\barsep*\thebarcount)}
		\let\barx\pgfmathresult

		\filldraw[fill=none, draw=black, thin] (0,-\barx-0.05) rectangle (\barone,-\barx-0.25);

		\node [label=180:\texttt{##1}] at (0,-\barx-0.15) {};
		\addtocounter{barcount}{1}
	}
	\begin{tikzpicture}%
		\setcounter{barcount}{0}%
}{
	\end{tikzpicture}
}

%------------------------------------------------

\newcounter{a}
\newcounter{b}
\newcounter{c}

% Command to output a number of automatically-sized bubbles from a string in the format of '<size>/<label>', e.g. \bubbles{5/Eclipse, 6/git, 4/Office, 3/Inkscape, 3/Blender}
\newcommand{\bubbles}[1]{
	% Reset counters
	\setcounter{a}{0}
	\setcounter{c}{150}

	\begin{tikzpicture}[scale=3]
		\foreach \p/\t in {#1} {
			\addtocounter{a}{1}
			\bubble{\thea/2}{\theb}{\p/25}{\t}{1\p0}
		}
	\end{tikzpicture}
}

% Command to output a bubble at a specific position with a specific size
\newcommand{\bubble}[5]{
	\filldraw[fill=black, draw=none] (#1,0.5) circle (#3); % Bubble
	\node[label=\textcolor{black}{#4}] at (#1,0.7) {}; % Label
}

%----------------------------------------------------------------------------------------
%	CUSTOM SECTIONS
%----------------------------------------------------------------------------------------

\newcommand{\name}[2]{
	{\HUGE\textbf{\MakeUppercase{#1}}} \\
	{\HUGE\textbf{\MakeUppercase{#2}}}
}

% Command to output section title headings
\newcommand{\cvsect}[1]{% The only parameter is the section text
	\vspace{\baselineskip} % Whitespace before the section title
	\MakeUppercase{\textbf{#1}}% Section title
	\vspace{1pt}
	\hrulefill\\
	% \vspace{\baselineskip}
}

%----------------------------------------------------------------------------------------
%	ENTRY LIST
%----------------------------------------------------------------------------------------

\usepackage{longtable} % Required for tables that span multiple pages
\setlength{\LTpre}{0pt} % Remove default whitespace before longtable
\setlength{\LTpost}{0pt} % Remove default whitespace after longtable

\setlength{\tabcolsep}{0pt} % No spacing between table columns

% Environment to hold a new list of entries
\newenvironment{entrylist}{
	\begin{longtable}[H]{l l}
}{
	\end{longtable}
}

\newcommand{\entry}[4]{% First argument for the leftmost date(s) text, second is for the bold entry heading, third is for the bold right-aligned entry qualifier and the fourth is for the entry description
	\parbox[t]{0.2\textwidth}{% 17.5% of the text width of the page
		#1 % Leftmost entry date(s) text
	}%
	&\parbox[t]{0.80\textwidth}{% 82.5% of the text width of the page
		\textbf{#2}% Entry heading text
		\hfill% Horizontal whitespace
		{\footnotesize \textbf{\textcolor{black}{#3}}}\\% Right-aligned entry qualifier text
		#4 % Entry description text
		\hfill% Horizontal whitespace
	}\\\\}

% Command to output a separator slash between lists, e.g. '  /  '
\newcommand{\slashsep}{\hspace{3mm}/\hspace{3mm}}

\newcommand{\mono}[1]{\fontfamily{Source Code Pro}#1}