/* File: startup_ARMCM4.S
 * Purpose: startup file for Cortex-M4 devices. Should use with
 *   GCC for ARM Embedded Processors
 * Version: V2.0
 * Date: 16 August 2013
 *
/* Copyright (c) 2011 - 2013 ARM LIMITED

   All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:
   - Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
   - Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.
   - Neither the name of ARM nor the names of its contributors may be used
     to endorse or promote products derived from this software without
     specific prior written permission.
   *
   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
   ARE DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS AND CONTRIBUTORS BE
   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
   POSSIBILITY OF SUCH DAMAGE.
   ---------------------------------------------------------------------------*/
	.syntax	unified
	.arch	armv7e-m

	.section .stack
	.align	3
#ifdef __STACK_SIZE
	.equ	Stack_Size, __STACK_SIZE
#else
	.equ	Stack_Size, 0xc00
#endif
	.globl	__StackTop
	.globl	__StackLimit
__StackLimit:
	.space	Stack_Size
	.size	__StackLimit, . - __StackLimit
__StackTop:
	.size	__StackTop, . - __StackTop

	.section .heap
	.align	3
#ifdef __HEAP_SIZE
	.equ	Heap_Size, __HEAP_SIZE
#else
	.equ	Heap_Size, 0
#endif
	.globl	__HeapBase
	.globl	__HeapLimit
__HeapBase:
	.if	Heap_Size
	.space	Heap_Size
	.endif
	.size	__HeapBase, . - __HeapBase
__HeapLimit:
	.size	__HeapLimit, . - __HeapLimit

	.section .isr_vector
	.align	2
	.globl	__isr_vector
