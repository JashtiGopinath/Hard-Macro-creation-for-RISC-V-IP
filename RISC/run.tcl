##########################################################################################
# Lab 1 - Reading RTL
# Script: run.tcl
##########################################################################################

source -echo ./setup.tcl

create_lib -technology $TECH_FILE -ref_libs $REFERENCE_LIBRARY risc_1.nlib

set_ref_libs -add alu1.ndm

set_ref_libs -add counter.ndm

analyze -format verilog [glob RISC_V/*.v]

elaborate msrv32_top

set_top_module msrv32_top

source scripts/tech_setup.tcl

load_upf ./design_data/risc.upf
commit_upf

source ./design_data/risc_constraints.tcl

set_qor_strategy -stage synthesis -metric total_power
set_app_options -name opt.power.mode -value total

set_dont_touch [get_lib_cells */TIE*] false
set_lib_cell_purpose -include optimization [get_lib_cells */TIE*]

set_auto_floorplan_constraints -core_utilization 0.7 -side_ratio {1 1} -core_offset 5

set_block_pin_constraints -self -allowed_layers "M3 M4 M5 M6"

compile_fusion -from initial_map -to initial_map

compile_fusion -from logic_opto -to logic_opto

compile_fusion -from initial_place -to initial_place

place_pins -self

compile_fusion -from logic_opto -to logic_opto

check_legality

compile_fusion -from final_place -to final_place

check_legality
#pg prototyping M9=25.000% M8=2.500%
check_pg_drc

route_auto
save_block
save_lib
exit