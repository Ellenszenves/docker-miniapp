#!/bin/bash
if [[ -d "~/workspace/repo-sync" ]]
then
cd ~/workspace/repo-sync
pull=$(git pull)
	if [[ $pull == "Already up to date." ]]
	then
	echo "Minden naprakész!"
		dockeron=$(docker ps | grep -i "frontend")
		if [[ -z $dockeron ]]
		then
		cd ~/workspace/repo-sync
		docker compose up --build -d
		else
		echo "A konténerek már futnak!"
		fi
	else
	cd ~/workspace/repo-sync
	docker compose down
	docker compose up --build -d
	fi
else
cd ~/workspace
git clone https://github.com/Ellenszenves/docker-miniapp.git
cd ~/workspace/docker-miniapp
docker compose up --build -d
fi
