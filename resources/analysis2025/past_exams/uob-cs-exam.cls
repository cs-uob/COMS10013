% UOB-CS-EXAM
%
% Created by Martijn Stam, Nicolas Wu (2017-2018).
% Updated by Alex Kavvos (2021)
%
% You should also be given a template exam.tex which will serve as a model
% for your exam.
%
% This LaTeX class file is a modification of the standard `exam` class, to
% suit University of Bristol exam regulations. The class creates a title page
% when \maketitle is called, and automatically places an "END OF PAPER"
% marking at the end.

% NOTE: The cs-uob-exam.cls style will normally require you to run LaTeX
% several times when compiling final output, since it must calculate the
% number of questions and associated marks. If you do not run LaTeX enough
% times, the marks may be incorrectly calculated. **It is strongly
% recommended that you use latexmk to do this, as it will automatically run
% latex for you, and detect when no more reruns are required.**

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uob-cs-exam}[2022/11/02 UoB CS Exam LaTeX class]

%% OPTIONS

%%% Flag for online exam instructions.
\newif\if@online
\@onlinefalse
\DeclareOption{online}{\@onlinetrue}

%%% Pass unknown options to exam.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}

\ProcessOptions\relax
%% END OF OPTIONS

% load the exam class
\LoadClass[12pt, addpoints]{exam}

%MSM: loading package to ease layout etc.
% \usepackage{cmbright}
\usepackage{mlmodern}
\usepackage[T1]{fontenc}
\RequirePackage{soul}			% to underline text
\RequirePackage[english]{fmtcount}	% to convert numbers into text
\RequirePackage[dvipsnames]{xcolor}

% set up exam.cls to provide correct UoB layout for questions
\marksnotpoints
\marginpointname{ \points}
%\renewcommand\thequestion{{\bfseries Q\arabic{question}}}
\qformat{\textbf{Question~\thequestion} (\totalpoints~\points) \hfill}
\pointsdroppedatright
\pointformat{(\themarginpoints)}
\setlength{\rightpointsmargin}{2.4cm}

% set up exam.cls to provide correct UoB page layout
\pagestyle{headandfoot}
\lhead{\ifcontinuation{\oddeven{}{(cont.)}}{}}
\chead{}
\rhead{\ifcontinuation{\oddeven{(cont.)}{}}{}}
\lfoot{}
\cfoot{{\bfseries Page \thepage\ of \numpages}}
\rfoot[]{
  {
    \bfseries
    \iflastpage{
      \vfill
      \begin{center}
        {\large\bfseries END OF PAPER}
      \end{center}
    }{
      \ifincomplete%
      {\oddeven{Turn Over/Qu.~continues \ldots}{Qu.~continues \ldots}}%
      {\oddeven{Turn Over/\ldots}{}}%
    }
  }
}

% Colour parameters (incl. for solutions)
\CorrectChoiceEmphasis{\color{red}\bfseries}
\shadedsolutions
\definecolor{SolutionColor}{rgb}{1,0.9,0.9}

\renewcommand\maketitle{

  \begin{center}
    {
      \large\bfseries
      UNIVERSITY OF BRISTOL\\[5mm]
      \When~Examination Period\\[5mm]
      \Dept
    }
    \vspace*{05mm}

    {
    \large\bfseries
    \Year~Examination for the Degrees of\\
    \Degrees
    }

    \vspace*{1cm}

    {\large\bfseries \Coms}\\
    {\large\bfseries \Name}

    \vspace*{05mm}

    {
      \large\bfseries 
      TIME ALLOWED:\\
      \Time

      \if@online
        plus \UploadTime~to allow for collation and uploading of answers.
      \else
        % nothing for in person exams
      \fi
    }

    \vspace*{05mm}

    \ifprintanswers
      {\Large\bfseries\color{Red}Answers}

      \vspace*{10mm}

      % This seems to be for printing ILOs. I assume that is something we no longer do.
      %
      % {
      %   \bfseries
      %   \ul{Intended Learning Outcomes:}
      % }\\[2mm]
      % \ILO

    \else

      % Rubric generation
      {
        \ifx\Rubrik\undefined
        This paper contains \textbf{\numberstringnum\numquestions{}} questions. \\
        \textbf{All} answers will be used for assessment. \\
        The maximum for this paper is \textbf{\numpoints\ marks}.\\[5mm]
        \else
        {\Rubrik}
        \fi
      }

    \fi

    %\vspace*{15mm}
    \vfill

    % Other instructions
    {
      \bfseries
      \ul{General Instructions}\\[2mm]
      \Instruct
    }

    \vfill
    
    {
      \if@online
      % nothing here for online exams
      \else
      {
        \large\bfseries
        % Please write your student number on the answer booklet, as found on your uCard.\\[2mm]

        TURN OVER ONLY WHEN TOLD TO START WRITING\\
      }
      \fi
    }

  \end{center}

  \newpage
}
