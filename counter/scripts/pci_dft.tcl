# Gate-level DFT? 
# --> set the following app option, then source the script after compile_fusion -to logic_opto
# set_app_options -name dft.insertion_post_logic_opto -value true

# DFT signals
set_dft_signal -view existing_dft -type ScanClock -port {clock}    -timing [list 45 55]



# Scan in, out, enable
set_dft_signal -view spec -type ScanEnable -port scan_en
set_dft_signal -view spec -type TestMode -port test_mode
foreach i {0 1} {
set_dft_signal -view spec -type ScanDataIn -port pad_in[$i]
set_dft_signal -view spec -type ScanDataOut -port pad_out[$i]
}

# scan chain setup
set_scan_configuration -chain_count 2 -clock_mixing mix_clocks

set_dft_configuration -scan_compression enable
# compression specification
set_scan_compression_configuration -input 2 -output 2 -chain_count 4
set_scan_configuration -test_mode ScanCompression_mode -clock_mixing mix_clocks
set_app_options -name place.coarse.continue_on_missing_scandef -value true

#create_test_protocol

#preview_dft
#insert_dft ;# DFT IP insertion

### the following can only be run after scan chains have been inserted
#

# dft_drc -coverage_estimate -test_mode Internal_scan
# dft_drc -coverage_estimate -test_mode ScanCompression_mode

# For ATPG:
# write_test_protocol -output scan_compressed.spf -test_mode ScanCompression_mode
# write_test_protocol -output scan_internal.spf -test_mode Internal_scan




