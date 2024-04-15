read_parasitic_tech -layermap ref/tech/saed32nm_tf_itf_tluplus.map -tlup ref/tech/saed32nm_1p9m_Cmax.lv.nxtgrd -name maxTLU
read_parasitic_tech -layermap ref/tech/saed32nm_tf_itf_tluplus.map -tlup ref/tech/saed32nm_1p9m_Cmin.lv.nxtgrd -name minTLU

set_attribute [get_site_defs unit] symmetry Y
set_attribute [get_site_defs unit] is_default true

suppress_message ATTR-12
set_attribute [get_layers {M1 M3 M5 M7 M9}] routing_direction horizontal
set_attribute [get_layers {M2 M4 M6 M8 MRDL}] routing_direction vertical
unsuppress_message ATTR-12

set_ignored_layers -max_routing_layer M9

return 1
