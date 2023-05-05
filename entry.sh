#!/bin/bash
export EMSDK_QUIET=1
source /emsdk/emsdk_env.sh
export CC=$(which clang)
export CXX=$(which clang++)
exec "$@"