#include "common/datatypes.h"

// Variables del link script
extern uint32_t _data_init;
extern uint32_t _data_end;
extern uint32_t _data_start;

extern uint32_t _bss_init;
extern uint32_t _bss_end;

// Llamada al kernel
extern void kernel_main(void);

/*
 * Función de inicialización del tiempo de ejecución de C
 */
void startup(void)
{
    uint32_t *source;
    uint32_t *target;
    uint32_t length;

    // Inicio de la sección .data
    source = (uint32_t *)(&_data_start);
    target = (uint32_t *)(&_data_init);

    length = _data_end - _data_init;

    while (length > 0)
    {
        *target = *source;

        target++;
        source++;

        length -= sizeof(uint32_t);
    }

    // Inicio de la sección .bss
    target = (uint32_t *)(&_bss_init);

    length = _bss_end - _bss_init;

    while (length > 0)
    {
        *target = 0;

        target++;

        length -= sizeof(uint32_t);
    }

    // Se llama al kernel
    kernel_main();

    // Protección por si el kernel retorna
    while (1);
}