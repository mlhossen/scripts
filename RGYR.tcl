#set mol [mol new "../step3_pbcsetup.xplor.psf" waitfor all]


#set mol [mol new "ionized.psf" waitfor all]
#mol addfile "step5_production.dcd" molid $mol step 1  waitfor all
#mol addfile "150.dcd" molid $mol step 1  waitfor all


#pbc unwrap -sel "protein or resname LIP"


#pbc wrap -centersel "protein or resname LIP" -center com -compound residue -all
#pwd





set nf [molinfo top get numframes]
set outfile "RGYR_pro_smallDNA.dat"
set out [open $outfile w]
set sel [atomselect top "protein"]
for {set i 0} {$i < $nf} {incr i} {
$sel frame $i
$sel update
puts $i
puts $out [measure rgyr $sel]
}
close $out
$sel delete