__isr_vector:
    .long   __StackTop                                      /* Top of Stack */
    .long   Reset_Handler                                   /* Reset Handler */
    .long   NMI_Handler                                     /* NMI Handler*/
    .long   HardFault_Handler                               /* Hard Fault Handler*/
    .long   MemManage_Handler                               /* MPU Fault Handler*/
    .long   BusFault_Handler                                /* Bus Fault Handler*/
    .long   UsageFault_Handler                              /* Usage Fault Handler*/
    .long   0                                               /* Reserved*/
    .long   0                                               /* Reserved*/
    .long   0                                               /* Reserved*/
    .long   0                                               /* Reserved*/
    .long   SVC_Handler                                     /* SVCall Handler*/
    .long   DebugMon_Handler                                /* Debug Monitor Handler*/
    .long   0                                               /* Reserved*/
    .long   PendSV_Handler                                  /* PendSV Handler*/
    .long   SysTick_Handler                                 /* SysTick Handler*/

                                                            /* External Interrupts*/
    .long   GPR_Handler                                     /* GPR Interrupt*/
    .long   DAP_Handler                                     /* DAP Interrupt*/
    .long   SDMA_Handler                                    /* SDMA Interrupt*/
    .long   DBGMON_Handler                                  /* DBGMON Interrupt*/
    .long   SNVS_Handler                                    /* SNVS Interrupt*/
    .long   LCDIF_Handler                                   /* LCDIF Interrupt*/
    .long   SIM2_Handler                                    /* SIM2 Interrupt*/
    .long   CSI_Handler                                     /* CSI Interrupt*/
    .long   PXP1_Handler                                    /* PXP1 Interrupt*/
    .long   Reserved9_Handler                               /* Reserved interrupt 9*/
    .long   WDOG3_Handler                                   /* WDOG3 Interrupt*/
    .long   SEMA4_HS_M4_Handler                             /* SEMA4_HS_M4 Interrupt*/
    .long   APBHDMA_Handler                                 /* APBHDMA Interrupt*/
    .long   EIM_Handler                                     /* EIM Interrupt*/
    .long   BCH_Handler                                     /* BCH Interrupt*/
    .long   GPMI_Handler                                    /* GPMI Interrupt*/
    .long   UART6_Handler                                   /* UART6 Interrupt*/
    .long   FTM1_Handler                                    /* FTM1 Interrupt*/
    .long   FTM2_Handler                                    /* FTM2 Interrupt*/
    .long   SNVS_CONSOLIDATED_Handler                       /* SNVS_CONSOLIDATED Interrupt*/
    .long   SNVS_SECURITY_Handler                           /* SNVS_SECURITY Interrupt*/
    .long   CSU_Handler                                     /* CSU Interrupt*/
    .long   uSDHC1_Handler                                  /* uSDHC1 Interrupt*/
    .long   uSDHC2_Handler                                  /* uSDHC2 Interrupt*/
    .long   uSDHC3_Handler                                  /* uSDHC3 Interrupt*/
    .long   MIPI_CSI_Handler                                /* MIPI_CSI Interrupt*/
    .long   UART1_Handler                                   /* UART1 Interrupt*/
    .long   UART2_Handler                                   /* UART2 Interrupt*/
    .long   UART3_Handler                                   /* UART3 Interrupt*/
    .long   UART4_Handler                                   /* UART4 Interrupt*/
    .long   UART5_Handler                                   /* UART5 Interrupt*/
    .long   eCSPI1_Handler                                  /* eCSPI1 Interrupt*/
    .long   eCSPI2_Handler                                  /* eCSPI2 Interrupt*/
    .long   eCSPI3_Handler                                  /* eCSPI3 Interrupt*/
    .long   eCSPI4_Handler                                  /* eCSPI4 Interrupt*/
    .long   I2C1_Handler                                    /* I2C1 Interrupt*/
    .long   I2C2_Handler                                    /* I2C2 Interrupt*/
    .long   I2C3_Handler                                    /* I2C3 Interrupt*/
    .long   I2C4_Handler                                    /* I2C4 Interrupt*/
    .long   RDC_Handler                                     /* RDC Interrupt*/
    .long   USB_OH3_OTG2_1_Handler                          /* USB_OH3_OTG2_1 Interrupt*/
    .long   MIPI_DSI_Handler                                /* MIPI_DSI Interrupt*/
    .long   USB_OH3_OTG2_2_Handler                          /* USB_OH3_OTG2_2 Interrupt*/
    .long   USB_OH2_OTG_Handler                             /* USB_OH2_OTG Interrupt*/
    .long   USB_OTG1_Handler                                /* USB_OTG1 Interrupt*/
    .long   USB_OTG2_Handler                                /* USB_OTG2 Interrupt*/
    .long   PXP2_Handler                                    /* PXP2 Interrupt*/
    .long   SCTR1_Handler                                   /* SCTR1 Interrupt*/
    .long   SCTR2_Handler                                   /* SCTR2 Interrupt*/
    .long   Analog_TempSensor_Handler                       /* Analog_TempSensor Interrupt*/
    .long   SAI3_Handler                                    /* SAI3 Interrupt*/
    .long   Analog_brown_out_Handler                        /* Analog_brown_out Interrupt*/
    .long   GPT4_Handler                                    /* GPT4 Interrupt*/
    .long   GPT3_Handler                                    /* GPT3 Interrupt*/
    .long   GPT2_Handler                                    /* GPT2 Interrupt*/
    .long   GPT1_Handler                                    /* GPT1 Interrupt*/
    .long   GPIO1_INT7_Handler                              /* GPIO1_INT7 Interrupt*/
    .long   GPIO1_INT6_Handler                              /* GPIO1_INT6 Interrupt*/
    .long   GPIO1_INT5_Handler                              /* GPIO1_INT5 Interrupt*/
    .long   GPIO1_INT4_Handler                              /* GPIO1_INT4 Interrupt*/
    .long   GPIO1_INT3_Handler                              /* GPIO1_INT3 Interrupt*/
    .long   GPIO1_INT2_Handler                              /* GPIO1_INT2 Interrupt*/
    .long   GPIO1_INT1_Handler                              /* GPIO1_INT1 Interrupt*/
    .long   GPIO1_INT0_Handler                              /* GPIO1_INT0 Interrupt*/
    .long   GPIO1_INT15_0_Handler                           /* GPIO1_INT15_0 Interrupt*/
    .long   GPIO1_INT31_16_Handler                          /* GPIO1_INT31_16 Interrupt*/
    .long   GPIO2_INT15_0_Handler                           /* GPIO2_INT15_0 Interrupt*/
    .long   GPIO2_INT31_16_Handler                          /* GPIO2_INT31_16 Interrupt*/
    .long   GPIO3_INT15_0_Handler                           /* GPIO3_INT15_0 Interrupt*/
    .long   GPIO3_INT31_16_Handler                          /* GPIO3_INT31_16 Interrupt*/
    .long   GPIO4_INT15_0_Handler                           /* GPIO4_INT15_0 Interrupt*/
    .long   GPIO4_INT31_16_Handler                          /* GPIO4_INT31_16 Interrupt*/
    .long   GPIO5_INT15_0_Handler                           /* GPIO5_INT15_0 Interrupt*/
    .long   GPIO5_INT31_16_Handler                          /* GPIO5_INT31_16 Interrupt*/
    .long   GPIO6_INT15_0_Handler                           /* GPIO6_INT15_0 Interrupt*/
    .long   GPIO6_INT31_16_Handler                          /* GPIO6_INT31_16 Interrupt*/
    .long   GPIO7_INT15_0_Handler                           /* GPIO7_INT15_0 Interrupt*/
    .long   GPIO7_INT31_16_Handler                          /* GPIO7_INT31_16 Interrupt*/
    .long   WDOG1_Handler                                   /* WDOG1 Interrupt*/
    .long   WDOG2_Handler                                   /* WDOG2 Interrupt*/
    .long   KPP_Handler                                     /* KPP Interrupt*/
    .long   PWM1_Handler                                    /* PWM1 Interrupt*/
    .long   PWM2_Handler                                    /* PWM2 Interrupt*/
    .long   PWM3_Handler                                    /* PWM3 Interrupt*/
    .long   PWM4_Handler                                    /* PWM4 Interrupt*/
    .long   CCM1_Handler                                    /* CCM1 Interrupt*/
    .long   CCM2_Handler                                    /* CCM2 Interrupt*/
    .long   GPC_Handler                                     /* GPC Interrupt*/
    .long   MU_A7_Handler                                   /* MU_A7 Interrupt*/
    .long   SRC_Handler                                     /* SRC Interrupt*/
    .long   SIM1_Handler                                    /* SIM1 Interrupt*/
    .long   RTIC_Handler                                    /* RTIC Interrupt*/
    .long   CPU_Handler                                     /* CPU Interrupt*/
    .long   CPU_CTI_Handler                                 /* CPU_CTI Interrupt*/
    .long   CCM_SRC_GPC_Handler                             /* CCM_SRC_GPC Interrupt*/
    .long   SAI1_Handler                                    /* SAI1 Interrupt*/
    .long   SAI2_Handler                                    /* SAI2 Interrupt*/
    .long   MU_M4_Handler                                   /* MU_M4 Interrupt*/
    .long   ADC1_Handler                                    /* ADC1 Interrupt*/
    .long   ADC2_Handler                                    /* ADC2 Interrupt*/
    .long   ENET2_MAC0_TRANS1_Handler                       /* ENET2_MAC0_TRANS1 Interrupt*/
    .long   ENET2_MAC0_TRANS2_Handler                       /* ENET2_MAC0_TRANS2 Interrupt*/
    .long   ENET2_MAC0_IRQ_Handler                          /* ENET2_MAC0_IRQ Interrupt*/
    .long   ENET2_1588_TIMER_IRQ_Handler                    /* ENET2_1588_TIMER_IRQ Interrupt*/
    .long   TPR_Handler                                     /* TPR Interrupt*/
    .long   CAAM_QUEUE_Handler                              /* CAAM_QUEUE Interrupt*/
    .long   CAAM_ERROR_Handler                              /* CAAM_ERROR Interrupt*/
    .long   QSPI_Handler                                    /* QSPI Interrupt*/
    .long   TZASC1_Handler                                  /* TZASC1 Interrupt*/
    .long   WDOG4_Handler                                   /* WDOG4 Interrupt*/
    .long   FLEXCAN1_Handler                                /* FLEXCAN1 Interrupt*/
    .long   FLEXCAN2_Handler                                /* FLEXCAN2 Interrupt*/
    .long   PERFMON1_Handler                                /* PERFMON1 Interrupt*/
    .long   PERFMON2_Handler                                /* PERFMON2 Interrupt*/
    .long   CAAM_WRAPPER1_Handler                           /* CAAM_WRAPPER1 Interrupt*/
    .long   CAAM_WRAPPER2_Handler                           /* CAAM_WRAPPER2 Interrupt*/
    .long   SEMA4_HS_A7_Handler                             /* SEMA4_HS_A7 Interrupt*/
    .long   EPDC_Handler                                    /* EPDC Interrupt*/
    .long   ENET1_MAC0_TRANS1_Handler                       /* ENET1_MAC0_TRANS1 Interrupt*/
    .long   ENET1_MAC0_TRANS2_Handler                       /* ENET1_MAC0_TRANS2 Interrupt*/
    .long   ENET1_MAC0_Handler                              /* ENET1_MAC0 Interrupt*/
    .long   ENET1_1588_TIMER_Handler                        /* ENET1_1588_TIMER Interrupt*/
    .long   PCIE_CTRL1_Handler                              /* PCIE_CTRL1 Interrupt*/
    .long   PCIE_CTRL2_Handler                              /* PCIE_CTRL2 Interrupt*/
    .long   PCIE_CTRL3_Handler                              /* PCIE_CTRL3 Interrupt*/
    .long   PCIE_CTRL4_Handler                              /* PCIE_CTRL4 Interrupt*/
    .long   UART7_Handler                                   /* UART7 Interrupt*/
    .long   PCIE_CTRL_REQUEST_Handler                       /* PCIE_CTRL_REQUEST Interrupt*/

	.size	__isr_vector, . - __isr_vector

	.text
	.thumb
	.thumb_func
	.align	2
	.globl	Reset_Handler
	.type	Reset_Handler, %function
