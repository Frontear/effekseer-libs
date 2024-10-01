#!/usr/bin/env bash

export CMAKE_INCLUDE_PATH=/usr/include
export CMAKE_LIBRARY_PATH=/usr/lib:/usr/lib64

export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))

cd $(mktemp -d)

git clone https://github.com/Effekseer/EffekseerForMultiLanguages $PWD
git submodule update --init

pushd src
./generate_swig_wrapper.sh
popd

cmake -B build
cmake --build build

cp build/src/cpp/libEffekseerNativeForJava.so $OLDPWD
cd $OLDPWD
rm -rf $OLDPWD # erases the mktemp directory
