.section .isr_vector

.global vector_table
vector_table:
    ldr pc, =reset_handler
    ldr pc, =undefined_instruction_handler
    ldr pc, =software_interrupt_handler
    ldr pc, =prefetch_abort_handler
    ldr pc, =data_abort_handler
    .word 0
    ldr pc, =irq_handler
    ldr pc, =fiq_handler

.section .text

reset_handler:
    b startup
