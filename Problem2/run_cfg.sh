#!/bin/bash

PROG="$(find ~ -name 'sim-outorder')"
TESTS="$(find ~ -name 'bin.little')"
TEST="$(find $TESTS -name 'test-math')"

touch output.txt
touch miss_rates_dl1.csv
touch miss_rates_il1.csv

run_cfgs () {
	for f in *.cfg
	do
		${PROG} -config $f ${TEST} -redir:prog &> output.txt
		LINE="$(grep "dl1.miss_rate" output.txt)"
		NUMS="$(echo $LINE | grep -Eo '[+-]?[0-9]+([.][0-9]+)?')"
		ARR=($NUMS)
		RATE=${ARR[1]}
		echo "$f, $RATE" >> miss_rates_dl1.csv
	done
}

run_cfgs

exit $?
