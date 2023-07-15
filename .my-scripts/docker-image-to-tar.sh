#!/bin/bash

__wcs_docker_image_to_tar() {
	local image="${1:-archlinux}"
	local container="${2:-$image}"
	local outdir="${3:-.}"
	local outfile="$outdir/$container.tar"
	local image_created=false
	local container_created=false
	local image_id
	local container_id
	sudo systemctl reset-failed
	sudo systemctl start docker
	image_id=$(docker image ls --all | grep "\b${image}\b" -m 1 | awk '{print $3}')
	if [ -z "$image_id" ]; then
		docker pull "$image"
		image_id=$(docker image ls --all | grep "\b${image}\b" -m 1 | awk '{print $3}')
		image_created=true
	fi
	container_id=$(docker container ls --all | grep "\b${container}\b" -m 1 | awk '{print $1}')
	if [ -z "$container_id" ]; then
		container_id=$(docker container create --name "$container" --interactive "$image")
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
