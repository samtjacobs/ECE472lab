#!/bin/bash
gen_files () {
	for i in 16 32 64 128 256 512
	do
		for j in 1 2 4 8
		do
			file="cache_${1}l1_s${i}_a${j}.cfg"
			echo "# ${1}l1 cache, $i sets, $j-way associataivaty of il1 cache" > $file
			if [ $1 == 'i' ]
			then
				echo "-cache:il1 il1:$i:16:$j:l" >> $file
			else
				echo "-cache:il1 none" >> $file
			fi
			echo "-cache:il2 none" >> $file
			if [ $1 == 'd' ]
			then
				echo "-cache:dl1 dl1:$i:16:$j:l" >> $file
			else
				echo "-cache:dl1 none" >> $file
			fi
			echo "-cache:dl2 none" >> $file
			echo "-tlb:itlb none" >> $file
			echo "-tlb:dtlb none" >> $file	
		done
	done
}

gen_files i
gen_files d

exit $?
