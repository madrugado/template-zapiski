# Как следовать шаблону «Записок научных семинаров ПОМИ»

Вёрстку статьи задают два файла этого репозитория: `zapiski.cls` (класс) и
`template.tex` (каркас статьи-примера). Готовя статью для журнала (или том по
статьям конференции), следуй правилам ниже. Эталон вёрстки — опубликованный том,
например https://www.pdmi.ras.ru/znsl/2026/v552.html

## Каркас статьи

```latex
\documentclass{zapiski}                    % без опций
\usepackage[cp1251]{inputenc}
\usepackage[T2A]{fontenc}
\usepackage[russian,english]{babel}
% ... содержательные пакеты статьи (amsmath, graphicx, booktabs, url, hyperref, tikz, ...) ...
\english                                   % до \begin{document} — режим англоязычной статьи
\begin{document}
\originfo{NNN}{}{}{ГОД}                    % номер тома и дату задаёт редакция
\setcounter{page}{1}                       % стартовые страницы расставит редакция
\date{}                                    % дату «Поступило…» впишет редакция
\title[Short Title]{Full Title of the Paper}
\author[K.~Ivanov]{Konstantin Ivanov}      % [краткое для колонтитула]{полное имя}
\address[K.~Ivanov]{Institution, City, Country}
\email{ivanov@inst.ru}                     % e-mail должен быть у КАЖДОГО автора
\begin{abstract}...\end{abstract}
\keywords{kw1 \and kw2.}                   % разделитель \and, как в template.tex
\maketitle
... текст ...
\begin{thebibliography}{99}
\bibitem{...}
...
\end{thebibliography}
\end{document}
% после \end{document} — русский блок: авторы (И.~Фамилия), русское название,
% \begin{abstract} — перевод аннотации, при наличии русские \keywords{}
```

## Правила

1. **Кодировка всех `.tex`/`.cls` — строго CP1251.** Файлы в UTF-8 конвертировать
   `iconv -f utf-8 -t cp1251`, предварительно заменив непредставимые в CP1251
   символы на макросы (`≈` → `$\approx$`, `—` → `---`, `–` → `--` и т.п.).
2. **Класс — только этот `zapiski.cls`**, копировать в статью побайтово. Локальные
   классы из авторских архивов не использовать и ничего в классе не менять.
3. **Лишние пакеты и хаки убирать**: `geometry`, `fontspec`, переопределения
   `\publnamef`/`\publnames`/`\russianvolinfo`, `\UDC` (в классе не печатается),
   самодельные `\def\@evenhead...` и прочие хаки колонтитулов, опции `utf8`/`unicode`
   у inputenc/hyperref. Вёрстку задаёт только класс.
4. **Список литературы** (`thebibliography`) — в алфавитном порядке по фамилии
   первого автора (как и требует `template.tex`); нумерация и `\cite` обновятся
   сами после 2–3 проходов `pdflatex`.
5. **Русский блок — после `\end{document}`**: авторы, русское название, русская
   аннотация (`abstract`), при наличии русские `\keywords{}`. Так же устроен сам
   `template.tex`.
6. **Не задавать самому**: номер тома (`\originfo`), стартовую страницу, дату
   «Поступило» — их ставит редакция тома.
7. **Компиляция**: `pdflatex` 2–3 прохода; проверять лог на missing references
   и overfull.

## Проверка

Перед сдачей: все файлы корректно декодируются как CP1251 (`iconv`), все `\cite`
резолвятся по `thebibliography`, русский блок после `\end{document}` на месте,
вёрстка страниц визуально соответствует эталонному тому.
