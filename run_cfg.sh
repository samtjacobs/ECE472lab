#!/bin/bash

PROG="$(find ~ -name 'sim-outorder')"
TESTS="$(find ~ -name 'bin.little')"
TEST="$(find $TESTS -name 'test-math')"

touch output.txt
touch miss_rates.txt

for i in 16 32 64 128 256 512
do
	for j in 1 2 4 8
	do
		FILE="cache_s${i}_a${j}.cfg"
		${PROG} -config ${FILE} ${TEST} -redir:prog &> output.txt
		LINE="$(grep 'il1.miss_rate' output.txt)"
		NUMS="$(echo $LINE | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')"
		ARR=($NUMS)
		RATE=${ARR[1]}
		echo "${i}, ${j}, $RATE" >> miss_rates.txt
	done
done
