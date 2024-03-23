#!/bin/bash

CSO_BIN=$1
VERSION=$2


if (( $# != 2 )); then
	echo "Need 2 parameters: CodeSonar tar and container version"
	exit 2
fi

if ! test -f downloads/$1; then
	echo "$1 does not exist"
	exit 1
fi

if ! test -f staging; then
	mkdir staging
fi

echo "Copying files"
rm -rf staging/*
cp downloads/* staging

#Base Builders
#TODO: ndpi-cso-builder openrgb-cso-builder openss-cso-builder wolfssl-cso-builder

for i in codesonar-3-builder codesonar-c-builder codesonar-full-builder codesonar-j-builder curl-cso-builder dekoder-cso-builder go-cso-builder mvn-csoj-builder nginx-cso-builder node-cso-builder numpy-cso-builder rust-cso-builder 
do
	echo $i
	mv staging/*.gz $i
	cd $i
	./build.sh $1 $2
	mv *.gz ../staging
	cd ..


done
