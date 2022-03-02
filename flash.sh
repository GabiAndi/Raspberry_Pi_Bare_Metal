#!/bin/bash

if [[ -f "build.sh" ]]; then
    # Ejecutar la compilación
    ./build.sh

    # Sincrinizamos el sysroot
    if [[ -d "/media/$USER/rpi" ]]; then
        cp sysroot/* /media/$USER/rpi
    else
        echo "ERROR: No se encuentra la ruta al dispositivo"
    fi
else
    echo "ERROR: Trate de ejecutar este script desde la carpeta del proyecto"
fi
