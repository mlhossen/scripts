#!/usr/bin/awk -f
##moving average over the first column of a data file
BEGIN {
    P = 20;
}

{
   x = $1;	
   i = NR % P;
   MA += (x - Z[i]) / P;
   Z[i] = x;
   print MA;	
}

# try this
#awk 'BEGIN{size=50} {mod=NR%size; if(NR<=size){count++}else{sum-=array[mod]};sum+=$2;array[mod]=$2;print $1,sum/count}' combined.dat > combined_smooth.dat

# this is for average of every 3 lines of a file
#awk '{sum+=$1} (NR%3)==0{print sum/3; sum=0;}' input 
