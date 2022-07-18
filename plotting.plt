set term xterm
set term postscript enhanced color solid 30
set encoding iso_8859_1
#set title "TMD-RMSD plot for outward-facing to inward-facing conformation of MATE family transporter " enhanced font "Helvetica,13"
set xr[0:2250]
set yr[14:20]
#set mxtics 100
#unset key
set xlabel "Time (ns)" font "Times-Roman, 40" offset 1,0.25,0
set ylabel "Radius of Gyration ({/Helvetica=35 \305})" font "Times-Roman, 40" offset 1.25, 0, 0
set xtics font "Times-Roman, 40" offset 0,0.25,0
set ytics font "Times-Roman, 40" offset 0.75,0,0 
set xtics ( "0" 0, "10" 500, "20" 1000 , "30" 1500, "40" 2000, "45" 2250) 
#set ytics (13 , 13.4 , 13.8, 14.2, 14.6) 
set key font "Times-Roman, 10" 

#plot "48.5_66.7_60_0.0001_300_0_SARS_ACE2.pmf" u ($1):($2) w l lw 2 lc rgb "red" title "sars-ace2"
#replot "49.6_66.6_60_0.0001_300_0_MERS_DPP4.pmf" u ($1-1.09):($2) w l lw 2 lc rgb "blue" title "mers-dpp4"
#replot "54.2_70.9_60_0.0001_300_0_nCoV_DPP4.pmf" u ($1-5.69):($2) w l lw 2 lc rgb "black" title "ncov-dpp4"

plot "RGYR_pro_smallDNA.dat" w l lw 3 lc rgb "orange" title "RGYR for HMGA2 small DNA system "
#replot "ave30_in_np_stride10_100ns_onlytotalenergy.dat" w l lw 2 lc rgb "blue" title "in-np" 
#replot "ave30_in_p_stride10_100ns_onlytotalenergy.dat" w l lw 2 lc rgb "red" title "in-p"
#replot "ave30_out_np_stride10_100ns_onlytotalenergy.dat" w l lw 2 lc rgb "green" title "out-np" 
#replot "ave30_out_p_stride10_100ns_onlytotalenergy.dat" w l lw 2 lc rgb "black" title "out-p"
set out "rgyr.ps"
replot
exit
