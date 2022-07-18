
#use this script if there are multiple chains in the pdb file
#to see all the chains while visualize in the pdbqt on PyMol. Otherwise use create_pdb_0.tcl script.
 
for {set i 179} {$i <= 199} {set i [expr $i +5]} {
#mol load pdb $i.pdb
set all [atomselect top "protein" frame $i]
set proa [atomselect top "segname PROA"]
$proa set chain A
set prob [atomselect top "segname PROB"]
$prob set chain B
set 1 [atomselect top "resname ILE and name CD"]
$1 set name CD1
set 2 [atomselect top "resname HSD"]
$2 set resname HIS
set 3 [atomselect top "protein and name OT1"]
$3 set name O
set 4 [atomselect top "protein and name OT2"]
$4 set name OXT
#set proc [atomselect top "segname PROC"]
####set proe [atomselect top "segname PROE"]
$all writepdb $i.pdb
 }
