#!/bin/bash
source /emsdk/emsdk_env.sh
export CC=$(which clang)
export CXX=$(which clang++)
export EMSDK_QUIET=1
exec "$@"