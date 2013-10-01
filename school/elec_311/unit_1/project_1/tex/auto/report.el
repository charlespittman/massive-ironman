(TeX-add-style-hook "report"
 (lambda ()
    (LaTeX-add-labels
     "sec:objective"
     "sec:procedure"
     "fig:circuit"
     "tab:truth"
     "sec:results")
    (TeX-run-style-hooks
     "glossaries"
     "acronym"
     "graphicx"
     "latex2e"
     "art10"
     "article"
     "")))

