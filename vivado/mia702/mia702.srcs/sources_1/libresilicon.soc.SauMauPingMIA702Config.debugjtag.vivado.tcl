set vc707debugjtag_vivado_tcl_dir [file dirname [file normalize [info script]]]
       add_files -fileset [current_fileset -constrset] [glob -directory $vc707debugjtag_vivado_tcl_dir {*.vc707debugjtag.xdc}]