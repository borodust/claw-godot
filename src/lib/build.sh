#!/bin/bash

WORK_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
LIBRARY_DIR=$WORK_DIR/godot

REST_ARGS=
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    --arch)
        TARGET_ARCH="$2"
        shift
        shift
        ;;
    --debug)
        DEBUG_INFIX=".dev"
        SCONS_ENV+=" dev_build=yes"
        shift
        ;;
    *)
        REST_ARGS+="$1"
        shift
        ;;
esac
done


function build_desktop_editor {
    mkdir -p "$BUILD_DIR"
    cd "$LIBRARY_DIR/"
    scons CC=clang CXX=clang++ library_type=executable compiledb=true $SCONS_ENV
    cp "$LIBRARY_DIR/bin/"godot*editor$DEBUG_INFIX* "$BUILD_DIR"
}

function build_desktop_library {
    mkdir -p "$BUILD_DIR"
    cd "$LIBRARY_DIR/"
    scons CC=clang CXX=clang++ library_type=shared_library compiledb=true $SCONS_ENV
    cp "$LIBRARY_DIR/bin/"libgodot*editor$DEBUG_INFIX*.so "$BUILD_DIR"
    ln -fs "$BUILD_DIR"/libgodot*editor$DEBUG_INFIX*.so "$BUILD_DIR"/libgodot.so
}

function dump_api {
    mkdir -p "$BUILD_DIR" && cd "$BUILD_DIR"
    GODOT_EDITOR="$WORK_DIR/build/desktop/editor/$(find "$WORK_DIR/build/desktop/editor/" -name "godot*editor*" -printf "%P\n")"
    $GODOT_EDITOR --headless --dump-gdextension-interface gdextension-interface-json --dump-extension-api
}

case "$REST_ARGS" in
    desktop-editor)
        BUILD_DIR="$WORK_DIR/build/desktop/editor"
        build_desktop_editor
        ;;
    desktop-library)
        BUILD_DIR="$WORK_DIR/build/desktop/library"
        build_desktop_library
        ;;
    dump-api)
        BUILD_DIR="$WORK_DIR/build/desktop/api"
        dump_api
        ;;
    *)
        echo "Unrecognized platform $REST_ARGS"
        exit -1
        ;;
esac
