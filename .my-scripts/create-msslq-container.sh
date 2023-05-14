#!/bin/bash

__wcs_create_mssql_container() {
	local image="mcr.microsoft.com/mssql/server:2022-latest"
	local name="${1:-mssql}"
	local password=""
	sudo systemctl reset-failed
	sudo systemctl start docker
	docker pull "$image"
	read -p "Password: " -s password
	docker container create \
		-e "ACCEPT_EULA=Y" \
		-e "MSSQL_SA_PASSWORD=$password" \
		-e "MSSQL_COLLATION=Latin1_General_CI_AS" \
		-p 1433:1433 \
		--name "$name" \
		--hostname "$name" \
		-v "${name}:/var/opt/mssql" \
		"$image"
}

__wcs_create_mssql_container "$@"
unset -f __wcs_create_mssql_container
