#!/bin/sh -e

case $1 in
extract)
	cd IfExifExtract
	if [ ! -f go.mod ]; then
		go mod init IfExifExtract
		go mod tidy
	fi
	go build

	exec ./IfExifExtract 2>&1 | tee "$HOME"/data/extractor.log
	;;
esac
