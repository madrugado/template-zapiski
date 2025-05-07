Template Repo
=============

Here we introduce a template for [Zapiski POMI Journal / Записки ПОМИ](https://www.pdmi.ras.ru/znsl/). Please make sure you are following the template. Also be aware that this template includes author names, title, keywords, and abstract in Russian after the References section. The .tex should be in **CP1251** encoding.

The repo contains:
* [template.tex](./template.tex) - TeX file with sample features.
* [zapiski.cls](./zapiski.cls) - CLS file.
* [pic/model.png](pic/model.png) - sample image to include.


Here is an example for \author tag:
```tex
\author{
  \textbf{Ivan Ivanov\textsuperscript{1}},
  \textbf{Petr Petrov\textsuperscript{2}}
\\
  \textsuperscript{1}Institution 1,
  \textsuperscript{2}Institution 2
\\
  \small{
    \textbf{Correspondence:} \href{ivanov@institution1.org}{ivanov@institution1.org}
  }
}
```
