
#use this script if there are multiple chains in the pdb file
#to see all the chains while visualize in the pdbqt on PyMol. Otherwise use create_pdb_0.tcl script.
 
for {set i 0} {$i <= 99} {set i [expr $i +1]} {
#mol load pdb $i.pdb
set all [atomselect top "protein" frame $i]
set proa [atomselect top "segname PROA"]
$proa set chain A
set prob [atomselect top "segname PROB"]
$prob set chain B
set proc [atomselect top "segname PROC"]
$proc set chain C
set prod [atomselect top "segname PROD"]
$prod set chain D
set proe [atomselect top "segname PROE"]
$proe set chain E  
$all writepdb $i.pdb
 }
