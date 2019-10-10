#!/bin/sh

read -p "Comment tu t'appelles? " name

while [ $name != "gérard" ]
do
	read -p "Nan pour de vrai? " name
done

echo "Ah bah voilà je savais bien que tu t'appelais gérard!"
