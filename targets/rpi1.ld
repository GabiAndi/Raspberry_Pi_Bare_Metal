ENTRY (vector_table)

MEMORY
{
    RAM(xrw) : ORIGIN = 0x8000, LENGTH = 512M
}

SECTIONS
{
    .text : 
    {
        *(.isr_vector)
        *(.text)
    } > RAM

    .rodata :
    {
        . = ALIGN(4);
        *(.rodata)
    } > RAM

    .data :
    {
        . = ALIGN(4);
        _data_init = .;
        *(.data)
        . = ALIGN(4);
        _data_end = .;
    } > RAM

    _data_start = LOADADDR(.data);

    .bss :
    {
        . = ALIGN(4);
        _bss_init = .;
        *(.bss)
        . = ALIGN(4);
        _bss_end = .;
    } > RAM
}