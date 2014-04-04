#!/bin/sh
# TODO: call other 2 scripts based on the dir of this file?
src_dir="$GOPATH/src"
gogot="$src_dir/.goGot"
if [ "$1" != "" ]
then
	gogot="$1"
fi
function check_for_go_files
{
		go_files=($1/*.go)
		if [ -e ${go_files[0]} ]
		then
			gettable_src=${1#"$src_dir/"}
			echo -e "$gettable_src" >> $gogot
		else
			for f in $(ls $1)
			do
				if [ -d "$1/$f" ]
				then
					check_for_go_files "$1/$f"
				fi
			done
		fi
}
check_for_go_files $src_dir
tmp=$(awk '!g[$0]++' $gogot)
cat /dev/null > $gogot
for line in $tmp
do
	echo $line >> $gogot
done

srcs=$(cat $gogot)
for src in $srcs
do
	echo "go get -u $src"
	go get -u $src
done

