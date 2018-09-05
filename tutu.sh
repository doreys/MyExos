#!/bin/bash

export n="test2.p6"
export m="testPixelClass.p6"
if test -n "`grep \"# Date\" $n`" 
then
	echo toto
	cat ./$n|sed 's/\(\ *[\*\#\/]\{1,2\}\ *\)\([Dd]ate\)/\1License\:\
\1	Permission\ is\ granted\ to\ copy\,\ distribute\,\ and\/or\ modify\ this\ document\ under\ the\ terms\ of\ the\
\1	Creative\ Commons\ Attribution\-NonCommercial\ 3\.0\ Unported\ License\,\ which\ is\ available\ at\
\1	at\ http\:\/\/creativecommons\.org\/licenses\/by\-nc\/3.0\/\.\
\1\2/' >& ./$n.tmp
else
	echo tutu
	exit
	cat ./testPixelClass.p6|sed 's/\(\ *[\*\#\/]\{1,2\}\ *\)\([Pp]urpose\)/\1License\:\
\1	Permission\ is\ granted\ to\ copy\,\ distribute\,\ and\/or\ modify\ this\ document\ under\ the\ terms\ of\ the\
\1	Creative\ Commons\ Attribution\-NonCommercial\ 3\.0\ Unported\ License\,\ which\ is\ available\ at\
\1	at\ http\:\/\/creativecommons\.org\/licenses\/by\-nc\/3.0\/\.\
\1\2/' >& ./testPixelClass.p6.tmp
#mv ./testPixelClass.p6.tmp ./testPixelClass.p6
fi


