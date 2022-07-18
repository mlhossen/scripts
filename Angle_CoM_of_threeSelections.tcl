proc angle {D H A} {
  global M_PI
  
  # split coordinates
  set d_x [lindex $D 0]; set d_y [lindex $D 1]; set d_z [lindex $D 2];
  set h_x [lindex $H 0]; set h_y [lindex $H 1]; set h_z [lindex $H 2];
  set a_x [lindex $A 0]; set a_y [lindex $A 1]; set a_z [lindex $A 2];

  # setup vectors hd and ha
  set hd_x [expr $d_x - $h_x];
  set hd_y [expr $d_y - $h_y];
  set hd_z [expr $d_z - $h_z];

  set ha_x [expr $a_x - $h_x];
  set ha_y [expr $a_y - $h_y];
  set ha_z [expr $a_z - $h_z];

  # compute cosine
  set cosine [expr \
    ($hd_x*$ha_x + $hd_y*$ha_y + $hd_z*$ha_z) / \
    (sqrt(pow($hd_x,2) + pow($hd_y,2) + pow($hd_z,2)) * \
     sqrt(pow($ha_x,2) + pow($ha_y,2) + pow($ha_z,2)))];

  # convert cosine to angle in degrees
  set angle [expr acos($cosine)*(180.0/$M_PI)] 
 return $angle;
} 


set out [open angle.dat w]
for {set i 0} {$i < 4328} {incr i} {

set sel1 [atomselect top "segname PROA and resid 416 417 418 419 420 421 272 273 274 360 359 356 355 354 353 and name CA" frame $i] 
set 1st [measure center $sel1]

set sel2 [atomselect top "segname PROA and z<-20" frame $i] 
set 2nd [measure center $sel2]

set sel3 [atomselect top "segname PROA and resid 127 128 129 130 131 41 42 43 44 45 46 47 48 49 50 184 92 and name CA" frame $i] 
set 3rd [measure center $sel3]

set anlo [angle $1st $2nd $3rd]
puts "$anlo   >>>> printing"
puts $out $anlo
} 
close $out
