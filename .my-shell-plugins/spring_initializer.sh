#!/bin/bash

return 0;
spring_initializr() {
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
	baseDir=""
	bootVersion="3.0.1"
	dependencies=""
	description="Demo project for Spring Boot"
	groupId="com.example"
	javaVersion="17"
	language="java"
	name="demo"
	packageName="com.example.demo"
	packaging="jar"
	type="gradle-project"
	version="0.0.1-SNAPSHOT"
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
	curl -G https://start.spring.io/starter.tgz \
		-d applicationName="$applicationName" \
		-d artifactId="$artifactId" \
		-d baseDir="$baseDir" \
		-d bootVersion="$bootVersion" \
		-d dependencies="$dependencies" \
		--data-urlencode description="$description" \
		-d groupId="$groupId" \
		-d javaVersion="$javaVersion" \
		-d language="$language" \
		-d name="$name" \
		-d packageName="$packageName" \
		-d packaging="$packaging" \
		-d type="$type" \
		-d version="$version" \
		| tar -xzvf -
}
