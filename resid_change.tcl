set num_replicas 50

for {set i 1} {$i <+ $num_replicas} {set i [expr {$i + 1}]} {

set in1 [open "step1_pdbreader.pdb" r]
set out [open "0000.pdb" w]
set sel [atomselect top "nucleic"]
$sel set resid $i
puts $out "set num $i"
  while { [gets $in1 line] >= 0} {
      puts $out "$i"
    } else {
    puts $out $line
  }
  close $out
}


