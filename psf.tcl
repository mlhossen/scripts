package require psfgen
resetpsf
set result [eval exec grep -e "PROA" [glob 1.pdb] > PROA.pdb ]
set result [eval exec grep -e "MEMB" [glob 1.pdb] > MEMB.pdb ]
set result [eval exec grep -e "TIP3" [glob 1.pdb] > TIP3.pdb ]
set result [eval exec grep -e "SOD" [glob 1.pdb] > SOD.pdb ]
set result [eval exec grep -e "CLA" [glob 1.pdb] > CLA.pdb ]



topology DPA_final_2.rtf
topology DPG_final_2.rtf
topology DPI_final_2.rtf
topology top_all36_prot.rtf
topology toppar_water_ions.str

patch ASP PROA:184
patch GLU PROA:331
patch GLU PROA:163

pdbalias atom ILE CD1 CD
pdbalias residue HIS HSD


segment PROA {
pdb PROA.pdb}
coordpdb PROA.pdb PROA

segment MEMB {
pdb MEMB.pdb}
coordpdb MEMB.pdb MEMB

segment SOD {
pdb SOD.pdb}
coordpdb SOD.pdb SOD

segment CLA {
pdb CLA.pdb}
coordpdb CLA.pdb CLA

segment TIP3 {
pdb TIP3.pdb}
coordpdb TIP3.pdb TIP3

guesscoord

regenerate angles dihedrals
exec rm -f solvated.psf
exec rm -f solvated.pdb

writepsf ionized.psf
writepdb ionized.pdb

