#for both average and standard deviation###################################################
#in {a[FNR]+=$2, $2 is column number I want to do the average for different files, in c[FNR]+=$2*$2, here $2 also comes from previous column number. Both need to be changed if we want to calculate same for different column.
awk '{a[FNR]+=$2; b[FNR]++; c[FNR]+=$2*$2 } 
     END{
        for(i=1;i<=FNR;i++)
          print a[i]/b[i],	sqrt((c[i]-a[i]*a[i]/b[i])/(b[i]-1)) ;
     }
' *.tsv > ave_std.dat


#only for average#########################################################################
#awk '{a[FNR]+=$2;b[FNR]++;}END{for(i=1;i<=FNR;i++)print i,a[i]/b[i];}' *.tsv > average.dat
