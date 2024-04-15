#@ # 
#@ # Running fc_shell Version U-2022.12-SP6 for linux64 -- Aug 25, 2023
#@ # Date:   Thu Feb 29 00:08:37 2024
#@ # Run by: JashtiG@mavenserver-RH1
#@ 

gui_set_pref_value -category {SelectByNamePalette} -key {ObjectType} -value {Logical Cells}
create_lib -technology ref/tech/saed32nm_1p9m.tf -ref_libs { ref/CLIBs/saed32_hvt.ndm ref/CLIBs/saed32_lvt.ndm ref/CLIBs/saed32_rvt.ndm ref/CLIBs/saed32_sram_lp.ndm } risc.nlib
set_ref_libs -add alu1.ndm
analyze -format verilog [glob router_rtl/* .v]
analyze -format verilog [glob RISC_V/*.v]
analyze -format verilog [glob RISC_V/*.v]
elaborate msrv32_top
set_top_module msrv32_top
set_top_module msrv32_top
source scripts/tech_setup.tcl
read_parasitic_tech -layermap ref/tech/saed32nm_tf_itf_tluplus.map -tlup ref/tech/saed32nm_1p9m_Cmax.lv.nxtgrd -name maxTLU
read_parasitic_tech -layermap ref/tech/saed32nm_tf_itf_tluplus.map -tlup ref/tech/saed32nm_1p9m_Cmin.lv.nxtgrd -name minTLU
set_attribute [get_site_defs unit] symmetry Y
et_attribute [get_site_defs unit] is_default true
set_attribute [get_site_defs unit] is_default true
suppress_message ATTR-12
set_attribute [get_layers {M1 M3 M5 M7 M9}] routing_direction horizontal
set_attribute [get_layers {M2 M4 M6 M8 MRDL}] routing_direction vertical
unsuppress_message ATTR-12
set_ignored_layers -max_routing_layer M9
return 1
load_upf design_data/risc.upf
commit_upf
source design_data/risc_constraints.tcl
report_clock
set_qor_strategy -stage synthesis -metric total_power
set_app_options -name opt.power.mode -value total
set_dont_touch [get_lib_cells */TIE*] false
set_lib_cell_purpose -include optimization [get_lib_cells */TIE*]
win_set_filter -visible -class cell -filter {assembly_die_margin clock_margin hard_macro_margin hard_margin route_blockage_margin seal_ring_margin soft_margin}
win_set_filter -visible -class pseudo_bump -filter {deleted}
win_set_filter -visible -class pseudo_tsv -filter {deleted}
win_set_filter -visible -class placement_blockage -filter {wiring} -layer {0-82}
win_set_filter -expand_cell_types {soft_macro  }
win_set_select_class -visible {cell port bound routing_blockage shaping_blockage pg_region bump_region pseudo_bump pseudo_tsv pin_blockage block_shielding topology_node topology_edge topology_repeater annotation_shape core_area die_area edit_group shape via terminal fill_cell placement_blockage }
win_set_filter -class cell -filter {array assembly_die_margin clock_margin hard_macro_margin hard_margin route_blockage_margin seal_ring_margin soft_margin}
win_set_filter -class pseudo_bump -filter {deleted}
win_set_filter -class pseudo_tsv -filter {deleted}
win_set_filter -class placement_blockage -filter {wiring} -layer {0-82}
win_set_select_class {cell port bound routing_blockage shaping_blockage pg_region bump_region pseudo_bump pseudo_tsv pin_blockage topology_node topology_edge topology_repeater annotation_shape edit_group shape via placement_blockage }
initialize_floorplan -side_ratio {1 1} -core_offset {4}
place_pins -self
compile_fusion -from initial_map -to initial_map
win_select_objects -within {{-34.045 38.624} {28.395 73.313}} -slct_targets global -slct_targets_operation clear
win_select_objects -slct_targets global -at {-42.965 12.854} -radius 0.4956
gui_mouse_tool -window [gui_get_current_window -types Layout -mru] -start MoveTool
gui_mouse_tool -window [gui_get_current_window -types Layout -mru] -add_point {-43.956 35.155} -scale 0.4956
gui_mouse_tool -window [gui_get_current_window -types Layout -mru] -add_point {-29.095 31.350} -scale 0.5043
gui_mouse_tool -window [gui_get_current_window -types Layout -mru] -add_point {47.555 47.991} -scale 0.5043
gui_mouse_tool -window [gui_get_current_window -types Layout -mru] -add_point {-34.642 29.837} -scale 0.5043
gui_mouse_tool -window [gui_get_current_window -types Layout -mru] -add_point {-40.693 81.274} -scale 0.5043
gui_mouse_tool -window [gui_get_current_window -types Layout -mru] -reset
win_select_objects -within {{74.282 58.077} {81.342 64.128}} -slct_targets global -slct_targets_operation clear
report_clock_gating
