#!/bin/bash

ls
read -p "où veux-tu aller? " dir

while [ $dir != "nulle part" ]
do
	ls
	read -p "Où veux-tu aller(nulle part pour rester là)? " dir
	cd $dir
done

read -p "Veux-tu créer un fichier? " answer
if [ $answer == "oui" ]
then
	read -p "Comment veux-tu appeler ce fichier? " file
	touch $file
fi


