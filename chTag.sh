#!/bin/bash

date 0722141817
export orig_path=`pwd`
export dest_path="/Users/sdo/LangProg/Perl/6/tp6"
cd $orig_path
rm -rf .git
git init
cd $dest_path
for entry in `ls *p6 *pm *pm6|sed "s/\ /_MY_TAG_/g"`; do
	cd $dest_path
	echo "*****************************************>$entry -----> "
	export mye="`echo $entry|sed s/_MY_TAG_/\ /g`"
	#echo $mye
	cp -p "$mye" $orig_path
	export md=`stat -f "%Sm" -t "%Y-%m-%d %H:%M" "$mye"`
	export mdn=`stat -f "%Sm" -t "%m%d%H%M%Y" "$mye"`
	echo "`pwd`---->$entry<---->$md<------$mdn"
	cd $orig_path
	export mdn=`stat -f "%Sm" -t "%m%d%H%M%Y" "$mye"`
	date $mdn
	if test -n "`grep \"# Date\" $mye`" 
	then
		cat ./$mye|sed 's/\(\ *[\*\#\/]\{1,2\}\ *\)\([Dd]ate\)/\1License\:\
\1	Permission\ is\ granted\ to\ copy\,\ distribute\,\ and\/or\ modify\ this\ document\ under\ the\ terms\ of\ the\
\1	Creative\ Commons\ Attribution\-NonCommercial\ 3\.0\ Unported\ License\,\ which\ is\ available\ at\
\1	at\ http\:\/\/creativecommons\.org\/licenses\/by\-nc\/3.0\/\.\
\1\2/' >& ./$mye.tmp
	else
		cat ./$mye|sed 's/\(\ *[\*\#\/]\{1,2\}\ *\)\([Pp]urpose\)/\1License\:\
\1	Permission\ is\ granted\ to\ copy\,\ distribute\,\ and\/or\ modify\ this\ document\ under\ the\ terms\ of\ the\
\1	Creative\ Commons\ Attribution\-NonCommercial\ 3\.0\ Unported\ License\,\ which\ is\ available\ at\
\1	at\ http\:\/\/creativecommons\.org\/licenses\/by\-nc\/3.0\/\.\
\1\2/' >& ./$mye.tmp
	fi
	cp -p ./$mye.tmp ./$mye
	rm ./$mye.tmp
	date $mdn
	git add "$mye"
	git commit -m "TP6 & P6O $md"  "$mye"
	echo "      `pwd`---->$entry<---->$md<------$mdn"
done
cd $orig_path
chown sdo *
date 090518162018
