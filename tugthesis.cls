\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tugthesis}[2013/07/05 Template for a thesis document.]

% \makeatletter

\RequirePackage{ifpdf}
\RequirePackage{kvoptions}
\RequirePackage{ifthen}

\SetupKeyvalOptions{
	family=THS,
	prefix=THS@
}

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
\DeclareStringOption[references-biblatex.bib]{biblatexfile}
\DeclareStringOption[{30,103,182}]{dispositioncolor}
\DeclareStringOption[true]{colorlinks}
\DeclareStringOption[Thesis_TU_Graz]{titlepage}
\DeclareStringOption{todonotesoptions}
\DeclareBoolOption[true]{addcolophon}
\DeclareBoolOption[false]{addlistoftodos}

\newboolean{THSaddcolophon}

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
}{scrbook}

\LoadClass{scrbook}


\def\THScolorlinks{\THS@colorlinks}


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


\def\THSinsertauthor{AUTHOR}
\newcommand{\THSauthor}[1]{\def\THSinsertauthor{#1}}

\def\THSinserttitle{TITLE}
\newcommand{\THStitle}[1]{\def\THSinserttitle{#1}}

\def\THSinsertsubject{subject}
\newcommand{\THSsubject}[1]{\def\THSinsertsubject{#1}}

\def\THSinsertkeywords{keywords}
\newcommand{\THSkeywords}[1]{\def\THSinsertkeywords{#1}}

\def\THSinsertworktitle{worktitle}
\newcommand{\THSworktitle}[1]{\def\THSinsertworktitle{#1}}

\def\THSinsertgrade{grade}
\newcommand{\THSgrade}[1]{\def\THSinsertgrade{#1}}

\def\THSinsertstudy{study}
\newcommand{\THSstudy}[1]{\def\THSinsertstudy{#1}}

\def\THSinsertuniversity{university}
\newcommand{\THSuniversity}[1]{\def\THSinsertuniversity{#1}}

\def\THSinsertinstitute{institute}
\newcommand{\THSinstitute}[1]{\def\THSinsertinstitute{#1}}

\def\THSinsertinstitutehead{institutehead}
\newcommand{\THSinstitutehead}[1]{\def\THSinsertinstitutehead{#1}}

\def\THSinsertsupervisor{supervisor}
\newcommand{\THSsupervisor}[1]{\def\THSinsertsupervisor{#1}}

\def\THSinsertevaluator{evaluator}
\newcommand{\THSevaluator}[1]{\def\THSinsertevaluator{#1}}

\def\THSinserthomestreet{homestreet}
\newcommand{\THShomestreet}[1]{\def\THSinserthomestreet{#1}}

\def\THSinserthometown{hometown}
\newcommand{\THShometown}[1]{\def\THSinserthometown{#1}}

\def\THSinserthomepostalnumber{homepostalnumber}
\newcommand{\THShomepostalnumber}[1]{\def\THSinserthomepostalnumber{#1}}

\def\THSinsertsubmissionmonth{submissionmonth}
\newcommand{\THSsubmissionmonth}[1]{\def\THSinsertsubmissionmonth{#1}}

\def\THSinsertsubmissionyear{submissionyear}
\newcommand{\THSsubmissionyear}[1]{\def\THSinsertsubmissionyear{#1}}

\def\THSinsertsubmissiontown{submissiontown}
\newcommand{\THSsubmissiontown}[1]{\def\THSinsertsubmissiontown{#1}}

\def\THSinsertid{id}
\newcommand{\THSid}[1]{\def\THSinsertid{#1}}

\def\THSinsertlecture{lecture}
\newcommand{\THSlecture}[1]{\def\THSinsertlecture{#1}}


\input{template/preamble.tex}


%% ========================================================================
%%%% MISC command definitions
%% ========================================================================
\input{template/mycommands}

%% ========================================================================
%%%% Typographic settings
%% ========================================================================
\input{template/typographic_settings}


\newcommand{\THSmyLaT}{\LaTeX{}@TUG\xspace} %% LaTeX@TUG text "logo"


\AtBeginDocument{
	
		\input{template/pdf_settings}  %% should be *last* definitions in preamble!


		\frontmatter                    %% KOMA: roman page numbers and such; only available in scrbook

		\input{colophon}                %% defines information about editor, LaTeX, font, ...

		%% Choose your desired title page:
		\input{template/title_\THS@titlepage}            %% include title page


		\input{template/declaration_TU_Graz}  %% Statutory Declaration
		% \input{thanks}                %% this is a suggestion: you have to create this file on demand
		% \input{foreword}              %% this is a suggestion: you have to create this file on demand


		%% include the abstract without chapter number but include it on table of contents:
		\cleardoublepage
		\addcontentsline{toc}{chapter}{Abstract}
		\include{abstract}              %% Abstract


		\tableofcontents                %% this produces the table of contents - you might have guessed :-)

		\listoffigures

		%% if myaddlistoftodos is set to "true", the current list of open todos is added:
		\ifTHS@addlistoftodos
		  \newpage\listoftodos          %% handy if you are using todonotes with \todo{}
		\fi                             %% with todonotes-package option "disable" you can get rid of any todo in the output

		\mainmatter                     %% KOMA: marks main part using arabic page numbers and such; only available in scrbook


}

\makeatother