#!/bin/bash

__wcs_docker_image_to_tar() {
	local distro
	local outdir
	local filename
	local outfile
	local image_id
	local container_id
	local image_created
	local container_created
	distro="${1:-archlinux}"
	outdir="${2:-/mnt/d/wsl/dockerdistros}"
	filename="${3:-$distro}.tar"
	outfile="$outdir/$filename"
	image_created=false
	container_created=false
	sudo systemctl reset-failed
	sudo systemctl start docker
	image_id=$(docker image ls --all | grep "\b${distro}\b" -m 1 | awk '{print $3}')
	if [ -z "$image_id" ]; then
		docker pull "$distro"
		image_id=$(docker image ls --all | grep "\b${distro}\b" -m 1 | awk '{print $3}')
		image_created=true
	fi
	container_id=$(docker container ls --all | grep "\b${distro}\b" -m 1 | awk '{print $1}')
	if [ -z "$container_id" ]; then
		container_id=$(docker create --name "$distro" -i "$distro")
		container_created=true
	fi
	mkdir -p "$outdir"
	rm -f "$outfile"
	docker export "$container_id" > "$outfile"
	if [ "$container_created" = true ]; then
		docker container rm "$container_id"
	fi
	if [ "$image_created" = true ]; then
		docker image rm "$image_id"
	fi
}

__wcs_docker_image_to_tar "$@"
unset -f __wcs_docker_image_to_tar
