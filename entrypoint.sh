#!/bin/sh -e

case $1 in
extract)
	cd IfExifExtract
	if [ ! -f go.mod ]; then
		go mod init IfExifExtract
		go mod tidy
	fi
	go build

	exec ./IfExifExtract
	;;
esac
