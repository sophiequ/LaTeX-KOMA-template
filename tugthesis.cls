\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tugthesis}[2013/07/05 Template for a thesis document.]

% \makeatletter

\RequirePackage{ifpdf}
\RequirePackage{kvoptions}
\RequirePackage{ifthen}
\RequirePackage{xifthen}

\SetupKeyvalOptions{
	family=THS,
	prefix=THS@
}

\DeclareStringOption[scrbook]{baseclass}
\DeclareStringOption[A4]{papersize}
\DeclareStringOption[twoside]{laterality}
\DeclareStringOption[false]{draft}
\DeclareStringOption[half]{parskip}
\DeclareStringOption[0mm]{BCOR}
\DeclareStringOption[12pt]{fontsize}
\DeclareStringOption[1.0]{linespread}
\DeclareStringOption[{ngerman,american}]{language}
\DeclareStringOption[authoryear]{biblatexstyle}
\DeclareStringOption[false]{biblatexdashed}
\DeclareStringOption[true]{biblatexbackref}
\DeclareStringOption[references-biblatex.bib]{bibfile}
\DeclareStringOption[{30,103,182}]{dispositioncolor}
\DeclareStringOption[true]{colorlinks}
\DeclareStringOption[Thesis_TU_Graz]{titlepage}
\DeclareStringOption{todonotesoptions}
\DeclareStringOption[alpha]{bibtexstyle}
\DeclareBoolOption[true]{addcolophon}
\DeclareBoolOption[true]{addabstract}
\DeclareBoolOption[true]{adddeclaration}
\DeclareBoolOption[true]{addlistoffigures}
\DeclareBoolOption[false]{addlistoftodos}
\DeclareBoolOption[true]{biblatex}
\DeclareComplementaryOption{bibtex}{biblatex}

\newboolean{THSaddcolophon}
\newboolean{THSusebiblatex}

% This section removes all known options from the @classoptionslist 
% passed on to other loaded packages and classes, which might have 
% problems parsing the argument values containing curly braces, e.g.
% for language or dispositioncolor
\def\sa@classoptionslist{}
\DeclareDefaultOption{%
  \xdef\sa@classoptionslist{\sa@classoptionslist,\CurrentOption}%
}
\ProcessKeyvalOptions*\relax
\let\@classoptionslist\sa@classoptionslist
% end


