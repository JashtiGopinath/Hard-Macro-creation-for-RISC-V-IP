create_lib -technology ref/tech/saed32nm_1p9m.tf -ref_libs {ref/CLIBs/saed32_1p9m_tech.ndm ref/CLIBs/saed32_hvt.ndm ref/CLIBs/saed32_lvt.ndm ref/CLIBs/saed32_rvt.ndm ref/CLIBs/saed32_sram_lp.ndm} alu.dlib

analyze -format verilog { msrv32_alu.v }
elaborate msrv32_alu
set_top_module msrv32_alu

read_parasitic_tech -name { saed32nm_lp9m_Cmin.lv.tluplus } -tlup {ref/tech/saed32nm_1p9m_Cmin.lv.tluplus} -layermap {ref/tech/saed32nm_tf_itf_tluplus.map}


