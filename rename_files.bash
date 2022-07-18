for i in {0..5}; do
	for ext in pdb; do
		ln -s ${i}.${ext}
	done
done

#for i in {0..5}; do              #what will be the renamed file serial name? {0..5} can be changed with any numbers;
#	for ext in pdb; do        #file extension type, here it is pdb
#		ln -s ${i}.${ext} #renaming pattern
#	done			  #
#done				  #
