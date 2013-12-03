
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name project2 -dir "/home/cpittman/project2/planAhead_run_2" -part xc3s100ecp132-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/cpittman/project2/circuit_nand.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/cpittman/project2} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "circuit_nand.ucf" [current_fileset -constrset]
add_files [list {circuit_nand.ucf}] -fileset [get_property constrset [current_run]]
link_design
