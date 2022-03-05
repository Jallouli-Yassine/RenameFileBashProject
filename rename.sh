#!/bin/bash

#ls -l --block-size +100K
function show_usage() {
echo "rename.sh :  [-h|--help] [-T] [-t] [-n] [-N] [-d] [-m] [-s] "
}
function menutext()
{
while [[ $choix -ne 6 ]]
do
	echo "1) ----- Mettre le nom de fichier en majuscule"
	echo "2) ----- Mettre le nom de fichier en miniscule"
	echo "3) ----- Supprimer les espaces des fichiers"
	echo "4) ----- Supprimer extension du fichier"
	echo "5) ----- Ajouter _d a un nom de repertoir passer en parametre"
	echo "6) ----- Quitter"
	
	read -p "Votre choix :" choix
	clear
	case $choix in
			1) majus ;;
	        2) minus ;;
        	3) espace;;
			4) delete_ex;;
			5) ajouter_d;;
	        6) exit 1 ;;
		*) echo "Mauvais choix : spécifier 1 , 2 , 3 ,4 ,5, 6 ou 7 (pour quitter) "
	esac

done
}
#ajouter _d aux noms des repertoir passer en parametre 
ajouter_d()
{
	echo "donner le nom du repertoir" ;
	read repertoir ;
	nvrep="$repertoir""_d"
	if [ -d  $repertoir ];then
			echo `mv "$repertoir" "$nvrep"` ;
			else echo "n'est pas une repertoir"
		fi
	
}



#delete extension
function delete_ex() 
{
echo "donner le nom de fichier" ;
read nomfichier ;
name=$(echo "$nomfichier" | cut -f 1 -d '.') ;
echo `mv "$nomfichier" "$name"` ;


}


#supprimer les espaces des fichiers
function espace()
{
for i in *
do
       mv "$i" `echo "$i" | sed 's/  */_/g'`
done
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
menutext 
;;
*) echo "mauvais argument"
esac

#else echo "sayeb"
#fi

done 
else "il faut specifie au moin un argument "
fi

