#!/bin/bash

read -p "Choisi les char des yeux de la vache!" char
read -p "Que veux-tu lui faire dire?" sentence
cowsay -e $char $sentence
