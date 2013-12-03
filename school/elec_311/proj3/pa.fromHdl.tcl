
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name proj3 -dir "/home/cpittman/proj3/planAhead_run_1" -part xc3s100ecp132-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "circuit.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {project3_gates.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {circuit.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top circuit $srcset
add_files [list {circuit.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s100ecp132-4
