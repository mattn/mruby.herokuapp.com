#!/usr/bin/env bash

set -e
cd "$(dirname $0)"
SCRIPT_PATH="$(pwd)"

export CC=cc
export CXX=c++

if [ ! -d "$SCRIPT_PATH/mruby" ] ; then
    git clone --depth 1 "https://github.com/mruby/mruby.git"
fi

if [ ! -d "$SCRIPT_PATH/libuv" ] ; then
    git clone --depth 1 "https://github.com/joyent/libuv"
    cd libuv
    ./autogen.sh
    ./configure --disable-shared
    make
    cd $SCRIPT_PATH
fi

export LDFLAGS="-L$SCRIPT_PATH/libuv/.libs"
export CFLAGS="-I$SCRIPT_PATH/libuv/include"
export MRUBY_CONFIG="$SCRIPT_PATH/build_config.rb"
make -C "$SCRIPT_PATH/mruby" $@

"$SCRIPT_PATH/mruby/bin/mruby" "$SCRIPT_PATH/server.rb"
