(TeX-add-style-hook "report"
 (lambda ()
    (LaTeX-add-labels
     "sec:objective"
     "sec:schematics"
     "sec:ckt_tested"
     "fig:circuit"
     "sec:test_config"
     "fig:test_config"
     "sec:procedure"
     "sec:results"
     "tab:table_01"
     "tab:table_02"
     "sec:conclusion"
     "eqn:percent_error"
     "eqn:R_o"
     "eqn:R_i"
     "eqn:A_v"
     "eqn:A_i"
     "eqn:G_m"
     "eqn:R_m"
     "sec:appendix"
     "fig:amp_models")
    (TeX-run-style-hooks
     "siunitx"
     "graphicx"
     "latex2e"
     "art10"
     "article"
     "")))

