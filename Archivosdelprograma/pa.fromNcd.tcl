
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name Archivosdelprograma -dir "C:/Users/reymy/Documents/quinto/arquitortura/Archivosdelprograma/planAhead_run_4" -part xc6slx16csg324-3
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "C:/Users/reymy/Documents/quinto/arquitortura/Archivosdelprograma/ArchivoDeRegistros.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/reymy/Documents/quinto/arquitortura/Archivosdelprograma} }
set_property target_constrs_file "ArchivoDeRegistros.ucf" [current_fileset -constrset]
add_files [list {ArchivoDeRegistros.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "C:/Users/reymy/Documents/quinto/arquitortura/Archivosdelprograma/ArchivoDeRegistros.ncd"
if {[catch {read_twx -name results_1 -file "C:/Users/reymy/Documents/quinto/arquitortura/Archivosdelprograma/ArchivoDeRegistros.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"C:/Users/reymy/Documents/quinto/arquitortura/Archivosdelprograma/ArchivoDeRegistros.twx\": $eInfo"
}
