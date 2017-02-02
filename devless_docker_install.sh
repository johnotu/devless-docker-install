#!/bin/bash
if [ $(uname) == "Linux" ]; then
	. /etc/lsb-release
	DISTRO=$DISTRIB_ID
	CODENAME=$DISTRIB_CODENAME
	if [ $DISTRO == "Ubuntu" ]; then
		echo "______           _               "
		echo "|  _  \         | |              "
		echo "| | | |_____   _| | ___  ___ ___ "
		echo "| | | / _ \ \ / / |/ _ \/ __/ __|"
		echo "| |/ /  __/\ V /| |  __/\__ \__ \\"
		echo "|___/ \___| \_/ |_|\___||___/___/"
		                                 
		echo "Prepping Linux box for Docker install ..."
		apt-get update
		apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
		apt-add-repository \
			"deb https://apt.dockerproject.org/repo \
			ubuntu-$CODENAME \
			main"
		apt-get update
		apt-cache policy docker-engine
		echo "Installing Docker..."
		apt-get install -y docker-engine
		echo "Pulling DevLess container..."
		docker pull eddymens/devless
		echo "Running DevLess container on port 8080..."
		docker run -p 8080:80 eddymens/devless
	else
		echo "Your Linux distro is not supported"
		echo "Please chaeck https://docs.docker.com/engine/installation/ for more options"
	fi
else
	echo "Your OS is not supported"
	echo "Please chaeck https://docs.docker.com/engine/installation/ for more options"
fi