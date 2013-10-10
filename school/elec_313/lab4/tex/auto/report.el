(TeX-add-style-hook "report"
 (lambda ()
    (LaTeX-add-labels
     "sec:objective"
     "sec:equipment"
     "sec:schematics"
     "sec:procedure"
     "sec:part_one"
     "sec:part_two"
     "sec:results"
     "tab:logic"
     "tab:duty"
     "sec:comp_of_res"
     "sec:conclusion"
     "sec:equations"
     "eq:percent_diff"
     "eq:ripple"
     "eq:volt_reg")
    (TeX-run-style-hooks
     "subcaption"
     "siunitx"
     "amsmath"
     "multicol"
     "graphicx"
     "latex2e"
     "art10"
     "article"
     "")))

