#!/bin/bash

#ls -l --block-size +100K
function show_usage() {
echo "rename.sh :  [-h|--help] [-T] [-t] [-n] [-N] [-d] [-m] [-s] "
}

function HELP() 
{
echo `cat help.txt`
}

show_usage ; 
if [ $# -gt 0 ]; then

while getopts "hgvm" var

do 
echo "vous averz choisie l option $var"

#if [ $var == "m" ]; then

case $var in 
h) 
HELP 
;;
g) 
;;
v) 
;;
m) 
;;
*) echo "mauvais argument"
esac

#else echo "sayeb"
#fi

done 
else "il faut specifie au moin un argument "
fi

