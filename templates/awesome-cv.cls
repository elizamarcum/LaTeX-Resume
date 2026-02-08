%% Start of file `awesome-cv.cls'.
% Awesome CV Class File
%
% This class has been downloaded from:
% https://github.com/posquit0/Awesome-CV
% And subsequently highly modified and hosted at:
% https://github.com/elizabrock/LaTeX-Resume
%
% Authors:
% Claud D. Park <posquit0.bj@gmail.com>
% Eliza Marcum <eliza@elizamarcum.com>
%
% Notes:
% 1) This class file defines the structure and layout of the template file (cv.tex, resume.tex).
% 2) It has been written in such a way that under most circumstances you
% should not need to edit it.
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%


%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{templates/awesome-cv}[2017/02/05 v1.6.1 Awesome Curriculum Vitae Class]
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to make header & footer efficiently
\RequirePackage{fancyhdr}
% Needed to manage colors
\RequirePackage[dvipsnames,table]{xcolor}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to strip chars from telephone number
\RequirePackage{xstring}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Required to enable LUA programming
\RequirePackage{luacode}
% For formatting individual table cells
\RequirePackage{makecell}
% For table cells that span multiple rows
\RequirePackage{multirow}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
% Needed to manage math fonts
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome
\RequirePackage{fontawesome6}
\RequirePackage{roboto}
\RequirePackage[default,opentype]{sourcesanspro}
% Needed for the photo ID
\RequirePackage[skins]{tcolorbox}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode,pdfpagelabels=false]{hyperref}
% Solves issues Warning: File `cv.out' has changed
\RequirePackage{bookmark}

%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure an optional directory location for fonts(default: 'fonts/')
% Not required anymore but left in place for backward compatability.
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}

%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{mediumgray}{HTML}{4f4f4f}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{notthelightestgray}{HTML}{6b6b6b}
\definecolor{lightgray}{HTML}{999999}
% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{graytext}{mediumgray} % Original shade was {darkgray}
\colorlet{lighttext}{lightgray}
\colorlet{sectiondivider}{gray}
% Awesome colors
\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}
\colorlet{awesome-color}{awesome-red}

%% Tag Colors %%

% To visualize the color palette and its suitability for color blindness, use:
% https://projects.susielu.com/viz-palette?colors=[%22#423790%22,%22#840067%22,%22#ea5f94%22,%22#f97e44%22,%22#ffd700%22,%22#98cc70%22,%22#006eb8%22,%22#949698%22,%22#bebebe%22]&backgroundColor=%22white%22&fontColor=%22black%22&mode=%22normal%22

\definecolor{tagBlueViolet}{HTML}{423790} % Equivalent of tagPurple!50!tagBlue; Halfway between purple and blue
\definecolor{tagPurple}{HTML}{840067}
\definecolor{tagPink}{HTML}{ea5f94}
\definecolor{tagOrange}{HTML}{F97E44}
\definecolor{tagYellow}{HTML}{ffd700}
\definecolor{tagGreen}{HTML}{98CC70} % YellowGreen
\definecolor{tagBlue}{HTML}{006EB8} % NavyBlue
\colorlet{tagGray}{Gray} % 949698
\definecolor{tagPaleGray}{HTML}{fafafa}

% Boolean value to switch section color highlighting
\newbool{acvSectionColorHighlight}
\setbool{acvSectionColorHighlight}{true}

