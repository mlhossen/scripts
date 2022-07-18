#!/usr/bin/perl

for (0..19){
        $input=$_;
        `sed -i.bak -e  's/pdbname.pdb/$_.pdb/g' hole.inp`;
        `sed -i.bak -e  's/pdbname.sph/$_.sph/g' hole.inp`;

        print "running $_.pdb \n";
        `~/hole2/exe/hole <hole.inp> $input.txt`;
        `egrep "mid-|sampled" $input.txt > $input.tsv`;
        `~/hole2/exe/sph_process -sos -dotden 15 -color $_.sph $input.sos`;
        `~/hole2/exe/sos_triangle -s < $input.sos > $input.vmd_plot`;


        #`~/hole2/exe/sph_process -dotden 15 -color $input.sph $input.qpt`;



        `sed -i  's/$_.pdb/pdbname.pdb/g' hole.inp`;
        `sed -i  's/$_.sph/pdbname.sph/g' hole.inp`;

}
