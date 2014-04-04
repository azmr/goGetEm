#!/bin/sh
src_dir="$GOPATH/src"
dest_file="$src_dir/.goGot"
if [ "$1" != "" ]
then
	dest_file="$1"
fi
function check_for_go_files
{
		go_files=($1/*.go)
		if [ -e ${go_files[0]} ]
		then
			gettable_src=${1#"$src_dir/"}
			echo -e "$gettable_src" >> $dest_file
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
tmp=$(awk '!g[$0]++' $dest_file)
cat /dev/null > $dest_file
for line in $tmp
do
	echo $line >> $dest_file
done