Reset_Handler:
/*  Firstly it copies data from read only memory to RAM. There are two schemes
 *  to copy. One can copy more than one sections. Another can only copy
 *  one section.  The former scheme needs more instructions and read-only
 *  data to implement than the latter.
 *  Macro __STARTUP_COPY_MULTIPLE is used to choose between two schemes.  */

    ldr sp,=__stack


/*  Single section scheme.
 *
 *  The ranges of copy from/to are specified by following symbols
 *    __etext: LMA of start of the section to copy from. Usually end of text
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
	ldr	r1, =__etext
	ldr	r2, =__data_start__
	ldr	r3, =__data_end__

.L_loop1:
	cmp	r2, r3
	ittt	lt
	ldrlt	r0, [r1], #4
	strlt	r0, [r2], #4
	blt	.L_loop1

/*  This part of work usually is done in C library startup code. Otherwise,
 *  define this macro to enable it in this startup.
 *
 *  There are two schemes too. One can clear multiple BSS sections. Another
 *  can only clear one section. The former is more size expensive than the
 *  latter.
 *
 *  Define macro __STARTUP_CLEAR_BSS_MULTIPLE to choose the former.
 *  Otherwise efine macro __STARTUP_CLEAR_BSS to choose the later.
 */

/*  Single BSS section scheme.
 *
 *  The BSS section is specified by following symbols
 *    __bss_start__: start of the BSS section.
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
	ldr	r1, =__bss_start__
	ldr	r2, =__bss_end__

	movs	r0, 0
.L_loop3:
	cmp	r1, r2
	itt	lt
	strlt	r0, [r1], #4
	blt	.L_loop3

#ifndef __NO_SYSTEM_INIT
	bl	SystemInit
#endif

#ifndef __START
#define __START _start
#endif
	/*bl	__START*/
    cpsie   i               /* Unmask interrupts */
    //bl _start
    b   main

	.pool
	.size	Reset_Handler, . - Reset_Handler

	.align	1
	.thumb_func
	.weak	Default_Handler
	.type	Default_Handler, %function
