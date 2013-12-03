
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name project2 -dir "/home/cpittman/project2/planAhead_run_2" -part xc3s100ecp132-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "circuit_nand.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {circuit_nand.vhf}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top circuit_nand $srcset
add_files [list {circuit_nand.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s100ecp132-4
