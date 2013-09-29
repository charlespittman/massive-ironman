(TeX-add-style-hook "report"
 (lambda ()
    (LaTeX-add-labels
     "sec:objective"
     "sec:equipment"
     "sec:schematics"
     "fig:volt_rect"
     "fig:volt_reg"
     "fig:circuits_tested"
     "sec:procedure"
     "sec:rectifier"
     "sec:volt_reg"
     "sec:results"
     "tab:rect_vp_vdc"
     "tab:load_v_ripple"
     "fig:rect_vp_vdc"
     "tab:volt_reg_calc"
     "tab:volt_reg_meas"
     "tab:volt_reg_diff"
     "sec:conclusion"
     "sec:equations"
     "eq:percent_diff"
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
     ""
     "rect_vp_vdc")))

