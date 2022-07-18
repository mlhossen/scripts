package require hbonds
set mol [mol new ionized.psf type psf waitfor all]
#mol addfile "500.dcd" type dcd first 0 last -1 step 1  waitfor all $mol #this is for all frames
#mol addfile "500.dcd" type dcd first 0 last -1 step 1  waitfor all $mol #this is for selected frames
set sel1 [atomselect top "protein"]
set sel2 [atomselect top "water"]
hbonds -sel1 $sel1 -sel2 $sel2 -writefile yes -upsel yes -frames all -dist 3.5 -ang 30 -plot no -outfile HB.dat -polar yes -DA both -type all -detailout HBdetail.dat




