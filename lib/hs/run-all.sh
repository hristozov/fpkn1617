#!/bin/bash

set -e

. $(dirname $0)/../shared/runner.sh

for file in *.hs; do
	printFileHeader $file

	output=`mktemp -t hstest.XXX`

	ghc -i$(dirname $0) $file -o a.out
	./a.out > $output

	printFile $file $output

	rm $output
	rm a.out
  rm *.hi
done

printSummary
