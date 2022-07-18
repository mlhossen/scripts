set fp [open "rmsf_in_np_stride10_last50ns_100ns.dat" w]
set sel [atomselect top "protein and name CA"]
for {set i 0} {$i < [$sel num]} {incr i} {
set rmsf [measure rmsf $sel first 250 last 499 step 1]
puts $fp "[expr {$i+1}] [lindex $rmsf $i]"
}
close $fp

#for loop is for residue number and in measure rmsf first and last indicate 
#steps for which we want to count the rmsf.