\PassOptionsToClass{
	fontsize=\THS@fontsize, %% size of the main text
	paper=\THS@papersize,  %% paper format
	parskip=\THS@parskip,  %% vertical space between paragraphs (instead of indenting first par-line)
	DIV=calc,            %% calculates a good DIV value for type area; 66 characters/line is great
	headinclude=true,    %% is header part of margin space or part of page content?
	footinclude=false,   %% is footer part of margin space or part of page content?
	open=right,          %% "right" or "left": start new chapter on right or left page
	appendixprefix=true, %% adds appendix prefix; only for book-classes with \backmatter
	bibliography=totoc,  %% adds the bibliography to table of contents (without number)
	draft=\THS@draft,      %% if true: included graphics are omitted and black boxes
	                     %%          mark overfull boxes in margin space
	BCOR=\THS@BCOR,        %% binding correction (depends on how you bind
	                     %% the resulting printout.
	\THS@laterality        %% oneside: document is not printed on left and right sides, only right side
	                     %% twoside: document is printed on left and right sides
}{\THS@baseclass}

\LoadClass{\THS@baseclass}

% FIXXME: adopting class usage:
% from scrbook -> scrartcl OR scrreport:
% - remove appendixprefix from class options
% - remove \frontmatter \mainmatter \backmatter \appendix from main.tex

% FIXXME: adopting language:
% add or modify language parameter of package »babel« and use language switches described in babel-documentation

\def\THScolorlinks{\THS@colorlinks}
\def\THSbibfile{\THS@bibfile}
\def\THSbibtexstyle{\THS@bibtexstyle}

%\ifTHS@draft
%	\def\THS@draft{true}
%\else
%	\def\THS@draft{false}
%\fi

\ifTHS@addcolophon
	\setboolean{THSaddcolophon}{true}
\else
	\setboolean{THSaddcolophon}{false}
\fi

\ifTHS@biblatex
	\setboolean{THSusebiblatex}{true}
\else
	\setboolean{THSusebiblatex}{false}
\fi

\def\THSinsertauthor{}
\newcommand{\THSauthor}[1]{\def\THSinsertauthor{#1}}

\def\THSinserttitle{}
\newcommand{\THStitle}[1]{\def\THSinserttitle{#1}}

\def\THSinsertsubject{}
\newcommand{\THSsubject}[1]{\def\THSinsertsubject{#1}}

\def\THSinsertkeywords{}
\newcommand{\THSkeywords}[1]{\def\THSinsertkeywords{#1}}

\def\THSinsertworktitle{}
\newcommand{\THSworktitle}[1]{\def\THSinsertworktitle{#1}}

\def\THSinsertgrade{}
\newcommand{\THSgrade}[1]{\def\THSinsertgrade{#1}}

\def\THSinsertstudy{}
\newcommand{\THSstudy}[1]{\def\THSinsertstudy{#1}}

\def\THSinsertuniversity{}
\newcommand{\THSuniversity}[1]{\def\THSinsertuniversity{#1}}

\def\THSinsertinstitute{}
\newcommand{\THSinstitute}[1]{\def\THSinsertinstitute{#1}}

\def\THSinsertinstitutehead{}
\newcommand{\THSinstitutehead}[1]{\def\THSinsertinstitutehead{#1}}

\def\THSinsertsupervisor{}
\newcommand{\THSsupervisor}[1]{\def\THSinsertsupervisor{#1}}

\def\THSinsertcosupervisor{}
\newcommand{\THScosupervisor}[1]{\def\THSinsertcosupervisor{#1}}

\def\THSinsertevaluator{}
\newcommand{\THSevaluator}[1]{\def\THSinsertevaluator{#1}}

\def\THSinserthomestreet{}
\newcommand{\THShomestreet}[1]{\def\THSinserthomestreet{#1}}

\def\THSinserthometown{}
\newcommand{\THShometown}[1]{\def\THSinserthometown{#1}}

\def\THSinserthomepostalnumber{}
\newcommand{\THShomepostalnumber}[1]{\def\THSinserthomepostalnumber{#1}}

\def\THSinsertsubmissionmonth{}
\newcommand{\THSsubmissionmonth}[1]{\def\THSinsertsubmissionmonth{#1}}

\def\THSinsertsubmissionyear{}
\newcommand{\THSsubmissionyear}[1]{\def\THSinsertsubmissionyear{#1}}

\def\THSinsertsubmissiontown{}
\newcommand{\THSsubmissiontown}[1]{\def\THSinsertsubmissiontown{#1}}

\def\THSinsertid{}
\newcommand{\THSid}[1]{\def\THSinsertid{#1}}

\def\THSinsertlecture{}
\newcommand{\THSlecture}[1]{\def\THSinsertlecture{#1}}



\newcommand{\THSinsertbibliography}{
		\ifthenelse{\boolean{THSusebiblatex}}{
		\printbibliography              %% remove, if using BibTeX instead of biblatex
	}{
		\bibliographystyle{\THSbibtexstyle}
		\bibliography{\THSbibfile}
	}
}


\RequirePackage{template/tugthesis-packages}
\RequirePackage{template/tugthesis-commands}
\RequirePackage{template/tugthesis-typography}
\RequirePackage{template/tugthesis-pdfoptions}

\newcommand{\THSmyLaT}{\LaTeX{}@TU\,Graz\xspace} %% LaTeX@TUG text "logo"

%doc% \section{\texttt{tugthesis.cls} -- Basic Class File}
%doc% 
%doc% The file \texttt{tugthesis.cls} defines the commands
%doc% for meta information, e.g. \texttt{\\THSauthor\{\ldots\}},
%doc% \texttt{\\THStitle\{\ldots\}}, \ldots and class options 
%doc% like \texttt{fontsize=12pt}. You can modify or complement those definitions 
%doc% easily by mimicking the existing ones. The class file also defines the order 
%doc% of the docment elements at the beginning (colophon, title page, statutory 
%doc% declaration, \ldots) in the \texttt{AtBeginDocument} command at the end of the 
%doc% file. The files in the \texttt{template} directory are included from 
%doc% \texttt{tugthesis.cls}.


\AtBeginDocument{

		\ifthenelse{\equal{\THS@baseclass}{scrbook}} {
			\frontmatter                    %% KOMA: roman page numbers and such; only available in scrbook
		}{}

		\input{colophon}                %% defines information about editor, LaTeX, font, ...

		%% Choose your desired title page:
		\input{template/titlepages/\THS@titlepage}            %% include title page

		\ifTHS@adddeclaration
			\input{template/declaration_TU_Graz}  %% Statutory Declaration
		\fi

		% \input{thanks}                %% this is a suggestion: you have to create this file on demand
		% \input{foreword}              %% this is a suggestion: you have to create this file on demand


		\ifTHS@addabstract
			%% include the abstract without chapter number but include it on table of contents:
			\cleardoublepage
			\addcontentsline{toc}{chapter}{Abstract}
			\include{abstract}              %% Abstract
		\fi


		\tableofcontents                %% this produces the table of contents - you might have guessed :-)
		\clearpage

		\ifTHS@addlistoffigures
			\listoffigures
			\clearpage
		\fi

		%% if myaddlistoftodos is set to "true", the current list of open todos is added:
		\ifTHS@addlistoftodos
		  \newpage\listoftodos          %% handy if you are using todonotes with \todo{}
		\fi                             %% with todonotes-package option "disable" you can get rid of any todo in the output

		\ifthenelse{\equal{\THS@baseclass}{scrbook}} {
			\mainmatter                     %% KOMA: marks main part using arabic page numbers and such; only available in scrbook
		}


}

\makeatother
