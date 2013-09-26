(TeX-add-style-hook "report"
 (lambda ()
    (LaTeX-add-labels
     "sec:objective"
     "sec:procedure"
     "tab:truth"
     "sec:results"
     "tab:truth_simp")
    (TeX-run-style-hooks
     "glossaries"
     "acronym"
     "graphicx"
     "latex2e"
     "art10"
     "article"
     "")))

