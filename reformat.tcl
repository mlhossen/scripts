# must specify an input file containg your pdb named "input.pdb"
mol new input.pdb
set all [atomselect top all]
#set anion [atomselect top "serial 9 to 23"]

set fileList { AtomName ElementSymbol }
set propertyList { name element }

for { set index 0 } { $index <= [expr [llength $fileList] - 1] } { incr index } {
	set fileName [lindex $fileList $index]
	set property [lindex $propertyList $index]
	
	set fid [ open $fileName.txt r]
	set propertyData [read $fid]
	close $fid
	
	$all set $property $propertyData
}

# change resname resid and segname only
$all set altloc \"\"
$all set resname ETH
$all set resid 1
$all set segname ET1

$all writepdb new.pdb