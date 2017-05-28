#!/bin/bash

PROG="$(find ~ -name 'sim-outorder')"
TESTS="$(find ~ -name 'bin.little')"
TEST="$(find $TESTS -name 'test-math')"

touch output.txt
touch miss_rates_dl1.csv
touch miss_rates_il1.csv

run_cfgs () {
	for i in 16 32 64 128 256 512
	do
		for j in 1 2 4 8
		do
			FILE="cache_${1}l1_s${i}_a${j}.cfg"
			${PROG} -config ${FILE} ${TEST} -redir:prog &> output.txt
			LINE="$(grep "${1}l1.miss_rate" output.txt)"
			NUMS="$(echo $LINE | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')"
			ARR=($NUMS)
			RATE=${ARR[1]}
			echo "${i}, ${j}, $RATE" >> miss_rates_${1}l1.csv
		done
	done
}

run_cfgs i
run_cfgs d

exit $?
