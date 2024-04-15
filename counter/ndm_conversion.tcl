create_workspace -technology ref/tech/saed32nm_1p9m.tf -flow normal counter
read_gds results/counter.gds
check_workspace
commit_workspace -output counter.ndm
open_lib counter.ndm
open_block machine_counter.frame
