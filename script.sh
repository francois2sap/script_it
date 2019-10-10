#!/bin/sh

read -p "Choisi un nombre : " nbr 
echo $nbr
read -p "Choisi un autre nombre : " nbr2
echo $nbr2
num=$((nbr + nbr2))
echo "La somme des deux est égal à : $num"
