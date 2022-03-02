# Tipo de sistema cruzado
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR BCM2835)

# Compilador
set(COMPILER_PATH "/opt/cross-armv6zk-hardfp-gcc-10.2.0")

set(CMAKE_ASM_COMPILER "${COMPILER_PATH}/bin/arm-none-eabi-gcc")
set(CMAKE_C_COMPILER "${COMPILER_PATH}/bin/arm-none-eabi-gcc")
set(CMAKE_OBJCOPY "${COMPILER_PATH}/bin/arm-none-eabi-objcopy")
set(CMAKE_OBJDUMP "${COMPILER_PATH}/bin/arm-none-eabi-objdump")
set(CMAKE_NM "${COMPILER_PATH}/bin/arm-none-eabi-nm")

# Opciones de la arquitectura
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -march=armv6zk")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=arm1176jzf-s")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mtune=arm1176jzf-s")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mfpu=vfp")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mfloat-abi=hard")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -marm")

# Opciones del compilador
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -nostartfiles")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ffreestanding")

set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS}")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS "-T${CMAKE_CURRENT_LIST_DIR}/rpi1.ld")

# Nombre del archivo
set(KERNEL_FILE_NAME "kernel")