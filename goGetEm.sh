#!/bin/sh
src_dir="$GOPATH/src"
src_file="$src_dir/.goGot"
if [ "$1" != "" ]
then
	src_file="$1"
fi
srcs=$(cat $src_file)
for src in $srcs
do
	echo "go get $src"
	go get $src
done
