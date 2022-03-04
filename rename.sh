#!/bin/bash

function menu()
{
   cat menu.txt
}
#supprimer les extensions des fichiers 
function ajout_d()
{



}
#mettre les fichier en majuscules
function majus()
{

echo "donner le nom de fichier" ;
read nomfichier ;
f="$nomfichier"
n="${f%.*}"
n=$(tr '[:lower:]' '[:upper:]' <<< "$n")
f="$n.${f#*.}"
echo "$f"
echo `mv "$nomfichier" "$f"` ;


}
#mettre les fichiers en miniscules
function minus()
{

echo "donner le nom de fichier" ;
read nomfichier ;
f="$nomfichier"
n="${f%.*}"
n=$(tr '[:upper:]' '[:lower:]' <<< "$n")
f="$n.${f#*.}"
echo "$f"
echo `mv "$nomfichier" "$f"` ;
}


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
menu
;;
*) echo "mauvais argument"
esac

#else echo "sayeb"
#fi

done 
else "il faut specifie au moin un argument "
fi

