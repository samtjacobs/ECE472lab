#!/bin/bash

for i in 16 32 64 128 256 512
do
	for j in 1 2 4 8
	do
		file="cache_s${i}_a${j}.cfg"
		echo "# $i sets, $j-way associataivaty of il1 cache" > $file
		echo "-cache:il1 il1:$i:16:$j:l" >> $file
		echo "-cache:il2 none" >> $file
		echo "-cache:dl1 none" >> $file
		echo "-cache:dl2 none" >> $file
		echo "-tlb:itlb none" >> $file
		echo "-tlb:dtlb none" >> $file	
	done
done
