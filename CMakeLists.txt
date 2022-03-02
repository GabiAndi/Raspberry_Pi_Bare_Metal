cmake_minimum_required(VERSION 3.21)

project("Bare_Metal_Kernel" VERSION 0.0.1 LANGUAGES C ASM)

set(CMAKE_C_STANDARD 17 REQUIRED)

set(CMAKE_BUILD_TYPE Release)

set(SYSROOT_PATH "${CMAKE_CURRENT_LIST_DIR}/sysroot")

include_directories("src")

add_executable("${KERNEL_FILE_NAME}.elf"
    "src/boot.s"
    "src/startup.c"
    "src/kernel/main.c"
    "src/kernel/vector_table.c"
)

add_custom_command(
    TARGET ${KERNEL_FILE_NAME}.elf POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} ${KERNEL_FILE_NAME}.elf -O binary ${KERNEL_FILE_NAME}.img
    COMMAND ${CMAKE_OBJDUMP} -S -D ${KERNEL_FILE_NAME}.elf > ${KERNEL_FILE_NAME}.asm
    COMMAND ${CMAKE_NM} ${KERNEL_FILE_NAME}.elf > ${KERNEL_FILE_NAME}.nm
    COMMAND cp ${KERNEL_FILE_NAME}.img ${SYSROOT_PATH}
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
)
