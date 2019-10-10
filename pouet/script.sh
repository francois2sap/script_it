#!/bin/sh

linkDirectories () {
	vmLinkDir="/var\/www\/html"
	xenial="ubuntu\/xenial64"
	trusty="ubuntu\/trusty64"

	echo "Quelle box voulez-vous installer: " 
	echo "Pour $xenial: tapez 1 "
	echo "Pour $trusty: tapez 2 "
	read boxChoice

	 case $boxChoice in
    1) sed -i -e "s/base/${xenial}/g" Vagrantfile
	   ;;
    2) sed -i -e "s/base/${trusty}/g" Vagrantfile
	   ;;
    *) echo "Choix invalide"
	   rm -f Vagrantfile
       linkDirectories
       ;; 
    esac

	read -p "Voulez-vous changer le nom du dossier synchronisé ? " changeDirectoryName
	

	if [ $changeDirectoryName = "oui" ]
	then
		read -p "comment voulez-vous nommer le dossier: " newName
		# remplacer ../data par le nom de dossier choisi par l'utilisateur dans le vagrantfile
		sed -i -e"s/# config.vm.synced_folder \"..\/data\", \"\/vagrant_data\"/config.vm.synced_folder \".\/${newName}\", \"\/${vmLinkDir}\"/g" Vagrantfile	
		echo "Le nom du dossier synchronisé est bien $newName"
	elif [ $changeDirectoryName = "non" ]
	then	
		# remplacer ../data par ./data dans le vagrantfile
		sed -i -e "s/..\/data/.\/data/g" Vagrantfile
		sed -i -e "s/\/vagrant_data/${vmLinkDir}/g" Vagrantfile
	else
		echo "Merci de répondre par oui ou par non"
		rm -f Vagrantfile
		linkDirectories	
	fi
	sed "s/# config.vm.network \"private_network\", ip: \"192.168.33.10\"/config.vm.network \"private_network\", ip: \"192.168.33.10\"/g" Vagrantfile

	vagrant up
}


echo "Nous allons créer une VM ensemble"

vagrant init

linkDirectories

