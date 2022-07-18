proc enabletrace {} {
global vmd_frame;
trace variable vmd_frame([molinfo top]) w drawcounter
}

proc disabletrace {} {
global vmd_frame;
trace vdelete vmd_frame([molinfo top]) w drawcounter
}

proc drawcounter { name element op } {
global vmd_frame;
draw delete all
# puts "callback!"
draw color gray 
set nsperframe 1/1
set nsoffset 1
set time [format "%dns" [expr (($vmd_frame([molinfo top])) * $nsperframe) + $nsoffset]]

draw text {35 -18 -72} "$time" size 1.8 thickness 4
}

#When everything is ready for making a movie, just source this script on VMD TK console.
#Then  just type "enabletrace" on VMD TK console which is copied from the first line of this script.
#Make change in "set psperframe 1/1" to "set nsperframe 1/1" if the vidoe is nano second long.
#Thus change  all the "ps" to "ns" in the script.
#To place the frame on movie set the "draw text {35 -18 -72}" command to  "draw text {0 0 0}", it will
#show up in the center of the VMD OpennGL Display, then make necessary change to have it on right place.
#For further help see https://www.youtube.com/watch?v=bG1fAGMAQro
