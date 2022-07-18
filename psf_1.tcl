package require psfgen
resetpsf
set result [eval exec grep -e "PROA" [glob 5proteins_revised.pdb] > PROA.pdb ]
set result [eval exec grep -e "PROB" [glob 5proteins_revised.pdb] > PROB.pdb ]
set result [eval exec grep -e "PROD" [glob 5proteins_revised.pdb] > PROD.pdb ]
set result [eval exec grep -e "PROC" [glob 5proteins_revised.pdb] > PROC.pdb ]
set result [eval exec grep -e "PROE" [glob 5proteins_revised.pdb] > PROE.pdb ]
#set result [eval exec grep -e "G9" [glob 5proteins_revised.pdb] > G9.pdb ]
set result [eval exec grep -e "LIGA" [glob 5proteins_revised.pdb] > LIGA.pdb ]
#set result [eval exec grep -e "G33" [glob 5proteins_revised.pdb] > G33.pdb ]
set result [eval exec grep -e "LIGB" [glob 5proteins_revised.pdb] > LIGB.pdb ]
#set result [eval exec grep -e "G56" [glob 5proteins_revised.pdb] > G56.pdb ]
set result [eval exec grep -e "LIGC" [glob 5proteins_revised.pdb] > LIGC.pdb ]



topology top_all36_carb.rtf
topology top_all36_cgenff.rtf
topology top_all36_lipid.rtf
topology top_all36_na.rtf
topology top_all36_prot.rtf
topology top_interface.rtf
topology toppar_all36_carb_glycopeptide.str
topology lig.rtf

pdbalias atom ILE CD1 CD
pdbalias residue HIS HSD
pdbalias residue ANE5  ANE5AC


segment PROA {
pdb PROA.pdb
mutate 339 ASP
mutate 371 LEU
mutate 373 PRO
mutate 375 PHE
mutate 417 ASN
mutate 440 LYS
mutate 446 SER
mutate 477 ASN
mutate 478 LYS
mutate 484 ALA
mutate 493 ARG
mutate 496 SER
mutate 498 ARG
mutate 501 TYR
mutate 505 HSD
}
coordpdb PROA.pdb PROA

segment LIGA {
pdb LIGA.pdb
}
coordpdb LIGA.pdb LIGA

patch NGLB PROA:343 LIGA:1

segment PROB {
pdb PROB.pdb
mutate 339 ASP
mutate 371 LEU
mutate 373 PRO
mutate 375 PHE
mutate 417 ASN
mutate 440 LYS
mutate 446 SER
mutate 477 ASN
mutate 478 LYS
mutate 484 ALA
mutate 493 ARG
mutate 496 SER
mutate 498 ARG
mutate 501 TYR
mutate 505 HSD
}
coordpdb PROB.pdb PROB

segment LIGB {
pdb LIGB.pdb
}
coordpdb LIGB.pdb LIGB

patch NGLB PROB:343 LIGB:1

segment PROD {
pdb PROD.pdb}
coordpdb PROD.pdb PROD

segment PROC {
pdb PROC.pdb
mutate 339 ASP
mutate 371 LEU
mutate 373 PRO
mutate 375 PHE
mutate 417 ASN
mutate 440 LYS
mutate 446 SER
mutate 477 ASN
mutate 478 LYS
mutate 484 ALA
mutate 493 ARG
mutate 496 SER
mutate 498 ARG
mutate 501 TYR
mutate 505 HSD
}
coordpdb PROC.pdb PROC

segment LIGC {
pdb LIGC.pdb
}
coordpdb LIGC.pdb LIGC

patch NGLB PROC:343 LIGC:1

segment PROE {
pdb PROE.pdb}
coordpdb PROE.pdb PROE

patch DISU PROA:336 PROA:361
patch DISU PROA:379 PROA:432
patch DISU PROA:391 PROA:525
patch DISU PROA:480 PROA:488
patch DISU PROB:336 PROB:361
patch DISU PROB:379 PROB:432
patch DISU PROB:391 PROB:525
patch DISU PROB:480 PROB:488
patch DISU PROC:336 PROC:361
patch DISU PROC:379 PROC:432
patch DISU PROC:391 PROC:525
patch DISU PROC:480 PROC:488
 
##; forward
#patch NGLB PROA:343 LIGA:1
#patch NGLB PROA:331 CARB:1
#patch NGLB PROB:343 LIGB:1
#patch NGLB PROB:53 CARD:1
#patch NGLB PROC:343 LIGC:1
#patch NGLB PROB:546 CARF:1 


guesscoord

regenerate angles dihedrals
#exec rm -f solvated.psf
#exec rm -f solvated.pdb

writepsf ionized_3.psf
writepdb ionized_3.pdb

