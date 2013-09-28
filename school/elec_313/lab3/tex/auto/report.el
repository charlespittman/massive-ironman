(TeX-add-style-hook "report"
 (lambda ()
    (LaTeX-add-labels
     "sec:objective"
     "sec:equipment"
     "sec:schematics"
     "fig:circuit1"
     "fig:circuit2"
     "fig:circuits_tested"
     "sec:procedure"
     "sec:rectifier"
     "tab:rect_vp_vdc"
     "tab:load_v_ripple"
     "sec:volt_reg"
     "sec:results"
     "fig:rect_vp_vdc"
     "sec:conclusion"
     "sec:equations"
     "eq:percent_diff"
     "eq:schockley"
     "eq:m")
    (TeX-run-style-hooks
     "subcaption"
     "siunitx"
     "amsmath"
     "multicol"
     "graphicx"
     "latex2e"
     "art10"
     "article"
     ""
     "rect_vp_vdc")))

