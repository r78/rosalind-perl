#!/bin/bash
INPUT=`echo -n tests/$1 | sed -e s/\\\\.[a-z]*/.txt/`
OUTPUT=`echo -n tests/$1 | sed -e s/\\\\.[a-z]*/.out/`
TMP=`echo -n tests/$1 | sed -e s/\\\\.[a-z]*/.tmp/`
./$1 < $INPUT > $TMP
DIFF=`diff $OUTPUT $TMP`

if [ "$DIFF" != "" ]; then
	echo -e "$1\t-> \e[01;31mWrong output:\e[00m"
	echo "$DIFF"
else
	echo -e "$1\t-> \e[01;32mOK\e[00m"
fi
rm $TMP
