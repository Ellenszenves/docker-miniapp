#!/bin/bash
if [[ -d "~/docker-miniapp" ]]
then
pull=$(git pull)
	if [[ $pull == "Already up to date." ]]
	then
	echo "Minden naprakész!"
		dockeron=$(docker ps | grep -i "frontend")
		if [[ -z $dockeron ]]
		then
		cd ~/docker-miniapp
		docker compose up --build -d
		else
		echo "A konténerek már futnak!"
		fi
	else
	cd ~/docker-miniapp
	docker compose down
	docker-compose up --build -d
	fi
else
cd ~
git clone https://github.com/Ellenszenves/docker-miniapp.git
cd ~/docker-miniapp
docker-compose up --build -d
fi
