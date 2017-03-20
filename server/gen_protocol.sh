#!/bin/bash

SERVER_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WL_D_DIR=$SERVER_DIR/..

PROTOCOL=$WL_D_DIR/protocol/wayland.xml
TARGET=$SERVER_DIR/source/wayland/server/protocol.d
declare -a DEPENDS=(
    $PROTOCOL
    $WL_D_DIR/scanner/source/wayland/scanner/package.d
    $WL_D_DIR/scanner/source/wayland/scanner/common.d
    $WL_D_DIR/scanner/source/wayland/scanner/client.d
    $WL_D_DIR/scanner/source/wayland/scanner/server.d
)

for d in ${DEPENDS[@]}; do
    if [ $TARGET -ot ${d} ]; then
        cd $WL_D_DIR
        dub run wayland-d:scanner --build=release -- \
                        -c server \
                        -m wayland.server.protocol \
                        -i $PROTOCOL \
                        -o $TARGET
        exit $?
    fi
done
