##########################################################################################
# Lab 1 - Reading RTL
# Script: run.tcl
##########################################################################################

source -echo ./setup.tcl

create_lib -technology $TECH_FILE -ref_libs $REFERENCE_LIBRARY alu_HM.dlib

analyze -format verilog [glob rtl/*.v]

elaborate msrv32_alu
set_top_module msrv32_alu

source scripts/tech_setup.tcl

load_upf ./design_data/alu.upf
commit_upf

source ./design_data/alu_constraints.tcl

set_qor_strategy -stage synthesis -metric total_power
set_app_options -name opt.power.mode -value total

set_dont_touch [get_lib_cells */TIE*] false
set_lib_cell_purpose -include optimization [get_lib_cells */TIE*]

set_auto_floorplan_constraints -core_utilization 0.7 -side_ratio {1 2} -core_offset 10

set_block_pin_constraints -self -allowed_layers "M3 M4 M5 M6"

compile_fusion -from initial_map -to initial_map

report_clock_gating

compile_fusion -from logic_opto -to logic_opto

compile_fusion -from initial_place -to initial_place

report_design

compile_fusion -from logic_opto -to logic_opto

check_legality

compile_fusion -from final_place -to final_place

check_legality

save_lib
exit
