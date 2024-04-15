remove_modes -all
remove_corners -all
remove_scenarios -all

create_corner ss_125c
set_parasitic_parameters -early_spec maxTLU -late_spec maxTLU
set_process_number 0.99
set_process_label slow
set_voltage -object_list VDD 0.95
set_voltage -object_list VSS 0.0
set_temperature 125

create_mode func
create_scenario -mode func -corner ss_125c
set_scenario_status func::ss_125c -hold false

create_clock -period 4.0 -name risc_clk [get_ports {clock}]

set_clock_uncertainty 0.4 [get_clocks risc_clk]


create_mode test
create_scenario -mode test -corner ss_125c
set_scenario_status test::ss_125c -hold false -leakage_power false -dynamic_power false

current_scenario func::ss_125c
