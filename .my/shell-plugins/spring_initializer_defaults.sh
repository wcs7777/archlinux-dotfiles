#!/bin/bash

return 0;
spring_initializr_defaults() {
	local argument
	local key
	local key_length
	local value
	local applicationName
	local artifactId
	local baseDir
	local bootVersion
	local dependencies
	local description
	local groupId
	local javaVersion
	local language
	local name
	local packageName
	local packaging
	local type
	local version
	applicationName="DemoApplication"
	artifactId="demo"
	baseDir="demo"
	bootVersion="3.0.1"
	description="Demo project for Spring Boot"
	groupId="com.example"
	language="java"
	name="demo"
	packageName="com.example.demo"
	packaging="jar"
	javaVersion="19"
	type="maven-project"
	dependencies="web"
	version="0.0.1"
	for argument in "$@"; do
		key=$(echo $argument | cut -f1 -d=)
		key_length=${#key}
		value="${argument:$key_length+1}"
		case $key in
			applicationName) applicationName=$value ;;
			artifactId) artifactId=$value ;;
			baseDir) baseDir=$value ;;
			bootVersion) bootVersion=$value ;;
			dependencies) dependencies=$value ;;
			description) description=$value ;;
			groupId) groupId=$value ;;
			javaVersion) javaVersion=$value ;;
			language) language=$value ;;
			name) name=$value ;;
			packageName) packageName=$value ;;
			packaging) packaging=$value ;;
			type) type=$value ;;
			version) version=$value ;;
		esac
	done
	spring_initializr \
		applicationName=$applicationName \
		artifactId=$artifactId \
		baseDir=$baseDir \
		bootVersion=$bootVersion \
		dependencies=$dependencies \
		description=$description \
		groupId=$groupId \
		javaVersion=$javaVersion \
		language=$language \
		name=$name \
		packageName=$packageName \
		packaging=$packaging \
		type=$type \
		version=$version \
		foo=foo
}
