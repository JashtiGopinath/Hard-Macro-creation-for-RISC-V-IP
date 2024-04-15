lappend search_path scripts design_data

set TECH_FILE     "/home/WBPD04/JashtiG/VLSI_PD/Fusion_compiler_labs/FC_LABS_handsOn/Macro_projects/RISC/ref/tech/saed32nm_1p9m.tf"
set REFLIB        "/home/WBPD04/JashtiG/VLSI_PD/Fusion_compiler_labs/FC_LABS_handsOn/Macro_projects/RISC/ref/CLIBs"

set REFERENCE_LIBRARY [join "
    $REFLIB/saed32_hvt.ndm
    $REFLIB/saed32_lvt.ndm
    $REFLIB/saed32_rvt.ndm
"]
