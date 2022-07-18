awk '{a[FNR]+=$2;b[FNR]++;}END{for(i=1;i<=FNR;i++)print i,a[i]/b[i];}' *.tsv > average.dat
