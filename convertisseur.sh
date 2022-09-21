#!/bin/bash 
convertdectobinaire() {  		
	j=0
	for (( i="$MaxBits" ; i>=0 ; i-- )); do 
    	value2=${puissance[$i]}
    	if [ "$value" -ge "$value2" ]; then 
        	bin[$j]="1" 
        	let value=$value-$value2 
    	else 
        	bin[$j]="0" 
    	fi 
   	 let j=$j+1 
	done 
} 
#convertdectobinaire
affichage() {

	printf "La valeur binaire est de : " 
	for (( i=0 ; i<=$MaxBits ; i++ )); do 
    	printf "${bin[$i]}" 
	done 
	echo ""
}
#affichage
ibase=0
AfficheBases() {

      case "$value" in
           0b1)                ibase=2;;       # binaire
           [1-9]*)             ibase=10;;      # décimal
            *)                  return
        esac
}

AfficheBases

function convertbintodecimal() {
    local i=0
    local num=0
    
    # while loop
    while [ $value != 0 ]
    do
    digit=`expr $value % 10`
    num=$(( num + digit * 2**i ))
    value=$(expr $value / 10)
    (( ++i ))
    done
    # print the resultant decimal number
    echo  "Le nombre en decimal $num" >>resultat.txt
}
#on defini le nombre de bits not& de 0 à 7
MaxBits=7
#declarer un tableau associatif avec les puissance de 2
declare -A puissance=( [0]=1 [1]=2 [2]=4 [3]=8 [4]=16 [5]=32 [6]=64 [7]=128 )

#Deux facons  de recuperer le nombre a convertir soit  un parametre positionnel soit  une entree standard

	if [[ "$#" -eq 0 ]]; then
    	echo "Saisir une valeur décimale/Binaire"
    	read -r value
	else
	    value="$1"
	fi
	echo "tapez 1  pour la conversion binaire---->decimal"
	echo "tapez 2 pour la conversion decimale -----> binaire"
	read -r type
#declare un tableau indicatif pour stocker les nombres binaire
	declare -a bin

# Function Call
	if [ "$type" -eq 2 ];then
		 convertdectobinaire && affichage >>resultat.txt
	else 
   	 	convertbintodecimal
	fi
