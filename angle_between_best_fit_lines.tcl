# Set of scripts to:
#  fit atoms in a selection to a vector; 
#  find the angle made by that vector with another vector; and
#  do this for all timesteps in a trajectory.
#  source the script on vmd tk console and then give the atoms selection like this: sel_sel_angle_frames 0 "name C4 C8 C9 N4" "name N3 C3 N4"
#
# Justin Gullingsrud
# justin@ks.uiuc.edu



#  Fit the points x to x = ai + b, i=0...N-1, and return the value of a 
# a = 12/( (N(N^2 - 1)) ) sum[ (i-(N-1)/2) * xi]
# reference: Bevington
proc lsq { x } {
  set N [llength $x]
  set xtot 0
  set d [expr {0.5*($N-1)}]
  
  set i 0.0
  foreach elem $x {
    set xtot [expr {$xtot + ($i - $d) * $elem}]
    set i [expr {$i + 1.0}]
  }
  
# no need to normalize if all we want is the direction
#  set xtot [expr $xtot * 12 / ($N * ($N * $N - 1))]
  return $xtot
}    

# Given an atom selection and a vector, find the angle with the vector made by 
# the best-fit line through the atom coordinates. 

proc sel_angle { sel vec } {

# Find the best fit line for x, y, and z coordinates
# Normalize it as well
  set fitvec [vecnorm [list [lsq [$sel get x]] [lsq [$sel get y]] [lsq [$sel get z]]]]

# Assume the given vector is normalized!!
# Compute acos of the cos and return answer in degrees
  set costheta [vecdot $fitvec $vec]
  set angle [expr 180 * acos($costheta) / 3.14159] 

  return $angle
}

# Find the angle between the best fit lines through the two given selections

proc sel_sel_angle { sel1 sel2 } {
  set x1 [$sel1 get x]
  set y1 [$sel1 get y]
  set z1 [$sel1 get z]

  set x2 [$sel2 get x]
  set y2 [$sel2 get y]
  set z2 [$sel2 get z]

  set xa1 [lsq $x1]
  set ya1 [lsq $y1]
  set za1 [lsq $z1]

  set xa2 [lsq $x2]
  set ya2 [lsq $y2]
  set za2 [lsq $z2]

  set anorm1 [expr sqrt($xa1 * $xa1 + $ya1 * $ya1 + $za1 * $za1)]
  set anorm2 [expr sqrt($xa2 * $xa2 + $ya2 * $ya2 + $za2 * $za2)]
   
  set xa1 [expr $xa1 / $anorm1]
  set ya1 [expr $ya1 / $anorm1]
  set za1 [expr $za1 / $anorm1]
 
  set xa2 [expr $xa2 / $anorm2]
  set ya2 [expr $ya2 / $anorm2]
  set za2 [expr $za2 / $anorm2]

  set costheta [expr $xa1 * $xa2 + $ya1 * $ya2 + $za1 * $za2]
  set angle [expr 180 * acos($costheta) / 3.14159]
  return $angle
}
 
#################

# Compute the angle for all frames

proc sel_angle_frames { mol seltext vec } {
  set anglelist {}
  set N [molinfo $mol get numframes]
  set sel [atomselect $mol $seltext]
  for { set i 0 } {$i < $N} {incr i} {
    puts $i  
    $sel frame $i
    lappend anglelist [sel_angle $sel $vec]
  }
  $sel delete
  return $anglelist
}


proc sel_sel_angle_frames {mol seltext1 seltext2} {     #selection should be like this: sel_sel_angle_frames 0 "name C4 C8 C9 N4" "name N3 C3 N4"
  set anglelist {}
  set N [molinfo $mol get numframes]
 #chola added
  set output [open fit_angle.dat w] 
 #
  set sel1 [atomselect $mol $seltext1]
  set sel2 [atomselect $mol $seltext2]
  for { set i 0 } { $i < $N } { incr i} {
    $sel1 frame $i
    $sel2 frame $i
  #chola added to output frame no and angle
    puts $output "$i \t [sel_sel_angle $sel1 $sel2]"
  #
    lappend anglelist [sel_sel_angle $sel1 $sel2]
  }
  $sel1 delete
  $sel2 delete
 #chola added
  close $output
 #
  #return $anglelist
}

proc sel_rot_angle_frames { mol seltext } {
  set sel0 [atomselect $mol $seltext frame 0]
  set fitvec [vecnorm [list [lsq [$sel0 get x]] [lsq [$sel0 get y]] [lsq [$sel0 get z]]]]
  set mat0 [transvecinv $fitvec]
  $sel0 move $mat0 

  set sel [atomselect $mol $seltext]
  set N [molinfo $mol get numframes]
  for { set i 1 } { $i < $N } { incr i } {
    $sel frame $i
    set fitvec [vecnorm [list [lsq [$sel get x]] [lsq [$sel get y]] [lsq [$sel get z]]]]
    set mat [transvecinv $fitvec]
    $sel move $mat 
    # Fitmat moves original onto current step.
    set fitmat [measure fit $sel0 $sel]
    #set costheta [lindex [lindex $fitmat 1] 1]
    #if { $costheta > 1 || $costheta < -1 } {
      #puts "frame $i: costheta = $costheta"
      #lappend result 0
    #} else {
      #lappend result [expr {180*acos($costheta)/3.14159}]
    #}
    set sintheta [lindex [lindex $fitmat 2] 1]
    if { $sintheta > 1 || $sintheta < -1 } {
      puts "frame $i: sintheta = $sintheta"
      lappend result 0
    } else {
      lappend result [expr {180*asin($sintheta)/3.14159}]
    }
    $sel move [measure inverse $mat]
  }
  $sel0 move [measure inverse $mat0]
  return $result
}

