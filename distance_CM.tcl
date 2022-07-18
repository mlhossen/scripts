#set mol [mol new "ionized.psf" waitfor all]
#mol addfile "md_pcv_0_25ns.dcd" molid $mol step 100  waitfor all
#mol addfile "md_pcv_20_25ns.dcd" molid $mol  waitfor all
#set nf [molinfo $mol get numframes]

set sel1 [atomselect top "segname DNAA and resid 40 to 42 and name P"]
set sel2 [atomselect top "segname DNAB and resid 41 to 43 and name P"]
set outfile [open "distance_N_C.dat" w]

for {set i 0} {$i < 1250} {incr i} {
puts "frame $i "
$sel1 frame $i
$sel2 frame $i
set com1 [measure center $sel1 weight mass]
set com2 [measure center $sel2 weight mass] 
set distance [veclength [vecsub $com1 $com2]]
puts $outfile "$distance"
}
close $outfile
exit

