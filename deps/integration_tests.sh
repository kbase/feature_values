#!/bin/bash
if [[ -n "$(which awe-server)" && -n "$(which awe-client)" ]]; then
	exit 0
fi
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) # "
TEMP_TEST_DEPS_DIR=$DIR/../test/deps
if [[ -f $TEMP_TEST_DEPS_DIR/bin/awe-server && -f $TEMP_TEST_DEPS_DIR/bin/awe-client ]]; then
	exit 0
fi
echo "Preparing $TEMP_TEST_DEPS_DIR"
rm -rf $TEMP_TEST_DEPS_DIR
mkdir $TEMP_TEST_DEPS_DIR
cd $TEMP_TEST_DEPS_DIR
mkdir bin
mkdir gopath
export GOPATH=$TEMP_TEST_DEPS_DIR/gopath
mkdir -p $GOPATH/src/github.com/MG-RAST
# git clone https://github.com/kbase/shock_service
# cd shock_service
# git submodule init
# git submodule update
# cp -r Shock $GOPATH/src/github.com/MG-RAST/
# go get -v github.com/MG-RAST/Shock/...
# cd $TEMP_TEST_DEPS_DIR
# cp $GOPATH/bin/shock-server $TEMP_TEST_DEPS_DIR/bin/
git clone https://github.com/kbase/awe_service
cd awe_service
git submodule init
git submodule update
cp -r AWE $GOPATH/src/github.com/MG-RAST/
mkdir -p $GOPATH/src/github.com/docker
wget -O $GOPATH/src/github.com/docker/docker.zip https://github.com/docker/docker/archive/v1.6.1.zip
unzip -d $GOPATH/src/github.com/docker $GOPATH/src/github.com/docker/docker.zip
mv -v $GOPATH/src/github.com/docker/docker-1.6.1 $GOPATH/src/github.com/docker/docker
go get -v github.com/MG-RAST/AWE/...
cd $TEMP_TEST_DEPS_DIR
cp $GOPATH/bin/awe-server $TEMP_TEST_DEPS_DIR/bin/
cp $GOPATH/bin/awe-client $TEMP_TEST_DEPS_DIR/bin/

