(TeX-add-style-hook "report"
 (lambda ()
    (LaTeX-add-labels
     "sec:objective"
     "sec:schematics"
     "sec:ckt_tested"
     "fig:circuit1"
     "fig:circuit2"
     "sec:procedure"
     "sec:results"
     "sec:result_a"
     "fig:part_a_graph"
     "fig:part_a_graph2"
     "sec:result_b"
     "tab:part_b"
     "sec:conclusion"
     "sec:appendix")
    (TeX-run-style-hooks
     "siunitx"
     "graphicx"
     "latex2e"
     "art10"
     "article"
     ""
     "part_a"
     "part_a2")))

