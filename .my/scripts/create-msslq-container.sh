#!/bin/bash

__wcs_create_mssql_container() {
	local image="mcr.microsoft.com/mssql/server"
	local name="${1:-mssql}"
	local tag="${2:-2022-latest}"
	local password=""
	sudo systemctl reset-failed
	sudo systemctl start docker
	image_id=$(docker image ls --all | grep "\b${image}\s*${tag}\b" -m 1 | awk '{print $3}')
	if [ -z "$image_id" ]; then
		docker pull "${image}:${tag}"
		image_id=$(docker image ls --all | grep "\b${image}\s*${tag}\b" -m 1 | awk '{print $3}')
		image_created=true
	fi
	stty -echo
	printf "Password: "
	read password
	stty echo
	printf "\n"
	docker container create \
		-e "ACCEPT_EULA=Y" \
		-e "MSSQL_SA_PASSWORD=$password" \
		-e "MSSQL_COLLATION=Latin1_General_CI_AS" \
		-p 1433:1433 \
		--name "$name" \
		--hostname "$name" \
		"$image_id"
}

__wcs_create_mssql_container "$@"
unset -f __wcs_create_mssql_container
