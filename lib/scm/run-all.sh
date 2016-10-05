#!/bin/bash

set -e

. $(dirname $0)/../shared/runner.sh

for file in *.scm; do
	printFileHeader $file

	output=`mktemp -t scmtest.XXX`

	plt-r5rs $file > $output
	printFile $file $output

	rm $output
done

printSummary
