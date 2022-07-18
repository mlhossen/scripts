package require psfgen
resetpsf

readpsf 1_ionized.psf
readpsf ionized.psf

coordpdb 1_ionized.pdb
coordpdb ionized.pdb

writepsf merged_ionized.psf
writepdb merged_ionized.pdb

mol load psf merged_ionized.psf pdb merged_ionized.pdb

