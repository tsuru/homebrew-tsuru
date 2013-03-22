#!/bin/bash -e

# Copyright 2013 tsuru authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

# This script builds and uploads tsuru's clients to S3. It requires s3cmd to be
# installed and properly configured.
#
# Usage:
#
#   % ./create-package.bash tsuru-admin|tsuru|crane|all

function usage {
	echo "Usage:"
	echo
	echo "  % $0 tsuru-admin|tsuru|crane|all"
	exit 1
}

if [ $# != 1 ]
then
	usage
fi

destination_dir="/tmp/dist-src"

crane=0
tsuru=0
admin=0

case $1 in
	crane) crane=1;;
	tsuru) tsuru=1;;
	tsuru-admin) admin=1;;
	all)
		crane=1
		tsuru=1
		admin=1;;
	*) usage;;
esac

function get_version {
	GOPATH=/tmp/tsuru-clients go build -o $1 github.com/globocom/tsuru/$2
	echo `./$1 version | awk '{print $3}' | sed -e 's/\.$//'`
	rm $1
}

function download {
	echo -n "Downloading source... "
	mkdir -p /tmp/tsuru-clients/src /tmp/tsuru-clients/pkg
	GOPATH=/tmp/tsuru-clients go get -d github.com/globocom/tsuru/cmd/...
	echo "ok"
}

function package {
	tar -czf $1 * -C /tmp/tsuru-clients
	shasum -a 256 $1
}

echo -n "Creating \"$destination_dir\" directory... "
mkdir -p $destination_dir
echo "ok"

download

if [ $crane = 1 ]
then
	echo -n "Determining crane version... "
	crane_version=`get_version crane cmd/crane`
	echo $crane_version
fi

if [ $tsuru = 1 ]
then
	echo -n "Determining tsuru version... "
	tsuru_version=`get_version tsuru cmd/tsuru`
	echo $tsuru_version
fi

if [ $admin = 1 ]
then
	echo -n "Determining tsuru-admin version... "
	admin_version=`get_version tsuru-admin cmd/tsuru-admin`
	echo $admin_version
fi

echo

if [ $crane = 1 ]; then package ${destination_dir}/crane-${crane_version}.tar.gz; fi
if [ $tsuru = 1 ]; then package ${destination_dir}/tsuru-${tsuru_version}.tar.gz; fi
if [ $admin = 1 ]; then package ${destination_dir}/tsuru-admin-${admin_version}.tar.gz; fi

rm -rf /tmp/tsuru-clients

cd /tmp
s3cmd -P sync dist-src s3://tsuru
