(TeX-add-style-hook "report"
 (lambda ()
    (LaTeX-add-labels
     "sec:objective"
     "sec:schematics"
     "sec:ckt_tested"
     "sec:test_config"
     "sec:procedure"
     "sec:results"
     "sec:result_a"
     "sec:conclusion"
     "sec:appendix"
     "eqn:percent_error"
     "eqn:R_o"
     "eqn:R_i"
     "eqn:A_v"
     "eqn:A_i"
     "eqn:G_m"
     "eqn:R_m")
    (TeX-run-style-hooks
     "siunitx"
     "graphicx"
     "latex2e"
     "art10"
     "article"
     "")))

