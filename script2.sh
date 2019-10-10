#!/bin/sh

homeFunction () {
cd /home/Documents/DFS17/script2

	echo "Que voulez vous faire ? "
	echo "Pour voir la liste des dossiers: tapez 1"
	echo "Pour aller dans dans dossier: tapez 2"
	echo "Pour créer un fichier: tapez 3"
	echo "Pour supprimer un fichier: tapez 4"
	echo "Pour créer un dossier: tapez 5"
	echo "Pour supprimer un dossier: tapez 6"
	echo "Pour chercher chercher un mot dans un fichier: tapez 7"
	echo "Pour quitter le script: tapez stop"
	read levelOneResponse
}

directoryList () {
	echo "Voici la liste des dossiers: "
	ls -d */
	homeFunction
}

moveToDirectory () {
	cd /home/Documents/DFS17/script2
	read -p "tapez le nom du dossier où ou voulez aller: " dirName
	if [ -d $dirName ]
	then 
	cd $dirName/
	echo "Vous êtes ici: "
	pwd
	else    
		echo "Ce dossier n'existe pas"
	homeFunction
	fi
}

createFile () {
	cd /home/Documents/DFS17/script2
	echo "tapez le nom du dossier où ou voulez créer le fichier: "
	ls -d */
	read dirName
	if [ -d $dirName ]
	then 
		cd $dirName/
		echo "Vous êtes ici: "
		pwd
		read -p "donnez un nom au fichier, nous allons le créer: " file
		touch $file
		echo "le fichier $file a été créé"
		homeFunction
	else    
		echo "Ce dossier n'existe pas"
	fi
	homeFunction
}

deleteFile () {
	echo "Dans quel dossier est le fichier que vous voulez supprimer: "
	ls -d */
	read dirName
	if [ -d $dirName ] 
	then
		cd $dirName/
		echo "Voici la liste des fichiers: "
		ls
		read -p "Quel est le fichier  voulez-vous supprimer ? " fileToDelete
	if [ -f $fileToDelete ] 
	then
		rm $fileToDelete
		echo "Le fichier $fileToDelete a été supprimé"
		homeFunction
	else
		echo "Ce fichier n'esxiste pas"
		homeFunction    
	fi
	else    
		"Ce dossier n'existe pas"
		homeFunction
	fi
}

createDirectory () {
	cd /home/Documents/DFS17/script2
	read -p "tapez le nom du dossier que vous voulez créer: " dirName
	mkdir $dirName
	echo "Le dossier $dirname a bien été crée."
	homeFunction
}

deleteDirectory () {
	cd /home/Documents/DFS17/script2
	ls -d */
	read -p "tapez le nom du dossier que vous voulez supprimer: " dirToDelete
	rm -rf $dirToDelete
	echo "Le dossier $dirToDelete a bien été supprimé."
	homeFunction
}

countWord () {
	echo "Dans quel dossier est le fichier que vous voulez scanner: "
	ls -d */
	read dirName
	if [ -d $dirName ] 
	then
		cd $dirName/
		echo "Voici la liste des fichiers: "
		ls
		read -p "Quel est le fichier  voulez-vous scanner ? " fileToScan
	if [ -f $fileToScan ] 
	then
		read -p "Quel mot voulez-vous chercher: " word
		count=grep -o $word file | wc -l
		echo "$word apparait $count fois dans le fichier séléctionner"
		homeFunction
	else
		echo "Ce fichier n'esxiste pas"
		homeFunction    
	fi
	else    
		"Ce dossier n'existe pas"
		homeFunction
	fi
}

levelOneResponse=0;

while [ $levelOneResponse != "stop" ]
do
	homeFunction

	case $levelOneResponse in
	1) directoryList;;
	2) moveToDirectory;;
	3) createFile;;
	4) deleteFile;;
	5) createDirectory;;
	6) deleteDirectory;;
	7) countWord;;
	*) echo "Choix invalide"
	homeFunction
	;; 
	esac
done



