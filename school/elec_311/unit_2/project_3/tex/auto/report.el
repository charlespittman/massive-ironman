(TeX-add-style-hook "report"
 (lambda ()
    (LaTeX-add-labels
     "sec:objective"
     "sec:procedure"
     "sec:results"
     "tab:truth"
     "fig:k_map"
     "fig:circuit"
     "fig:circuit_nand")
    (TeX-run-style-hooks
     "graphicx"
     "latex2e"
     "art10"
     "article"
     "")))

