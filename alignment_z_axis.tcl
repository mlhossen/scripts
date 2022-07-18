#go https://www.ks.uiuc.edu/Research/vmd/script_library/scripts/orient/ , follow instructions in vmd tk console
#open vmd, after giving right name of the pdb file, in tk console type: source alignment_z_axis.tcl 
#for a whole bunch of pdbs#########################
package require Orient
namespace import Orient::orient

for {set i 1} {$i <= 19} {incr i} {
mol load pdb $i.pdb
set sel [atomselect top all]
set I [draw principalaxes $sel]
set A [orient $sel [lindex $I 2] {0 0 1}]
$sel move $A
set I [draw principalaxes $sel]
set A [orient $sel [lindex $I 1] {0 1 0}]
$sel move $A
set I [draw principalaxes $sel]
$sel writepdb $i.pdb
}


#for a single pdb###################################
#package require Orient
#namespace import Orient::orient

#mol load pdb before_alignment.pdb
#set sel [atomselect top all]
#set I [draw principalaxes $sel]
#set A [orient $sel [lindex $I 2] {0 0 1}]
#$sel move $A
#set I [draw principalaxes $sel]
#set A [orient $sel [lindex $I 1] {0 1 0}]
#$sel move $A
#set I [draw principalaxes $sel]
#$sel writepdb after_alignment.pdb

