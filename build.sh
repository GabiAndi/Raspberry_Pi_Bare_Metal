#!/bin/bash

if [[ -f "CMakeLists.txt" ]]; then
    # Ejecutar la compilación
    rm -rf build

    cmake \
    -B build \
    -S . \
    -G "Ninja" \
    -DCMAKE_TOOLCHAIN_FILE="targets/rpi1.cmake"

    cmake --build build
else
    echo "ERROR: Trate de ejecutar este script desde la carpeta del proyecto"
fi
