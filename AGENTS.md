# How to follow the Zapiski POMI template

Two files in this repository define the article layout: `zapiski.cls` (the class)
and `template.tex` (a sample article skeleton). When preparing an article for
Zapiski Nauchnykh Seminarov POMI («Записки научных семинаров ПОМИ») — or a volume
compiled from conference papers — follow the rules below. The layout reference is
a published volume, e.g. https://www.pdmi.ras.ru/znsl/2026/v552.html

## Article skeleton

```latex
\documentclass{zapiski}                    % no options
\usepackage[cp1251]{inputenc}
\usepackage[T2A]{fontenc}
\usepackage[russian,english]{babel}
% ... content packages of the article (amsmath, graphicx, booktabs, url, hyperref, tikz, ...) ...
\english                                   % before \begin{document} — English-language article mode
\begin{document}
\originfo{NNN}{}{}{YEAR}                   % volume number and dates are set by the editorial board
\setcounter{page}{1}                       % starting pages are assigned by the editorial board
\date{}                                    % the "Received ..." date is inserted by the editorial board
\title[Short Title]{Full Title of the Paper}
\author[K.~Ivanov]{Konstantin Ivanov}      % [short name for the running head]{full name}
\address[K.~Ivanov]{Institution, City, Country}
\email{ivanov@inst.ru}                     % EVERY author must have an e-mail
\begin{abstract}...\end{abstract}
\keywords{kw1 \and kw2.}                   % \and separator, as in template.tex
\maketitle
... text ...
\begin{thebibliography}{99}
\bibitem{...}
...
\end{thebibliography}
\end{document}
% after \end{document} — the Russian block: authors (I.~Surname), Russian title,
% \begin{abstract} with the Russian translation of the abstract, Russian \keywords{} if available
```

## Rules

1. **All `.tex`/`.cls` files must be strictly CP1251-encoded.** Convert UTF-8 files
   with `iconv -f utf-8 -t cp1251`, after replacing characters not representable in
   CP1251 with macros (`≈` → `$\approx$`, `—` → `---`, `–` → `--`, etc.).
2. **Use only this `zapiski.cls`**, copied into the article byte-for-byte. Do not use
   local class files from author archives and do not modify the class.
3. **Remove extraneous packages and hacks**: `geometry`, `fontspec`, redefinitions of
   `\publnamef`/`\publnames`/`\russianvolinfo`, `\UDC` (not printed by the class),
   homemade `\def\@evenhead...` and other running-header hacks, `utf8`/`unicode`
   options of inputenc/hyperref. The page layout is defined by the class only.
4. **The bibliography** (`thebibliography`) must be sorted alphabetically by the
   surname of the first author (as `template.tex` itself requires); numbering and
   `\cite` resolve automatically after 2–3 pdflatex runs.
5. **The Russian block goes after `\end{document}`**: authors, Russian title,
   Russian abstract (`abstract`), Russian `\keywords{}` if available. `template.tex`
   is arranged the same way.
6. **Do not set yourself**: the volume number (`\originfo`), the starting page,
   the "Received" date — these are assigned by the editorial board of the volume.
7. **Compilation**: `pdflatex`, 2–3 runs; check the log for missing references
   and overfull boxes.

## Checklist

Before submission: every file decodes cleanly as CP1251 (`iconv`), every `\cite`
resolves against `thebibliography`, the Russian block after `\end{document}` is in
place, and the rendered pages visually match the reference volume.
