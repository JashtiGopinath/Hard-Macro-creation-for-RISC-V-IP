## Clock Balance Groups
####################################

## CTS Cell Selection
####################################

set CTS_LIB_CELL_PATTERN_LIST "*/NBUFF*LVT */NBUFF*RVT */INVX*_LVT */INVX*_RVT */CG*RVT */CG*HVT */AOBUFX*_LVT */AOINV* */*DFF*"
set CTS_CELLS [get_lib_cells $CTS_LIB_CELL_PATTERN_LIST]
set_dont_touch $CTS_CELLS false
suppress_message ATTR-12
set_lib_cell_purpose -exclude cts [get_lib_cells]
set_lib_cell_purpose -include cts $CTS_CELLS
unsuppress_message ATTR-12

## CTS NDRs
####################################

source scripts/clock_ndr.tcl

## Timing and DRC Setup
####################################

#      Ensure that driving cells are specified on all clock ports
foreach_in_collection scen [all_scenarios] {
   current_scenario $scen
   set_driving_cell -lib_cell NBUFFX16_RVT [get_ports {clock}]
}



set_max_transition 0.15 -clock_path [get_clocks] -corners [all_corners]


# END
return 1