% @seignovert version of Awesome section color:
\newcommand{\@sectioncolor}[1]{%
	\ifbool{acvSectionColorHighlight}{{\color{awesome-color}#1}}{#1}%
}

%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------

% Reference on fonts:
%  * https://www.tug.org/FontCatalogue/sourcesanspro/
%  * https://tex.stackexchange.com/questions/633498/how-to-use-extralight-semibold-black-fonts-of-the-source-sans-pro-typeface

\newcommand*{\headerfont}{\roboto}
\newcommand*{\headerfontlight}{\robotolight}
\newcommand*{\footerfont}{\sourcesanspro}
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures

% Font sizes have been converted to ems, with 9pt as the basis, given that that was the default
% for most text.  The fixed text sizes original to awesome-cv completely ignored the font size
% specified in the letter class. -EM

% NOTE: With xetex, ems perform as one would expect from experience in other areas: https://tex.stackexchange.com/a/97970

\newcommand{\defaultbaselinespacing}{1.22em}
\newcommand{\extrabaselinespacing}{1.6em}

\newcommand{\pageheaderfontsize}{32pt} % Leaving this in points, as I don't want it to scale with body font
\newcommand{\headerfontsize}{14pt} % Leaving this in points, as I don't want it to scale with body font

\newcommand{\largerthandefaultfontsize}{1.22em}
\newcommand{\defaultfontsize}{1em}
\newcommand{\slightlysmallerthandefaultfontsize}{.88em}
\newcommand{\smallerthandefaultfontsize}{.77em}


% Color concepts: Page Header, Headings, Default, Attention
\colorlet{page-header-heading-color}{darkgray}
\colorlet{page-header-body-color}{graytext}
\colorlet{page-header-deemphasized-color}{notthelightestgray}
\colorlet{page-footer-color}{lighttext}

\colorlet{heading-color}{darktext}
\colorlet{subheading-color}{graytext}
\colorlet{default-text-color}{darktext}
\colorlet{emphasized-text-color}{graytext}

% Headers
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{\pageheaderfontsize}{\defaultbaselinespacing}\headerfontlight\color{page-header-heading-color} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{\pageheaderfontsize}{\defaultbaselinespacing}\headerfont\color{page-header-heading-color} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{\slightlysmallerthandefaultfontsize}{\defaultbaselinespacing}\bodyfont\scshape\color{awesome-color} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{\smallerthandefaultfontsize}{\defaultbaselinespacing}\headerfont\color{page-header-deemphasized-color} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{\smallerthandefaultfontsize}{\defaultbaselinespacing}\headerfont\color{page-header-body-color} #1}}
\newcommand*{\headerquotestyle}[1]{{\fontsize{\defaultfontsize}{\defaultbaselinespacing}\bodyfont\itshape\color{page-header-body-color} #1}}

% Footers
\newcommand*{\footerstyle}[1]{{\fontsize{\slightlysmallerthandefaultfontsize}{\defaultbaselinespacing}\footerfont\scshape\color{page-footer-color} #1}}

% Sections
\newcommand*{\sectionstyle}[1]{{\fontsize{\headerfontsize}{\defaultbaselinespacing}\bodyfont\bfseries\color{heading-color}\@sectioncolor{#1}}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{\defaultfontsize}{\defaultbaselinespacing}\bodyfont\scshape\textcolor{subheading-color}{#1}}}

% Paragraphs
\newcommand*{\paragraphstyle}{\fontsize{\defaultfontsize}{\defaultbaselinespacing}\bodyfontlight\upshape\color{default-text-color}}
\newcommand*{\titlestyle}{\fontsize{\defaultfontsize}{\defaultbaselinespacing}\bodyfont\bfseries\color{emphasized-text-color}}
\newcommand*{\organizationstyle}{\fontsize{\defaultfontsize}{\defaultbaselinespacing}\bodyfontlight\color{default-text-color}}
\newcommand*{\datestyle}{\fontsize{\defaultfontsize}{\defaultbaselinespacing}\bodyfontlight\color{emphasized-text-color}}
\newcommand*{\locationstyle}{\fontsize{\defaultfontsize}{\defaultbaselinespacing}\bodyfontlight\slshape\color{emphasized-text-color}}

% TODO: I haven't sorted through these to find the identical entries, but I deeply wish to continue unpicking the symmetries.
%\newcommand*{\defaultorganizationnamestyle}[1]{{\titlestyle #1}}

% For elements of entry
\newcommand*{\entrytitlestyle}[1]{{\titlestyle #1}}
\newcommand*{\entryorganizationstyle}[1]{{\organizationstyle #1}}
\newcommand*{\entrydatestyle}[1]{{\datestyle #1}}
\newcommand*{\entrylocationstyle}[1]{{\locationstyle #1}}
% TODO: Consider justifying this text, although \\justifying didn't seem to do the trick..
\newcommand*{\entryorganizationnotestyle}[1]{{\fontsize{\slightlysmallerthandefaultfontsize}{\defaultbaselinespacing}\bodyfontlight\slshape\color{emphasized-text-color} #1}}
\newcommand*{\entrydescriptionstyle}[1]{{\fontsize{\defaultfontsize}{\defaultbaselinespacing}\bodyfontlight\upshape\color{emphasized-text-color} #1}}

% For elements of subentry
\newcommand*{\subentrytitlestyle}[1]{{\fontsize{\slightlysmallerthandefaultfontsize}{\defaultbaselinespacing}\bodyfont\mdseries\color{emphasized-text-color} #1}}
\newcommand*{\subentrypositionstyle}[1]{{\fontsize{\smallerthandefaultfontsize}{\defaultbaselinespacing}\bodyfont\scshape\color{emphasized-text-color} #1}}
\newcommand*{\subentrydatestyle}[1]{{\fontsize{\smallerthandefaultfontsize}{\defaultbaselinespacing}\bodyfontlight\slshape\color{emphasized-text-color} #1}}
\newcommand*{\subentrylocationstyle}[1]{{\fontsize{\smallerthandefaultfontsize}{\defaultbaselinespacing}\bodyfontlight\slshape\color{awesome-color} #1}}
\newcommand*{\subdescriptionstyle}[1]{{\fontsize{\slightlysmallerthandefaultfontsize}{\defaultbaselinespacing}\bodyfontlight\upshape\color{default-text-color} #1}}

% For elements of honor
\newcommand*{\honortitlestyle}[1]{{\titlestyle #1}}
\newcommand*{\honororganizationstyle}[1]{{\organizationstyle #1}}
\newcommand*{\honordatestyle}[1]{{\datestyle #1}}
\newcommand*{\honorlocationstyle}[1]{{\locationstyle #1}}

% OG
\newcommand*{\speakingorganizationstyle}[1]{{\organizationstyle #1}}
\newcommand*{\speakingpositionstyle}[1]{{\titlestyle\bodyfontlight #1}}
\newcommand*{\speakingdatestyle}[1]{{\datestyle #1}}
\newcommand*{\speakinglocationstyle}[1]{\locationstyle #1}

% For elements of skill
\newcommand*{\skilltagstyle}[1]{\fontsize{\defaultfontsize}{\defaultbaselinespacing}\bodyfontlight\color{default-text-color} #1}
\newcommand*{\skillcategorystyle}[1]{{\titlestyle\fontsize{\defaultfontsize}{\defaultbaselinespacing} #1}}
\newcommand*{\skillsetstyle}[1]{{\color{default-text-color} #1}}

% Cover Letter
\newcommand*{\lettersectionstyle}[1]{{\sectionstyle{#1}}}
\newcommand*{\recipientaddressstyle}[1]{{\fontsize{\defaultfontsize}{\defaultbaselinespacing}\bodyfont\scshape\color{emphasized-text-color} #1}}
\newcommand*{\recipienttitlestyle}[1]{{\fontsize{\largerthandefaultfontsize}{\defaultbaselinespacing}\bodyfont\scshape\color{default-text-color} #1}}
\newcommand*{\lettertitlestyle}[1]{{\fontsize{\defaultfontsize}{\defaultbaselinespacing}\bodyfontlight\bfseries\color{default-text-color} \underline{#1}}}
\newcommand*{\letterdatestyle}[1]{{\datestyle\slshape #1}}
\newcommand*{\lettertextstyle}{\fontsize{\defaultfontsize}{\extrabaselinespacing}\bodyfontlight\upshape\color{default-text-color}}
\newcommand*{\letternamestyle}[1]{{\fontsize{\defaultfontsize}{\defaultbaselinespacing}\bodyfont\bfseries\color{default-text-color} #1}}
\newcommand*{\letterenclosurestyle}[1]{{\fontsize{\defaultfontsize}{\defaultbaselinespacing}\bodyfontlight\slshape\color{page-footer-color} #1}}


%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
% Define photo ID
% Usage: \photo[circle|rectangle,edge|noedge,left|right]{<path-to-image>}
\newcommand{\photo}[2][circle,edge,left]{%
  \def\@photo{#2}
  \@for\tmp:=#1\do{%
    \ifthenelse{\equal{\tmp}{circle} \or \equal{\tmp}{rectangle}}%
      {\let\@photoshape\tmp}{}%
    \ifthenelse{\equal{\tmp}{edge} \or \equal{\tmp}{noedge}}%
      {\let\@photoedge\tmp}{}%
    \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right}}%
      {\let\@photoalign\tmp}{}%
  }%
}
\def\@photoshape{circle}
\def\@photoedge{edge}
\def\@photoalign{left}

% Define writer's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define writer's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Define writer's position
% Usage: \position{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]
{
  \def\@mobile{#1}
  \def\@teluri{tel:\@mobile}
  % Strip unwanted characters
  \StrDel{\@teluri}{ }[\@teluri]%
  \StrDel{\@teluri}{-}[\@teluri]%
  \StrDel{\@teluri}{(}[\@teluri]%
  \StrDel{\@teluri}{)}[\@teluri]%
}

% Defines writer's email (optional)
% Usage: \email{<email address>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines writer's date of birth (optional)
% Usage: \dateofbirth{<date>}
\newcommand*{\dateofbirth}[1]{\def\@dateofbirth{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines writer's gitlab (optional)
% Usage: \gitlab{<gitlab-nick>}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}

% Defines writer's bitbucket (optional)
% Usage: \bitbucket{<bitbucket-nick>}
\newcommand*{\bitbucket}[1]{\def\@bitbucket{#1}}

% Defines writer's stackoverflow profile (optional)
% Usage: \stackoverflow{<so userid>}{<so username>}
%   e.g.https://stackoverflow.com/users/123456/sam-smith
%       would be \stackoverflow{123456}{sam-smith}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Defines writer's orcid (optional)
% Usage: \orcid{<orcid-num>}
\newcommand*{\orcid}[1]{\def\@orcid{#1}}

% Defines writer's twitter (optional)
% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Defines writer's x (formerly twitter) (optional)
% Usage: \x{<x account>}
\newcommand*{\x}[1]{\def\@x{#1}}

% Defines writer's Mastodon (optional)
% Usage: \mastodon{<instance>}{<mastodon-nick>}
\newcommand*{\mastodon}[2]{\def\@mastodoninstance{#1}\def\@mastodonname{#2}}

% Defines writer's resarchgate (optional)
% Usage: \researchgate{<researchgate-account>}
\newcommand*{\researchgate}[1]{\def\@researchgate{#1}}

% Defines writer's skype (optional)
% Usage: \skype{<skype account>}
\newcommand*{\skype}[1]{\def\@skype{#1}}

% Defines writer's reddit (optional)
% Usage: \reddit{<reddit account>}
\newcommand*{\reddit}[1]{\def\@reddit{#1}}

% Defines writer's xing (optional)
% Usage: \xing{<xing name>}
\newcommand*{\xing}[1]{\def\@xing{#1}}

% Defines writer's medium profile (optional)
% Usage: \medium{<medium account>}
\newcommand*{\medium}[1]{\def\@medium{#1}}

% Defines writer's kaggle (optional)
% Usage: \kaggle{<kaggle handle>}
\newcommand*{\kaggle}[1]{\def\@kaggle{#1}}

% Defines writer's Hackerrank (optional)
% Usage: \hackerrank{<Hackerrank profile name>}
\newcommand*{\hackerrank}[1]{\def\@hackerrank{#1}}

% Defines writer's Telegram (optional)
% Usage: \telegram{<Telegram username>}
\newcommand*{\telegram}[1]{\def\@telegram{#1}}

% Defines writer's google scholar profile (optional)
% Usage: \googlescholar{<googlescholar userid>}{<googlescholar username>}
% e.g.https://scholar.google.co.uk/citations?user=wpZDx1cAAAAJ
% would be \googlescholar{wpZDx1cAAAAJ}{Name-to-display-next-icon}
% If 'googlescholar-name' is not provided than it defaults to
% '\firstname \lastname'
\newcommand*{\googlescholar}[2]{%
  \def\@googlescholarid{#1}%
  \ifthenelse{\equal{#2}{}}{%
    \def\@googlescholarname{\@firstname~\@lastname}%
  }{%
    \def\@googlescholarname{#2}%
  }%
}

% Defines writer's extra information (optional)
% Usage: \extrainfo{<extra information>}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

% Defines writer's quote (optional)
% Usage: \quote{<quote>}
\renewcommand*{\quote}[1]{\def\@quote{#1}}

% Defines recipient's information (cover letter only)
% Usage: \recipient{<recipient name>}{<recipient address>}
% Usage: \recipientname{<recipient name>}
% Usage: \recipientaddress{<recipient address>}
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}
\newcommand*{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand*{\recipientaddress}[1]{\def\@recipientaddress{#1}}

% Defines the title for letter (cover letter only, optional)
% Usage: \lettertitle{<title>}
\newcommand*{\lettertitle}[1]{\def\@lettertitle{#1}}

% Defines the date for letter (cover letter only)
% Usage: \letterdate{<date>}
\newcommand*{\letterdate}[1]{\def\@letterdate{#1}}

% Defines a message of opening for letter (cover letter only)
% Usage: \letteropening{<message>}
\newcommand*{\letteropening}[1]{\def\@letteropening{#1}}

% Defines a message of closing for letter (cover letter only)
% Usage: \letterclosing{<message>}
\newcommand*{\letterclosing}[1]{\def\@letterclosing{#1}}

% Defines an enclosure for letter (cover letter only, optional)
% Usage: \letterenclosure[<enclosure name>]{<enclosure>}
\newcommand*{\letterenclname}[1][Enclosure]{\def\@letterenclname{#1}}
\newcommand*{\letterenclosure}[2][]{%
  % if an optional argument is provided, use it to redefine \enclname
  \ifthenelse{\equal{#1}{}}{}{\def\@letterenclname{#1}}
  \def\@letterenclosure{#2}
}


%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{.4mm}
\newcommand{\acvHeaderAfterPositionSkip}{.4mm}
\newcommand{\acvHeaderAfterAddressSkip}{0.25mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{6mm}
\newcommand{\acvHeaderAfterQuoteSkip}{5mm}

% Others
\newcommand{\acvSectionTopSkip}{2mm}
\newcommand{\acvSectionContentTopSkip}{2mm}


%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{Z}[1]{>{\raggedright\let\newline\\\arraybackslash}m{#1}}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Use to draw horizontal line with specific thickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}

%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \makecvheader
\newcommand*{\makecvheader}[1][C]{%
  \newcommand*{\drawphoto}{%
    \ifthenelse{\isundefined{\@photo}}{}{%
      \newlength{\photodim}
      \ifthenelse{\equal{\@photoshape}{circle}}%
        {\setlength{\photodim}{1.3cm}}%
        {\setlength{\photodim}{1.8cm}}%
      \ifthenelse{\equal{\@photoedge}{edge}}%
        {\def\@photoborder{darkgray}}%
        {\def\@photoborder{none}}%
      \begin{tikzpicture}%
        \node[\@photoshape, draw=\@photoborder, line width=0.3mm, inner sep=\photodim, fill overzoom image=\@photo] () {};
      \end{tikzpicture}
    }%
  }
  \newlength{\headertextwidth}
  \newlength{\headerphotowidth}
  \ifthenelse{\isundefined{\@photo}}{
    \setlength{\headertextwidth}{\textwidth}
    \setlength{\headerphotowidth}{0cm}
  }{%
    \setlength{\headertextwidth}{0.76\textwidth}
    \setlength{\headerphotowidth}{0.24\textwidth}
  }%
  \begin{minipage}[c]{\headerphotowidth}%
    \ifthenelse{\equal{\@photoalign}{left}}{\raggedright\drawphoto}{}
  \end{minipage}
  \begin{minipage}[c]{\headertextwidth}
    \ifthenelse{\equal{#1}{L}}{\raggedright}{\ifthenelse{\equal{#1}{R}}{\raggedleft}{\centering}}
    \headerfirstnamestyle{\@firstname}\headerlastnamestyle{{}\acvHeaderNameDelim\@lastname}%
    \\[\acvHeaderAfterNameSkip]%
    \ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}}%
    \ifthenelse{\isundefined{\@address}}{}{\headeraddressstyle{\@address\\[\acvHeaderAfterAddressSkip]}}%
    \headersocialstyle{%
      \newbool{isstart}%
      \setbool{isstart}{true}%
      \ifthenelse{\isundefined{\@mobile}}%
        {}%
        {%
          \href{\@teluri}{\faMobile\acvHeaderIconSep\@mobile}%
          \setbool{isstart}{false}%
        }%
      \ifthenelse{\isundefined{\@email}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{mailto:\@email}{\faEnvelope\acvHeaderIconSep\@email}%
        }%
      \ifthenelse{\isundefined{\@dateofbirth}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          % \mbox prevents wrapping of elements%
          \mbox{\faCakeCandles\acvHeaderIconSep\@dateofbirth}%
        }%
      \ifthenelse{\isundefined{\@homepage}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{http://\@homepage}{\faGlobe\acvHeaderIconSep\@homepage}%
          % NOTE: The above is a custom adjustment to Awesome-CV - the default icon is \faHouseChimney
        }%
      \ifthenelse{\isundefined{\@github}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://github.com/\@github}{\faGithub\acvHeaderIconSep\@github}%
          % NOTE: The above is my custom adjustment to Awesome-CV - the default icon is \faSquareGithub
        }%
      \ifthenelse{\isundefined{\@gitlab}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://gitlab.com/\@gitlab}{\faGitlab\acvHeaderIconSep\@gitlab}%
        }%
      \ifthenelse{\isundefined{\@bitbucket}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://bitbucket.com/\@bitbucket}{\faBitbucket\acvHeaderIconSep\@bitbucket}%
        }%
      \ifthenelse{\isundefined{\@stackoverflowid}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://stackoverflow.com/users/\@stackoverflowid}{\faStackOverflow\acvHeaderIconSep\@stackoverflowname}%
        }%
      \ifthenelse{\isundefined{\@linkedin}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://www.linkedin.com/in/\@linkedin}{\faLinkedin\acvHeaderIconSep\@linkedin}%
        }%
      \ifthenelse{\isundefined{\@orcid}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://orcid.org/\@orcid}{\faOrcid\acvHeaderIconSep\@orcid}%
        }%
      \ifthenelse{\isundefined{\@twitter}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://twitter.com/\@twitter}{\faTwitter\acvHeaderIconSep\@twitter}%
        }%
      \ifthenelse{\isundefined{\@x}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://x.com/\@x}{\faXTwitter\acvHeaderIconSep\@x}%
        }%
      \ifthenelse{\isundefined{\@mastodonname}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://\@mastodoninstance/@\@mastodonname}{\faMastodon\acvHeaderIconSep\@mastodonname}%
        }%
      \ifthenelse{\isundefined{\@skype}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \faSkype\acvHeaderIconSep\@skype%
        }%
      \ifthenelse{\isundefined{\@reddit}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://www.reddit.com/user/\@reddit}{\faReddit\acvHeaderIconSep\@reddit}%
        }%
      \ifthenelse{\isundefined{\@researchgate}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://www.researchgate.net/profile/\@researchgate}{\faResearchgate\acvHeaderIconSep\@researchgate}%
        }%
      \ifthenelse{\isundefined{\@xing}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://www.xing.com/profile/\@xing}{\faSquareXing\acvHeaderIconSep\@xing}
        }%
      \ifthenelse{\isundefined{\@medium}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://medium.com/@\@medium}{\faMedium\acvHeaderIconSep\@medium}%
        }%
      \ifthenelse{\isundefined{\@kaggle}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://kaggle.com/\@kaggle}{\faKaggle\acvHeaderIconSep\@kaggle}%
        }%
      \ifthenelse{\isundefined{\@hackerrank}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://www.hackerrank.com/\@hackerrank}{\faHackerrank\acvHeaderIconSep\@hackerrank}%
        }%
      \ifthenelse{\isundefined{\@telegram}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://t.me/\@telegram}{\faTelegram\acvHeaderIconSep\@telegram}%
        }%
      \ifthenelse{\isundefined{\@googlescholarid}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://scholar.google.com/citations?user=\@googlescholarid}{\faGraduationCap\acvHeaderIconSep\@googlescholarname}%
        }%
      \ifthenelse{\isundefined{\@extrainfo}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \@extrainfo%
        }%
    } \\[\acvHeaderAfterSocialSkip]%
    \ifthenelse{\isundefined{\@quote}}%
      {}%
      {\headerquotestyle{\@quote\\}\vspace{\acvHeaderAfterQuoteSkip}}%
  \end{minipage}%
  \begin{minipage}[c]{\headerphotowidth}%
    \ifthenelse{\equal{\@photoalign}{right}}{\raggedleft\drawphoto}{}
  \end{minipage}
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3}}
}

% Define a section for CV
% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{%
  \vspace{\acvSectionTopSkip}
  \sectionstyle{#1}
  \phantomsection
  \color{sectiondivider}\vhrulefill{0.9pt}
}

% Define a subsection for CV
% Usage: \cvsubsection{<subsection-title>}
\newcommand{\cvsubsection}[1]{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-1.5mm}
  % ^ Modification from -3 to -2
  \subsectionstyle{#1}
  \phantomsection
}

% Define a paragraph for CV
\newenvironment{cvparagraph}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \paragraphstyle
}{%
  \par
  \vspace{2mm}
}

\directlua{require("templates/community_involvement.lua")}

% Define an environment for cvcommunityinvolvement
\newenvironment{cvcommunityinvolvemententries}{%
  \vspace{\acvSectionContentTopSkip}
  \directlua{community_involvement_setup()}
  }{%
  \directlua{output_community_involvement()}
  \vspace{-3.0mm}
}

% Define an entry of cv community involvement
% Usage: \cvcommunityinvolvemententry{<title>}{<date>}{<organization/position>}<{location}>{<description>}
\newcommand*{\cvcommunityinvolvemententry}[4]{%
  \@namedef{positionName}{#1}%
  \@namedef{positionDate}{#2}%
  \@namedef{organizationName}{#3}%
  \@namedef{positionDescription}{#4}%

  \directlua{
    record_community_involvement(
      \luastring{\positionName},
      \luastring{\positionDate},
      \luastring{\organizationName},
      \luastring{\positionDescription}
      )
  }
}

% Define an environment for cventry
\newenvironment{cventries}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{flushleft}
}{%
  \end{flushleft}
  \vspace{-3.0mm}
}
% Define an entry of cv information
% Usage: \cventry{<title>}{<date>}{<organization/position>}<{location}>{<description>}
\newcommand*{\cventry}[5]{%
  \doublecventry{#1}{#2}{#3}{}{}{}{}{#4}{#5}
}

% Usage: \cventrywithorganizationnote{<title>}{<date>}{<organization/position>}{<note>}{<location>}{<description>}
\newcommand*{\cventrywithorganizationnote}[6]{%
  \doublecventry{#1}{#2}{#3}{}{}{}{#4}{#5}{#6}
}

% Usage: \doublecventry{<title>}{<date>}{<company>}{<additional title>}{<additional date>}{<additional company>}{<note>}{<location>}{<description>}
\newcommand*{\doublecventry}[9]{%
  \@namedef{positionName}{#1}%
  \@namedef{positionDate}{#2}%
  \@namedef{organizationName}{#3}%
  \@namedef{additionalPositionName}{#4}%
  \@namedef{additionalPositionDate}{#5}%
  \@namedef{additionalOrganizationName}{#6}%
  \@namedef{organizationNote}{#7}%
  \@namedef{location}{#8}%
  \@namedef{description}{#9}%
  \vspace{-1.0mm} % This seems to get the tabular lined up.  TODO- Figure out if this could be a setting on tabular..
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  % TODO: Figure out how to get the date on the two-line title to top align
  \begin{tabular}[t]{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \ifdefempty{\organizationName}
      {\entrytitlestyle{\positionName} & \entrydatestyle{\positionDate} \\}
      {\entrytitlestyle{\positionName}, \entryorganizationstyle{\organizationName} & \entrydatestyle{\positionDate} \\}
    \ifdefempty{\additionalPositionName}
      {}
      {\entrytitlestyle{\additionalPositionName}, \entryorganizationstyle{\additionalOrganizationName} & \entrydatestyle{\additionalPositionDate} \\}
    \ifdefempty{\organizationNote}
      {}
      % {\entryorganizationnotestyle{\organizationNote} & \\}
      % The L here is why it is left aligned and not justified, I think..
      % {\multicolumn{2}{L{\textwidth}}{\entryorganizationnotestyle{\organizationNote}} \\}
      {\multicolumn{2}{L{\textwidth}}{
        \begin{tabular}[t]{L{.75\textwidth} R{.25\textwidth}}
          \entryorganizationnotestyle{\organizationNote} & \\
        \end{tabular}
      } \\}
    \ifdefempty{\description}
      {}
      {\multicolumn{2}{L{\textwidth}}{\entrydescriptionstyle{\description}} \\}
  \end{tabular}%
}

\newcommand*{\cveducationentry}[6]{%
  \@namedef{degree}{#1}%
  \@namedef{university}{#2}%
  \@namedef{note}{#3}%
  \@namedef{location}{#4}%
  \@namedef{date}{#5}%
  \@namedef{description}{#6}%
  % TODO separate this out into a table preamble command
  \vspace{-1.0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular}[t]{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}} % TODO: Modularize this to share with the below so that changes are synced
    \entrytitlestyle{\degree} & \entrydatestyle{\date} \\
    \entryorganizationstyle{\university} & \\
    \ifdefempty{\note}
      {}
      {\multicolumn{2}{L{\textwidth}}{
        \begin{tabular}[t]{L{.66\textwidth} R{.33\textwidth}}
          \entryorganizationnotestyle{\note} & \\
        \end{tabular}
      } \\}
    \multicolumn{2}{L{\textwidth}}{\entrydescriptionstyle{\description}} \\
  \end{tabular}
  \vspace{-1.5mm}
}

% Define an environment for cvsubentry
\newenvironment{cvsubentries}{%
  \begin{center}
}{%
  \end{center}
}
% Define a subentry of cv information
% Usage: \cvsubentry{<position>}{<title>}{<date>}{<description>}
% TODO: Honestly, remove this..
\newcommand*{\cvsubentry}[4]{%
  \vspace{-3.0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \setlength\leftskip{0.2cm}
    \subentrytitlestyle{#2} & \ifthenelse{\equal{#1}{}}
      {\subentrydatestyle{#3}}{}
    \ifthenelse{\equal{#1}{}}
      {}
      {\subentrypositionstyle{#1} & \subentrydatestyle{#3} \\}
    \ifthenelse{\equal{#4}{}}
      {}
      {\multicolumn{2}{L{17.0cm}}{\subdescriptionstyle{#4}} \\}
  \end{tabular*}
}

% Define an environment for cvhonor
\newenvironment{cvhonors}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 2.5cm} R{2.5cm}}
}{%
    \end{tabular*}
  \end{center}
}
% Define a line of cv information(honor, award or something else)
% Usage: \cvhonor{<title>}{<organization / position>}{<location>}{<date>}
\newcommand*{\cvhonor}[3]{%
  \honortitlestyle{#1}\ifempty{#2}{}{,} \honororganizationstyle{#2} & \honordatestyle{#3} \\
}

% Define an environment for cvskill
\newenvironment{cvskills}{%
  \vspace{-0.5mm}
  \setlength\tabcolsep{0pt}
  \renewcommand{\arraystretch}{0.4}
  \setlength{\extrarowheight}{0pt}
  \begin{flushleft}
    % For alignment debugging:
    % \rowcolors{1}{gray!25}{gray}
    \begin{tabular*}{\textwidth}{Z{1.25in}  @{ } Z{\textwidth - 1.2in} @{\extracolsep{\fill}}}
}{%
    \end{tabular*}
  \end{flushleft}
}
% Define a line of cv information(skill)
% Usage: \cvskill{<type>}{<skillset>}
\newcommand*{\cvskill}[2]{%
	\skillcategorystyle{#1} & \skillsetstyle{#2} \\
}

% Define an environment for cvtags
\newcommand*{\cvtags}[1]{
  \vspace{0.25mm}
  \begin{flushleft}
    #1
  \end{flushleft}
  \vspace{0.75mm}
}

% tcolorbox manual: https://ctan.mirrors.hoobly.com/macros/latex/contrib/tcolorbox/tcolorbox.pdf
\tcbset{on line, box align=bottom, enlarge bottom by=0.2em, valign=top, boxrule=1pt, boxsep=1pt, right skip=0.2em, left skip=0pt, left=3pt,right=3pt,top=1.5pt,bottom=1.5pt,colframe=pink, colback=pink}
\newcommand*{\backgroundedSkillTag}[2]{ %
  \colorlet{BackgroundMixed}{#1!50!tagPaleGray}%
  \colorlet{PaleBackground}{BackgroundMixed!4}%
  \skillTag{#1}{BackgroundMixed}{#2}
  }
\newcommand*{\skillTag}[2]{\tcbox[colframe=#1, colback=White]{\skilltagstyle{\vphantom{Äg}#2}} }
\newcommand*{\pastSkillTag}[2]{\tcbox[colframe=white, colback=white, enhanced, frame hidden, borderline={1pt}{0pt}{#1,dashed}]{\skilltagstyle{\vphantom{Äg}#2}} }

% Define an environment for cvitems(for cventry)
\newenvironment{cvitems}{%
  \vspace{-3.5mm}
  \begin{justify}
  \begin{itemize}
    \setlength{\itemsep}{0.25em}
    %\setlength{\parskip}{0pt}
    \renewcommand{\labelitemi}{\bullet}
}{%
  \end{itemize}
  \end{justify}
  \vspace{\acvSectionContentTopSkip}
}

% Define an environment for cvpublicspeaking, nearly identical to cvhonors,
% but making it a little easier to modify in future.
\newenvironment{cvpublicspeakings}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-1.0mm}
  \begin{center}
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} C{1.5cm} L{\textwidth - 4.0cm} R{2.5cm}}
}{%
    \end{tabular*}
  \end{center}
}
% Define a line of cv information(honor, award or something else)
% Usage: \cvpublicspeaking{<title>}{<organization>}{<location>}{<date>}
\newcommand*{\cvpublicspeaking}[4]{%
  \speakingdatestyle{#4} & \speakingpositionstyle{#1}\ifempty{#2}{}{,} \speakingorganizationstyle{#2} & \speakinglocationstyle{#3} \\
}

%-------------------------------------------------------------------------------
%                Commands for elements of Cover Letter
%-------------------------------------------------------------------------------
% Define an environment for cvletter
\newenvironment{cvletter}{%
  \lettertextstyle
}{%
}

% Define a section for the cover letter
% Usage: \lettersection{<section-title>}
\newcommand{\lettersection}[1]{%
  \par\addvspace{2.5ex}
  \phantomsection{}
  \lettersectionstyle{#1}
  \color{sectiondivider}\vhrulefill{0.9pt}
  \par\nobreak\addvspace{0.4ex}
  \lettertextstyle
}

% Define a title of the cover letter
% Usage: \makelettertitle
\newcommand*{\makelettertitle}{%
  \vspace{3mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \recipienttitlestyle{\@recipientname} & \letterdatestyle{\@letterdate}
  \end{tabular*}
  \begin{singlespace}
    \recipientaddressstyle{\@recipientaddress} \\
  \end{singlespace}
  \ifthenelse{\isundefined{\@lettertitle}}
    {}
    {\lettertitlestyle{\@lettertitle} \\}
  \lettertextstyle{\@letteropening}
}

% Define a closing of the cover letter
% Usage: \makeletterclosing
\newcommand*{\makeletterclosing}{%
  \vspace{3.4mm}
  \lettertextstyle{\@letterclosing} \\\\
  \letternamestyle{\@firstname\ \@lastname}
  \ifthenelse{\isundefined{\@letterenclosure}}
    {\\}
    {%
      \\\\\\
      \letterenclosurestyle{\@letterenclname: \@letterenclosure} \\
    }
}