Default_Handler:
	b	.
	.size	Default_Handler, . - Default_Handler

/*    Macro to define default handlers. Default handler
 *    will be weak symbol and just dead loops. They can be
 *    overwritten by other handlers */
	.macro	def_irq_handler	handler_name
	.weak	\handler_name
	.set	\handler_name, Default_Handler
	.endm

    def_irq_handler    NMI_Handler
    def_irq_handler    HardFault_Handler
    def_irq_handler    MemManage_Handler
    def_irq_handler    BusFault_Handler
    def_irq_handler    UsageFault_Handler
    def_irq_handler    SVC_Handler
    def_irq_handler    DebugMon_Handler
    def_irq_handler    PendSV_Handler
    def_irq_handler    SysTick_Handler
    def_irq_handler    GPR_Handler
    def_irq_handler    DAP_Handler
    def_irq_handler    SDMA_Handler
    def_irq_handler    DBGMON_Handler
    def_irq_handler    SNVS_Handler
    def_irq_handler    LCDIF_Handler
    def_irq_handler    SIM2_Handler
    def_irq_handler    CSI_Handler
    def_irq_handler    PXP1_Handler
    def_irq_handler    Reserved9_Handler
    def_irq_handler    WDOG3_Handler
    def_irq_handler    SEMA4_HS_M4_Handler
    def_irq_handler    APBHDMA_Handler
    def_irq_handler    EIM_Handler
    def_irq_handler    BCH_Handler
    def_irq_handler    GPMI_Handler
    def_irq_handler    UART6_Handler
    def_irq_handler    FTM1_Handler
    def_irq_handler    FTM2_Handler
    def_irq_handler    SNVS_CONSOLIDATED_Handler
    def_irq_handler    SNVS_SECURITY_Handler
    def_irq_handler    CSU_Handler
    def_irq_handler    uSDHC1_Handler
    def_irq_handler    uSDHC2_Handler
    def_irq_handler    uSDHC3_Handler
    def_irq_handler    MIPI_CSI_Handler
    def_irq_handler    UART1_Handler
    def_irq_handler    UART2_Handler
    def_irq_handler    UART3_Handler
    def_irq_handler    UART4_Handler
    def_irq_handler    UART5_Handler
    def_irq_handler    eCSPI1_Handler
    def_irq_handler    eCSPI2_Handler
    def_irq_handler    eCSPI3_Handler
    def_irq_handler    eCSPI4_Handler
    def_irq_handler    I2C1_Handler
    def_irq_handler    I2C2_Handler
    def_irq_handler    I2C3_Handler
    def_irq_handler    I2C4_Handler
    def_irq_handler    RDC_Handler
    def_irq_handler    USB_OH3_OTG2_1_Handler
    def_irq_handler    MIPI_DSI_Handler
    def_irq_handler    USB_OH3_OTG2_2_Handler
    def_irq_handler    USB_OH2_OTG_Handler
    def_irq_handler    USB_OTG1_Handler
    def_irq_handler    USB_OTG2_Handler
    def_irq_handler    PXP2_Handler
    def_irq_handler    SCTR1_Handler
    def_irq_handler    SCTR2_Handler
    def_irq_handler    Analog_TempSensor_Handler
    def_irq_handler    SAI3_Handler
    def_irq_handler    Analog_brown_out_Handler
    def_irq_handler    GPT4_Handler
    def_irq_handler    GPT3_Handler
    def_irq_handler    GPT2_Handler
    def_irq_handler    GPT1_Handler
    def_irq_handler    GPIO1_INT7_Handler
    def_irq_handler    GPIO1_INT6_Handler
    def_irq_handler    GPIO1_INT5_Handler
    def_irq_handler    GPIO1_INT4_Handler
    def_irq_handler    GPIO1_INT3_Handler
    def_irq_handler    GPIO1_INT2_Handler
    def_irq_handler    GPIO1_INT1_Handler
    def_irq_handler    GPIO1_INT0_Handler
    def_irq_handler    GPIO1_INT15_0_Handler
    def_irq_handler    GPIO1_INT31_16_Handler
    def_irq_handler    GPIO2_INT15_0_Handler
    def_irq_handler    GPIO2_INT31_16_Handler
    def_irq_handler    GPIO3_INT15_0_Handler
    def_irq_handler    GPIO3_INT31_16_Handler
    def_irq_handler    GPIO4_INT15_0_Handler
    def_irq_handler    GPIO4_INT31_16_Handler
    def_irq_handler    GPIO5_INT15_0_Handler
    def_irq_handler    GPIO5_INT31_16_Handler
    def_irq_handler    GPIO6_INT15_0_Handler
    def_irq_handler    GPIO6_INT31_16_Handler
    def_irq_handler    GPIO7_INT15_0_Handler
    def_irq_handler    GPIO7_INT31_16_Handler
    def_irq_handler    WDOG1_Handler
    def_irq_handler    WDOG2_Handler
    def_irq_handler    KPP_Handler
    def_irq_handler    PWM1_Handler
    def_irq_handler    PWM2_Handler
    def_irq_handler    PWM3_Handler
    def_irq_handler    PWM4_Handler
    def_irq_handler    CCM1_Handler
    def_irq_handler    CCM2_Handler
    def_irq_handler    GPC_Handler
    def_irq_handler    MU_A7_Handler
    def_irq_handler    SRC_Handler
    def_irq_handler    SIM1_Handler
    def_irq_handler    RTIC_Handler
    def_irq_handler    CPU_Handler
    def_irq_handler    CPU_CTI_Handler
    def_irq_handler    CCM_SRC_GPC_Handler
    def_irq_handler    SAI1_Handler
    def_irq_handler    SAI2_Handler
    def_irq_handler    MU_M4_Handler
    def_irq_handler    ADC1_Handler
    def_irq_handler    ADC2_Handler
    def_irq_handler    ENET2_MAC0_TRANS1_Handler
    def_irq_handler    ENET2_MAC0_TRANS2_Handler
    def_irq_handler    ENET2_MAC0_IRQ_Handler
    def_irq_handler    ENET2_1588_TIMER_IRQ_Handler
    def_irq_handler    TPR_Handler
    def_irq_handler    CAAM_QUEUE_Handler
    def_irq_handler    CAAM_ERROR_Handler
    def_irq_handler    QSPI_Handler
    def_irq_handler    TZASC1_Handler
    def_irq_handler    WDOG4_Handler
    def_irq_handler    FLEXCAN1_Handler
    def_irq_handler    FLEXCAN2_Handler
    def_irq_handler    PERFMON1_Handler
    def_irq_handler    PERFMON2_Handler
    def_irq_handler    CAAM_WRAPPER1_Handler
    def_irq_handler    CAAM_WRAPPER2_Handler
    def_irq_handler    SEMA4_HS_A7_Handler
    def_irq_handler    EPDC_Handler
    def_irq_handler    ENET1_MAC0_TRANS1_Handler
    def_irq_handler    ENET1_MAC0_TRANS2_Handler
    def_irq_handler    ENET1_MAC0_Handler
    def_irq_handler    ENET1_1588_TIMER_Handler
    def_irq_handler    PCIE_CTRL1_Handler
    def_irq_handler    PCIE_CTRL2_Handler
    def_irq_handler    PCIE_CTRL3_Handler
    def_irq_handler    PCIE_CTRL4_Handler
    def_irq_handler    UART7_Handler
    def_irq_handler    PCIE_CTRL_REQUEST_Handler
	.end
