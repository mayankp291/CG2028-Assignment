   1              		.syntax unified
   2              		.cpu cortex-m3
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 1
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.file	"cr_startup_lpc17.c"
  15              		.text
  16              	.Ltext0:
  17              		.cfi_sections	.debug_frame
  18              		.global	g_pfnVectors
  19              		.section	.isr_vector,"a",%progbits
  20              		.align	2
  23              	g_pfnVectors:
  24 0000 00000000 		.word	_vStackTop
  25 0004 00000000 		.word	ResetISR
  26 0008 00000000 		.word	NMI_Handler
  27 000c 00000000 		.word	HardFault_Handler
  28 0010 00000000 		.word	MemManage_Handler
  29 0014 00000000 		.word	BusFault_Handler
  30 0018 00000000 		.word	UsageFault_Handler
  31 001c 00000000 		.word	0
  32 0020 00000000 		.word	0
  33 0024 00000000 		.word	0
  34 0028 00000000 		.word	0
  35 002c 00000000 		.word	SVCall_Handler
  36 0030 00000000 		.word	DebugMon_Handler
  37 0034 00000000 		.word	0
  38 0038 00000000 		.word	PendSV_Handler
  39 003c 00000000 		.word	SysTick_Handler
  40 0040 00000000 		.word	WDT_IRQHandler
  41 0044 00000000 		.word	TIMER0_IRQHandler
  42 0048 00000000 		.word	TIMER1_IRQHandler
  43 004c 00000000 		.word	TIMER2_IRQHandler
  44 0050 00000000 		.word	TIMER3_IRQHandler
  45 0054 00000000 		.word	UART0_IRQHandler
  46 0058 00000000 		.word	UART1_IRQHandler
  47 005c 00000000 		.word	UART2_IRQHandler
  48 0060 00000000 		.word	UART3_IRQHandler
  49 0064 00000000 		.word	PWM1_IRQHandler
  50 0068 00000000 		.word	I2C0_IRQHandler
  51 006c 00000000 		.word	I2C1_IRQHandler
  52 0070 00000000 		.word	I2C2_IRQHandler
  53 0074 00000000 		.word	SPI_IRQHandler
  54 0078 00000000 		.word	SSP0_IRQHandler
  55 007c 00000000 		.word	SSP1_IRQHandler
  56 0080 00000000 		.word	PLL0_IRQHandler
  57 0084 00000000 		.word	RTC_IRQHandler
  58 0088 00000000 		.word	EINT0_IRQHandler
  59 008c 00000000 		.word	EINT1_IRQHandler
  60 0090 00000000 		.word	EINT2_IRQHandler
  61 0094 00000000 		.word	EINT3_IRQHandler
  62 0098 00000000 		.word	ADC_IRQHandler
  63 009c 00000000 		.word	BOD_IRQHandler
  64 00a0 00000000 		.word	USB_IRQHandler
  65 00a4 00000000 		.word	CAN_IRQHandler
  66 00a8 00000000 		.word	DMA_IRQHandler
  67 00ac 00000000 		.word	I2S_IRQHandler
  68 00b0 00000000 		.word	ENET_IRQHandler
  69 00b4 00000000 		.word	RIT_IRQHandler
  70 00b8 00000000 		.word	MCPWM_IRQHandler
  71 00bc 00000000 		.word	QEI_IRQHandler
  72 00c0 00000000 		.word	PLL1_IRQHandler
  73 00c4 00000000 		.word	USBActivity_IRQHandler
  74 00c8 00000000 		.word	CANActivity_IRQHandler
  75              		.section	.text.ResetISR,"ax",%progbits
  76              		.align	2
  77              		.global	ResetISR
  78              		.thumb
  79              		.thumb_func
  81              	ResetISR:
  82              	.LFB0:
  83              		.file 1 "../src/cr_startup_lpc17.c"
   1:../src/cr_startup_lpc17.c **** //*****************************************************************************
   2:../src/cr_startup_lpc17.c **** //   +--+       
   3:../src/cr_startup_lpc17.c **** //   | ++----+   
   4:../src/cr_startup_lpc17.c **** //   +-++    |  
   5:../src/cr_startup_lpc17.c **** //     |     |  
   6:../src/cr_startup_lpc17.c **** //   +-+--+  |   
   7:../src/cr_startup_lpc17.c **** //   | +--+--+  
   8:../src/cr_startup_lpc17.c **** //   +----+    Copyright (c) 2009-10 Code Red Technologies Ltd.
   9:../src/cr_startup_lpc17.c **** //
  10:../src/cr_startup_lpc17.c **** // Microcontroller Startup code for use with Red Suite
  11:../src/cr_startup_lpc17.c **** //
  12:../src/cr_startup_lpc17.c **** // Software License Agreement
  13:../src/cr_startup_lpc17.c **** // 
  14:../src/cr_startup_lpc17.c **** // The software is owned by Code Red Technologies and/or its suppliers, and is 
  15:../src/cr_startup_lpc17.c **** // protected under applicable copyright laws.  All rights are reserved.  Any 
  16:../src/cr_startup_lpc17.c **** // use in violation of the foregoing restrictions may subject the user to criminal 
  17:../src/cr_startup_lpc17.c **** // sanctions under applicable laws, as well as to civil liability for the breach 
  18:../src/cr_startup_lpc17.c **** // of the terms and conditions of this license.
  19:../src/cr_startup_lpc17.c **** // 
  20:../src/cr_startup_lpc17.c **** // THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
  21:../src/cr_startup_lpc17.c **** // OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
  22:../src/cr_startup_lpc17.c **** // MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
  23:../src/cr_startup_lpc17.c **** // USE OF THIS SOFTWARE FOR COMMERCIAL DEVELOPMENT AND/OR EDUCATION IS SUBJECT
  24:../src/cr_startup_lpc17.c **** // TO A CURRENT END USER LICENSE AGREEMENT (COMMERCIAL OR EDUCATIONAL) WITH
  25:../src/cr_startup_lpc17.c **** // CODE RED TECHNOLOGIES LTD. 
  26:../src/cr_startup_lpc17.c **** //
  27:../src/cr_startup_lpc17.c **** //*****************************************************************************
  28:../src/cr_startup_lpc17.c **** #if defined (__cplusplus)
  29:../src/cr_startup_lpc17.c **** #ifdef __REDLIB__
  30:../src/cr_startup_lpc17.c **** #error Redlib does not support C++
  31:../src/cr_startup_lpc17.c **** #else
  32:../src/cr_startup_lpc17.c **** //*****************************************************************************
  33:../src/cr_startup_lpc17.c **** //
  34:../src/cr_startup_lpc17.c **** // The entry point for the C++ library startup
  35:../src/cr_startup_lpc17.c **** //
  36:../src/cr_startup_lpc17.c **** //*****************************************************************************
  37:../src/cr_startup_lpc17.c **** extern "C" {
  38:../src/cr_startup_lpc17.c **** 	extern void __libc_init_array(void);
  39:../src/cr_startup_lpc17.c **** }
  40:../src/cr_startup_lpc17.c **** #endif
  41:../src/cr_startup_lpc17.c **** #endif
  42:../src/cr_startup_lpc17.c **** 
  43:../src/cr_startup_lpc17.c **** #define WEAK __attribute__ ((weak))
  44:../src/cr_startup_lpc17.c **** #define ALIAS(f) __attribute__ ((weak, alias (#f)))
  45:../src/cr_startup_lpc17.c **** 
  46:../src/cr_startup_lpc17.c **** // Code Red - if CMSIS is being used, then SystemInit() routine
  47:../src/cr_startup_lpc17.c **** // will be called by startup code rather than in application's main()
  48:../src/cr_startup_lpc17.c **** #if defined (__USE_CMSIS)
  49:../src/cr_startup_lpc17.c **** #include "system_LPC17xx.h"
  50:../src/cr_startup_lpc17.c **** #endif
  51:../src/cr_startup_lpc17.c **** 
  52:../src/cr_startup_lpc17.c **** //*****************************************************************************
  53:../src/cr_startup_lpc17.c **** #if defined (__cplusplus)
  54:../src/cr_startup_lpc17.c **** extern "C" {
  55:../src/cr_startup_lpc17.c **** #endif
  56:../src/cr_startup_lpc17.c **** 
  57:../src/cr_startup_lpc17.c **** //*****************************************************************************
  58:../src/cr_startup_lpc17.c **** //
  59:../src/cr_startup_lpc17.c **** // Forward declaration of the default handlers. These are aliased.
  60:../src/cr_startup_lpc17.c **** // When the application defines a handler (with the same name), this will 
  61:../src/cr_startup_lpc17.c **** // automatically take precedence over these weak definitions
  62:../src/cr_startup_lpc17.c **** //
  63:../src/cr_startup_lpc17.c **** //*****************************************************************************
  64:../src/cr_startup_lpc17.c ****      void ResetISR(void);
  65:../src/cr_startup_lpc17.c **** WEAK void NMI_Handler(void);
  66:../src/cr_startup_lpc17.c **** WEAK void HardFault_Handler(void);
  67:../src/cr_startup_lpc17.c **** WEAK void MemManage_Handler(void);
  68:../src/cr_startup_lpc17.c **** WEAK void BusFault_Handler(void);
  69:../src/cr_startup_lpc17.c **** WEAK void UsageFault_Handler(void);
  70:../src/cr_startup_lpc17.c **** WEAK void SVCall_Handler(void);
  71:../src/cr_startup_lpc17.c **** WEAK void DebugMon_Handler(void);
  72:../src/cr_startup_lpc17.c **** WEAK void PendSV_Handler(void);
  73:../src/cr_startup_lpc17.c **** WEAK void SysTick_Handler(void);
  74:../src/cr_startup_lpc17.c **** WEAK void IntDefaultHandler(void);
  75:../src/cr_startup_lpc17.c **** 
  76:../src/cr_startup_lpc17.c **** //*****************************************************************************
  77:../src/cr_startup_lpc17.c **** //
  78:../src/cr_startup_lpc17.c **** // Forward declaration of the specific IRQ handlers. These are aliased
  79:../src/cr_startup_lpc17.c **** // to the IntDefaultHandler, which is a 'forever' loop. When the application
  80:../src/cr_startup_lpc17.c **** // defines a handler (with the same name), this will automatically take 
  81:../src/cr_startup_lpc17.c **** // precedence over these weak definitions
  82:../src/cr_startup_lpc17.c **** //
  83:../src/cr_startup_lpc17.c **** //*****************************************************************************
  84:../src/cr_startup_lpc17.c **** void WDT_IRQHandler(void) ALIAS(IntDefaultHandler);
  85:../src/cr_startup_lpc17.c **** void TIMER0_IRQHandler(void) ALIAS(IntDefaultHandler);
  86:../src/cr_startup_lpc17.c **** void TIMER1_IRQHandler(void) ALIAS(IntDefaultHandler);
  87:../src/cr_startup_lpc17.c **** void TIMER2_IRQHandler(void) ALIAS(IntDefaultHandler);
  88:../src/cr_startup_lpc17.c **** void TIMER3_IRQHandler(void) ALIAS(IntDefaultHandler);
  89:../src/cr_startup_lpc17.c **** void UART0_IRQHandler(void) ALIAS(IntDefaultHandler);
  90:../src/cr_startup_lpc17.c **** void UART1_IRQHandler(void) ALIAS(IntDefaultHandler);
  91:../src/cr_startup_lpc17.c **** void UART2_IRQHandler(void) ALIAS(IntDefaultHandler);
  92:../src/cr_startup_lpc17.c **** void UART3_IRQHandler(void) ALIAS(IntDefaultHandler);
  93:../src/cr_startup_lpc17.c **** void PWM1_IRQHandler(void) ALIAS(IntDefaultHandler);
  94:../src/cr_startup_lpc17.c **** void I2C0_IRQHandler(void) ALIAS(IntDefaultHandler);
  95:../src/cr_startup_lpc17.c **** void I2C1_IRQHandler(void) ALIAS(IntDefaultHandler);
  96:../src/cr_startup_lpc17.c **** void I2C2_IRQHandler(void) ALIAS(IntDefaultHandler);
  97:../src/cr_startup_lpc17.c **** void SPI_IRQHandler(void) ALIAS(IntDefaultHandler);
  98:../src/cr_startup_lpc17.c **** void SSP0_IRQHandler(void) ALIAS(IntDefaultHandler);
  99:../src/cr_startup_lpc17.c **** void SSP1_IRQHandler(void) ALIAS(IntDefaultHandler);
 100:../src/cr_startup_lpc17.c **** void PLL0_IRQHandler(void) ALIAS(IntDefaultHandler);
 101:../src/cr_startup_lpc17.c **** void RTC_IRQHandler(void) ALIAS(IntDefaultHandler);
 102:../src/cr_startup_lpc17.c **** void EINT0_IRQHandler(void) ALIAS(IntDefaultHandler);
 103:../src/cr_startup_lpc17.c **** void EINT1_IRQHandler(void) ALIAS(IntDefaultHandler);
 104:../src/cr_startup_lpc17.c **** void EINT2_IRQHandler(void) ALIAS(IntDefaultHandler);
 105:../src/cr_startup_lpc17.c **** void EINT3_IRQHandler(void) ALIAS(IntDefaultHandler);
 106:../src/cr_startup_lpc17.c **** void ADC_IRQHandler(void) ALIAS(IntDefaultHandler);
 107:../src/cr_startup_lpc17.c **** void BOD_IRQHandler(void) ALIAS(IntDefaultHandler);
 108:../src/cr_startup_lpc17.c **** void USB_IRQHandler(void) ALIAS(IntDefaultHandler);
 109:../src/cr_startup_lpc17.c **** void CAN_IRQHandler(void) ALIAS(IntDefaultHandler);
 110:../src/cr_startup_lpc17.c **** void DMA_IRQHandler(void) ALIAS(IntDefaultHandler);
 111:../src/cr_startup_lpc17.c **** void I2S_IRQHandler(void) ALIAS(IntDefaultHandler);
 112:../src/cr_startup_lpc17.c **** void ENET_IRQHandler(void) ALIAS(IntDefaultHandler);
 113:../src/cr_startup_lpc17.c **** void RIT_IRQHandler(void) ALIAS(IntDefaultHandler);
 114:../src/cr_startup_lpc17.c **** void MCPWM_IRQHandler(void) ALIAS(IntDefaultHandler);
 115:../src/cr_startup_lpc17.c **** void QEI_IRQHandler(void) ALIAS(IntDefaultHandler);
 116:../src/cr_startup_lpc17.c **** void PLL1_IRQHandler(void) ALIAS(IntDefaultHandler);
 117:../src/cr_startup_lpc17.c **** void USBActivity_IRQHandler(void) ALIAS(IntDefaultHandler);
 118:../src/cr_startup_lpc17.c **** void CANActivity_IRQHandler(void) ALIAS(IntDefaultHandler);
 119:../src/cr_startup_lpc17.c **** 
 120:../src/cr_startup_lpc17.c **** //*****************************************************************************
 121:../src/cr_startup_lpc17.c **** //
 122:../src/cr_startup_lpc17.c **** // The entry point for the application.
 123:../src/cr_startup_lpc17.c **** // __main() is the entry point for Redlib based applications
 124:../src/cr_startup_lpc17.c **** // main() is the entry point for Newlib based applications
 125:../src/cr_startup_lpc17.c **** //
 126:../src/cr_startup_lpc17.c **** //*****************************************************************************
 127:../src/cr_startup_lpc17.c **** #if defined (__REDLIB__)
 128:../src/cr_startup_lpc17.c **** extern void __main(void);
 129:../src/cr_startup_lpc17.c **** #endif
 130:../src/cr_startup_lpc17.c **** extern int main(void);
 131:../src/cr_startup_lpc17.c **** //*****************************************************************************
 132:../src/cr_startup_lpc17.c **** //
 133:../src/cr_startup_lpc17.c **** // External declaration for the pointer to the stack top from the Linker Script
 134:../src/cr_startup_lpc17.c **** //
 135:../src/cr_startup_lpc17.c **** //*****************************************************************************
 136:../src/cr_startup_lpc17.c **** extern void _vStackTop(void);
 137:../src/cr_startup_lpc17.c **** 
 138:../src/cr_startup_lpc17.c **** //*****************************************************************************
 139:../src/cr_startup_lpc17.c **** #if defined (__cplusplus)
 140:../src/cr_startup_lpc17.c **** } // extern "C"
 141:../src/cr_startup_lpc17.c **** #endif
 142:../src/cr_startup_lpc17.c **** //*****************************************************************************
 143:../src/cr_startup_lpc17.c **** //
 144:../src/cr_startup_lpc17.c **** // The vector table.
 145:../src/cr_startup_lpc17.c **** // This relies on the linker script to place at correct location in memory.
 146:../src/cr_startup_lpc17.c **** //
 147:../src/cr_startup_lpc17.c **** //*****************************************************************************
 148:../src/cr_startup_lpc17.c **** extern void (* const g_pfnVectors[])(void);
 149:../src/cr_startup_lpc17.c **** __attribute__ ((section(".isr_vector")))
 150:../src/cr_startup_lpc17.c **** void (* const g_pfnVectors[])(void) = {
 151:../src/cr_startup_lpc17.c **** 	// Core Level - CM3
 152:../src/cr_startup_lpc17.c **** 	&_vStackTop, // The initial stack pointer
 153:../src/cr_startup_lpc17.c **** 	ResetISR,								// The reset handler
 154:../src/cr_startup_lpc17.c **** 	NMI_Handler,							// The NMI handler
 155:../src/cr_startup_lpc17.c **** 	HardFault_Handler,						// The hard fault handler
 156:../src/cr_startup_lpc17.c **** 	MemManage_Handler,						// The MPU fault handler
 157:../src/cr_startup_lpc17.c **** 	BusFault_Handler,						// The bus fault handler
 158:../src/cr_startup_lpc17.c **** 	UsageFault_Handler,						// The usage fault handler
 159:../src/cr_startup_lpc17.c **** 	0,										// Reserved
 160:../src/cr_startup_lpc17.c **** 	0,										// Reserved
 161:../src/cr_startup_lpc17.c **** 	0,										// Reserved
 162:../src/cr_startup_lpc17.c **** 	0,										// Reserved
 163:../src/cr_startup_lpc17.c **** 	SVCall_Handler,							// SVCall handler
 164:../src/cr_startup_lpc17.c **** 	DebugMon_Handler,						// Debug monitor handler
 165:../src/cr_startup_lpc17.c **** 	0,										// Reserved
 166:../src/cr_startup_lpc17.c **** 	PendSV_Handler,							// The PendSV handler
 167:../src/cr_startup_lpc17.c **** 	SysTick_Handler,						// The SysTick handler
 168:../src/cr_startup_lpc17.c **** 
 169:../src/cr_startup_lpc17.c **** 	// Chip Level - LPC17
 170:../src/cr_startup_lpc17.c **** 	WDT_IRQHandler,							// 16, 0x40 - WDT
 171:../src/cr_startup_lpc17.c **** 	TIMER0_IRQHandler,						// 17, 0x44 - TIMER0
 172:../src/cr_startup_lpc17.c **** 	TIMER1_IRQHandler,						// 18, 0x48 - TIMER1
 173:../src/cr_startup_lpc17.c **** 	TIMER2_IRQHandler,						// 19, 0x4c - TIMER2
 174:../src/cr_startup_lpc17.c **** 	TIMER3_IRQHandler,						// 20, 0x50 - TIMER3
 175:../src/cr_startup_lpc17.c **** 	UART0_IRQHandler,						// 21, 0x54 - UART0
 176:../src/cr_startup_lpc17.c **** 	UART1_IRQHandler,						// 22, 0x58 - UART1
 177:../src/cr_startup_lpc17.c **** 	UART2_IRQHandler,						// 23, 0x5c - UART2
 178:../src/cr_startup_lpc17.c **** 	UART3_IRQHandler,						// 24, 0x60 - UART3
 179:../src/cr_startup_lpc17.c **** 	PWM1_IRQHandler,						// 25, 0x64 - PWM1
 180:../src/cr_startup_lpc17.c **** 	I2C0_IRQHandler,						// 26, 0x68 - I2C0
 181:../src/cr_startup_lpc17.c **** 	I2C1_IRQHandler,						// 27, 0x6c - I2C1
 182:../src/cr_startup_lpc17.c **** 	I2C2_IRQHandler,						// 28, 0x70 - I2C2
 183:../src/cr_startup_lpc17.c **** 	SPI_IRQHandler,							// 29, 0x74 - SPI
 184:../src/cr_startup_lpc17.c **** 	SSP0_IRQHandler,						// 30, 0x78 - SSP0
 185:../src/cr_startup_lpc17.c **** 	SSP1_IRQHandler,						// 31, 0x7c - SSP1
 186:../src/cr_startup_lpc17.c **** 	PLL0_IRQHandler,						// 32, 0x80 - PLL0 (Main PLL)
 187:../src/cr_startup_lpc17.c **** 	RTC_IRQHandler,							// 33, 0x84 - RTC
 188:../src/cr_startup_lpc17.c **** 	EINT0_IRQHandler,						// 34, 0x88 - EINT0
 189:../src/cr_startup_lpc17.c **** 	EINT1_IRQHandler,						// 35, 0x8c - EINT1
 190:../src/cr_startup_lpc17.c **** 	EINT2_IRQHandler,						// 36, 0x90 - EINT2
 191:../src/cr_startup_lpc17.c **** 	EINT3_IRQHandler,						// 37, 0x94 - EINT3
 192:../src/cr_startup_lpc17.c **** 	ADC_IRQHandler,							// 38, 0x98 - ADC
 193:../src/cr_startup_lpc17.c **** 	BOD_IRQHandler,							// 39, 0x9c - BOD
 194:../src/cr_startup_lpc17.c **** 	USB_IRQHandler,							// 40, 0xA0 - USB
 195:../src/cr_startup_lpc17.c **** 	CAN_IRQHandler,							// 41, 0xa4 - CAN
 196:../src/cr_startup_lpc17.c **** 	DMA_IRQHandler,							// 42, 0xa8 - GP DMA
 197:../src/cr_startup_lpc17.c **** 	I2S_IRQHandler,							// 43, 0xac - I2S
 198:../src/cr_startup_lpc17.c **** 	ENET_IRQHandler,						// 44, 0xb0 - Ethernet
 199:../src/cr_startup_lpc17.c **** 	RIT_IRQHandler,							// 45, 0xb4 - RITINT
 200:../src/cr_startup_lpc17.c **** 	MCPWM_IRQHandler,						// 46, 0xb8 - Motor Control PWM
 201:../src/cr_startup_lpc17.c **** 	QEI_IRQHandler,							// 47, 0xbc - Quadrature Encoder
 202:../src/cr_startup_lpc17.c **** 	PLL1_IRQHandler,						// 48, 0xc0 - PLL1 (USB PLL)
 203:../src/cr_startup_lpc17.c **** 	USBActivity_IRQHandler,					// 49, 0xc4 - USB Activity interrupt to wakeup
 204:../src/cr_startup_lpc17.c **** 	CANActivity_IRQHandler, 				// 50, 0xc8 - CAN Activity interrupt to wakeup
 205:../src/cr_startup_lpc17.c **** };
 206:../src/cr_startup_lpc17.c **** 
 207:../src/cr_startup_lpc17.c **** //*****************************************************************************
 208:../src/cr_startup_lpc17.c **** //
 209:../src/cr_startup_lpc17.c **** // The following are constructs created by the linker, indicating where the
 210:../src/cr_startup_lpc17.c **** // the "data" and "bss" segments reside in memory.  The initializers for the
 211:../src/cr_startup_lpc17.c **** // for the "data" segment resides immediately following the "text" segment.
 212:../src/cr_startup_lpc17.c **** //
 213:../src/cr_startup_lpc17.c **** //*****************************************************************************
 214:../src/cr_startup_lpc17.c **** extern unsigned long _etext;
 215:../src/cr_startup_lpc17.c **** extern unsigned long _data;
 216:../src/cr_startup_lpc17.c **** extern unsigned long _edata;
 217:../src/cr_startup_lpc17.c **** extern unsigned long _bss;
 218:../src/cr_startup_lpc17.c **** extern unsigned long _ebss;
 219:../src/cr_startup_lpc17.c **** 
 220:../src/cr_startup_lpc17.c **** //*****************************************************************************
 221:../src/cr_startup_lpc17.c **** // Reset entry point for your code.
 222:../src/cr_startup_lpc17.c **** // Sets up a simple runtime environment and initializes the C/C++
 223:../src/cr_startup_lpc17.c **** // library.
 224:../src/cr_startup_lpc17.c **** //
 225:../src/cr_startup_lpc17.c **** //*****************************************************************************
 226:../src/cr_startup_lpc17.c **** void
 227:../src/cr_startup_lpc17.c **** ResetISR(void) {
  84              		.loc 1 227 0
  85              		.cfi_startproc
  86              		@ args = 0, pretend = 0, frame = 8
  87              		@ frame_needed = 1, uses_anonymous_args = 0
  88 0000 80B5     		push	{r7, lr}
  89              	.LCFI0:
  90              		.cfi_def_cfa_offset 8
  91              		.cfi_offset 14, -4
  92              		.cfi_offset 7, -8
  93 0002 82B0     		sub	sp, sp, #8
  94              	.LCFI1:
  95              		.cfi_def_cfa_offset 16
  96 0004 00AF     		add	r7, sp, #0
  97              	.LCFI2:
  98              		.cfi_def_cfa_register 7
 228:../src/cr_startup_lpc17.c ****     unsigned long *pulSrc, *pulDest;
 229:../src/cr_startup_lpc17.c **** 
 230:../src/cr_startup_lpc17.c ****     //
 231:../src/cr_startup_lpc17.c ****     // Copy the data segment initializers from flash to SRAM.
 232:../src/cr_startup_lpc17.c ****     //
 233:../src/cr_startup_lpc17.c ****     pulSrc = &_etext;
  99              		.loc 1 233 0
 100 0006 40F20003 		movw	r3, #:lower16:_etext
 101 000a C0F20003 		movt	r3, #:upper16:_etext
 102 000e 7B60     		str	r3, [r7, #4]
 234:../src/cr_startup_lpc17.c ****     for(pulDest = &_data; pulDest < &_edata; )
 103              		.loc 1 234 0
 104 0010 40F20003 		movw	r3, #:lower16:_data
 105 0014 C0F20003 		movt	r3, #:upper16:_data
 106 0018 3B60     		str	r3, [r7, #0]
 107 001a 0BE0     		b	.L2
 108              	.L3:
 235:../src/cr_startup_lpc17.c ****     {
 236:../src/cr_startup_lpc17.c ****         *pulDest++ = *pulSrc++;
 109              		.loc 1 236 0
 110 001c 7B68     		ldr	r3, [r7, #4]
 111 001e 1A68     		ldr	r2, [r3, #0]
 112 0020 3B68     		ldr	r3, [r7, #0]
 113 0022 1A60     		str	r2, [r3, #0]
 114 0024 3B68     		ldr	r3, [r7, #0]
 115 0026 03F10403 		add	r3, r3, #4
 116 002a 3B60     		str	r3, [r7, #0]
 117 002c 7B68     		ldr	r3, [r7, #4]
 118 002e 03F10403 		add	r3, r3, #4
 119 0032 7B60     		str	r3, [r7, #4]
 120              	.L2:
 234:../src/cr_startup_lpc17.c ****     for(pulDest = &_data; pulDest < &_edata; )
 121              		.loc 1 234 0 discriminator 1
 122 0034 3A68     		ldr	r2, [r7, #0]
 123 0036 40F20003 		movw	r3, #:lower16:_edata
 124 003a C0F20003 		movt	r3, #:upper16:_edata
 125 003e 9A42     		cmp	r2, r3
 126 0040 ECD3     		bcc	.L3
 237:../src/cr_startup_lpc17.c ****     }
 238:../src/cr_startup_lpc17.c **** 
 239:../src/cr_startup_lpc17.c ****     //
 240:../src/cr_startup_lpc17.c ****     // Zero fill the bss segment.  This is done with inline assembly since this
 241:../src/cr_startup_lpc17.c ****     // will clear the value of pulDest if it is not kept in a register.
 242:../src/cr_startup_lpc17.c ****     //
 243:../src/cr_startup_lpc17.c ****     __asm("    ldr     r0, =_bss\n"
 127              		.loc 1 243 0
 128              	@ 243 "../src/cr_startup_lpc17.c" 1
 129 0042 0748     		    ldr     r0, =_bss
 130 0044 0749     	    ldr     r1, =_ebss
 131 0046 4FF00002 	    mov     r2, #0
 132              	    .thumb_func
 133              	zero_loop:
 134 004a 8842     	        cmp     r0, r1
 135 004c B8BF     	        it      lt
 136 004e 40F8042B 	        strlt   r2, [r0], #4
 137 0052 FADB     	        blt     zero_loop
 138              	@ 0 "" 2
 244:../src/cr_startup_lpc17.c ****           "    ldr     r1, =_ebss\n"
 245:../src/cr_startup_lpc17.c ****           "    mov     r2, #0\n"
 246:../src/cr_startup_lpc17.c ****           "    .thumb_func\n"
 247:../src/cr_startup_lpc17.c ****           "zero_loop:\n"
 248:../src/cr_startup_lpc17.c ****           "        cmp     r0, r1\n"
 249:../src/cr_startup_lpc17.c ****           "        it      lt\n"
 250:../src/cr_startup_lpc17.c ****           "        strlt   r2, [r0], #4\n"
 251:../src/cr_startup_lpc17.c ****           "        blt     zero_loop");
 252:../src/cr_startup_lpc17.c **** 
 253:../src/cr_startup_lpc17.c **** #ifdef __USE_CMSIS
 254:../src/cr_startup_lpc17.c **** 	SystemInit();
 139              		.loc 1 254 0
 140              		.thumb
 141 0054 FFF7FEFF 		bl	SystemInit
 255:../src/cr_startup_lpc17.c **** #endif
 256:../src/cr_startup_lpc17.c **** 
 257:../src/cr_startup_lpc17.c **** #if defined (__cplusplus)
 258:../src/cr_startup_lpc17.c **** 	//
 259:../src/cr_startup_lpc17.c **** 	// Call C++ library initialisation
 260:../src/cr_startup_lpc17.c **** 	//
 261:../src/cr_startup_lpc17.c **** 	__libc_init_array();
 262:../src/cr_startup_lpc17.c **** #endif
 263:../src/cr_startup_lpc17.c **** 
 264:../src/cr_startup_lpc17.c **** #if defined (__REDLIB__)
 265:../src/cr_startup_lpc17.c **** 	// Call the Redlib library, which in turn calls main()
 266:../src/cr_startup_lpc17.c **** 	__main() ;
 142              		.loc 1 266 0
 143 0058 FFF7FEFF 		bl	__main
 144              	.L4:
 267:../src/cr_startup_lpc17.c **** #else
 268:../src/cr_startup_lpc17.c **** 	main();
 269:../src/cr_startup_lpc17.c **** #endif
 270:../src/cr_startup_lpc17.c **** 
 271:../src/cr_startup_lpc17.c **** 	//
 272:../src/cr_startup_lpc17.c **** 	// main() shouldn't return, but if it does, we'll just enter an infinite loop 
 273:../src/cr_startup_lpc17.c **** 	//
 274:../src/cr_startup_lpc17.c **** 	while (1) {
 275:../src/cr_startup_lpc17.c **** 		;
 276:../src/cr_startup_lpc17.c **** 	}
 145              		.loc 1 276 0 discriminator 1
 146 005c FEE7     		b	.L4
 147              		.cfi_endproc
 148              	.LFE0:
 150 005e 0000     		.section	.text.NMI_Handler,"ax",%progbits
 151              		.align	2
 152              		.weak	NMI_Handler
 153              		.thumb
 154              		.thumb_func
 156              	NMI_Handler:
 157              	.LFB1:
 277:../src/cr_startup_lpc17.c **** }
 278:../src/cr_startup_lpc17.c **** 
 279:../src/cr_startup_lpc17.c **** //*****************************************************************************
 280:../src/cr_startup_lpc17.c **** //
 281:../src/cr_startup_lpc17.c **** // This is the code that gets called when the processor receives a NMI.  This
 282:../src/cr_startup_lpc17.c **** // simply enters an infinite loop, preserving the system state for examination
 283:../src/cr_startup_lpc17.c **** // by a debugger.
 284:../src/cr_startup_lpc17.c **** //
 285:../src/cr_startup_lpc17.c **** //*****************************************************************************
 286:../src/cr_startup_lpc17.c **** void NMI_Handler(void)
 287:../src/cr_startup_lpc17.c **** {
 158              		.loc 1 287 0
 159              		.cfi_startproc
 160              		@ args = 0, pretend = 0, frame = 0
 161              		@ frame_needed = 1, uses_anonymous_args = 0
 162              		@ link register save eliminated.
 163 0000 80B4     		push	{r7}
 164              	.LCFI3:
 165              		.cfi_def_cfa_offset 4
 166              		.cfi_offset 7, -4
 167 0002 00AF     		add	r7, sp, #0
 168              	.LCFI4:
 169              		.cfi_def_cfa_register 7
 170              	.L6:
 288:../src/cr_startup_lpc17.c ****     while(1)
 289:../src/cr_startup_lpc17.c ****     {
 290:../src/cr_startup_lpc17.c ****     }
 171              		.loc 1 290 0 discriminator 1
 172 0004 FEE7     		b	.L6
 173              		.cfi_endproc
 174              	.LFE1:
 176 0006 00BF     		.section	.text.HardFault_Handler,"ax",%progbits
 177              		.align	2
 178              		.weak	HardFault_Handler
 179              		.thumb
 180              		.thumb_func
 182              	HardFault_Handler:
 183              	.LFB2:
 291:../src/cr_startup_lpc17.c **** }
 292:../src/cr_startup_lpc17.c **** 
 293:../src/cr_startup_lpc17.c **** void HardFault_Handler(void)
 294:../src/cr_startup_lpc17.c **** {
 184              		.loc 1 294 0
 185              		.cfi_startproc
 186              		@ args = 0, pretend = 0, frame = 0
 187              		@ frame_needed = 1, uses_anonymous_args = 0
 188              		@ link register save eliminated.
 189 0000 80B4     		push	{r7}
 190              	.LCFI5:
 191              		.cfi_def_cfa_offset 4
 192              		.cfi_offset 7, -4
 193 0002 00AF     		add	r7, sp, #0
 194              	.LCFI6:
 195              		.cfi_def_cfa_register 7
 196              	.L8:
 295:../src/cr_startup_lpc17.c ****     while(1)
 296:../src/cr_startup_lpc17.c ****     {
 297:../src/cr_startup_lpc17.c ****     }
 197              		.loc 1 297 0 discriminator 1
 198 0004 FEE7     		b	.L8
 199              		.cfi_endproc
 200              	.LFE2:
 202 0006 00BF     		.section	.text.MemManage_Handler,"ax",%progbits
 203              		.align	2
 204              		.weak	MemManage_Handler
 205              		.thumb
 206              		.thumb_func
 208              	MemManage_Handler:
 209              	.LFB3:
 298:../src/cr_startup_lpc17.c **** }
 299:../src/cr_startup_lpc17.c **** 
 300:../src/cr_startup_lpc17.c **** void MemManage_Handler(void)
 301:../src/cr_startup_lpc17.c **** {
 210              		.loc 1 301 0
 211              		.cfi_startproc
 212              		@ args = 0, pretend = 0, frame = 0
 213              		@ frame_needed = 1, uses_anonymous_args = 0
 214              		@ link register save eliminated.
 215 0000 80B4     		push	{r7}
 216              	.LCFI7:
 217              		.cfi_def_cfa_offset 4
 218              		.cfi_offset 7, -4
 219 0002 00AF     		add	r7, sp, #0
 220              	.LCFI8:
 221              		.cfi_def_cfa_register 7
 222              	.L10:
 302:../src/cr_startup_lpc17.c ****     while(1)
 303:../src/cr_startup_lpc17.c ****     {
 304:../src/cr_startup_lpc17.c ****     }
 223              		.loc 1 304 0 discriminator 1
 224 0004 FEE7     		b	.L10
 225              		.cfi_endproc
 226              	.LFE3:
 228 0006 00BF     		.section	.text.BusFault_Handler,"ax",%progbits
 229              		.align	2
 230              		.weak	BusFault_Handler
 231              		.thumb
 232              		.thumb_func
 234              	BusFault_Handler:
 235              	.LFB4:
 305:../src/cr_startup_lpc17.c **** }
 306:../src/cr_startup_lpc17.c **** 
 307:../src/cr_startup_lpc17.c **** void BusFault_Handler(void)
 308:../src/cr_startup_lpc17.c **** {
 236              		.loc 1 308 0
 237              		.cfi_startproc
 238              		@ args = 0, pretend = 0, frame = 0
 239              		@ frame_needed = 1, uses_anonymous_args = 0
 240              		@ link register save eliminated.
 241 0000 80B4     		push	{r7}
 242              	.LCFI9:
 243              		.cfi_def_cfa_offset 4
 244              		.cfi_offset 7, -4
 245 0002 00AF     		add	r7, sp, #0
 246              	.LCFI10:
 247              		.cfi_def_cfa_register 7
 248              	.L12:
 309:../src/cr_startup_lpc17.c ****     while(1)
 310:../src/cr_startup_lpc17.c ****     {
 311:../src/cr_startup_lpc17.c ****     }
 249              		.loc 1 311 0 discriminator 1
 250 0004 FEE7     		b	.L12
 251              		.cfi_endproc
 252              	.LFE4:
 254 0006 00BF     		.section	.text.UsageFault_Handler,"ax",%progbits
 255              		.align	2
 256              		.weak	UsageFault_Handler
 257              		.thumb
 258              		.thumb_func
 260              	UsageFault_Handler:
 261              	.LFB5:
 312:../src/cr_startup_lpc17.c **** }
 313:../src/cr_startup_lpc17.c **** 
 314:../src/cr_startup_lpc17.c **** void UsageFault_Handler(void)
 315:../src/cr_startup_lpc17.c **** {
 262              		.loc 1 315 0
 263              		.cfi_startproc
 264              		@ args = 0, pretend = 0, frame = 0
 265              		@ frame_needed = 1, uses_anonymous_args = 0
 266              		@ link register save eliminated.
 267 0000 80B4     		push	{r7}
 268              	.LCFI11:
 269              		.cfi_def_cfa_offset 4
 270              		.cfi_offset 7, -4
 271 0002 00AF     		add	r7, sp, #0
 272              	.LCFI12:
 273              		.cfi_def_cfa_register 7
 274              	.L14:
 316:../src/cr_startup_lpc17.c ****     while(1)
 317:../src/cr_startup_lpc17.c ****     {
 318:../src/cr_startup_lpc17.c ****     }
 275              		.loc 1 318 0 discriminator 1
 276 0004 FEE7     		b	.L14
 277              		.cfi_endproc
 278              	.LFE5:
 280 0006 00BF     		.section	.text.SVCall_Handler,"ax",%progbits
 281              		.align	2
 282              		.weak	SVCall_Handler
 283              		.thumb
 284              		.thumb_func
 286              	SVCall_Handler:
 287              	.LFB6:
 319:../src/cr_startup_lpc17.c **** }
 320:../src/cr_startup_lpc17.c **** 
 321:../src/cr_startup_lpc17.c **** void SVCall_Handler(void)
 322:../src/cr_startup_lpc17.c **** {
 288              		.loc 1 322 0
 289              		.cfi_startproc
 290              		@ args = 0, pretend = 0, frame = 0
 291              		@ frame_needed = 1, uses_anonymous_args = 0
 292              		@ link register save eliminated.
 293 0000 80B4     		push	{r7}
 294              	.LCFI13:
 295              		.cfi_def_cfa_offset 4
 296              		.cfi_offset 7, -4
 297 0002 00AF     		add	r7, sp, #0
 298              	.LCFI14:
 299              		.cfi_def_cfa_register 7
 300              	.L16:
 323:../src/cr_startup_lpc17.c ****     while(1)
 324:../src/cr_startup_lpc17.c ****     {
 325:../src/cr_startup_lpc17.c ****     }
 301              		.loc 1 325 0 discriminator 1
 302 0004 FEE7     		b	.L16
 303              		.cfi_endproc
 304              	.LFE6:
 306 0006 00BF     		.section	.text.DebugMon_Handler,"ax",%progbits
 307              		.align	2
 308              		.weak	DebugMon_Handler
 309              		.thumb
 310              		.thumb_func
 312              	DebugMon_Handler:
 313              	.LFB7:
 326:../src/cr_startup_lpc17.c **** }
 327:../src/cr_startup_lpc17.c **** 
 328:../src/cr_startup_lpc17.c **** void DebugMon_Handler(void)
 329:../src/cr_startup_lpc17.c **** {
 314              		.loc 1 329 0
 315              		.cfi_startproc
 316              		@ args = 0, pretend = 0, frame = 0
 317              		@ frame_needed = 1, uses_anonymous_args = 0
 318              		@ link register save eliminated.
 319 0000 80B4     		push	{r7}
 320              	.LCFI15:
 321              		.cfi_def_cfa_offset 4
 322              		.cfi_offset 7, -4
 323 0002 00AF     		add	r7, sp, #0
 324              	.LCFI16:
 325              		.cfi_def_cfa_register 7
 326              	.L18:
 330:../src/cr_startup_lpc17.c ****     while(1)
 331:../src/cr_startup_lpc17.c ****     {
 332:../src/cr_startup_lpc17.c ****     }
 327              		.loc 1 332 0 discriminator 1
 328 0004 FEE7     		b	.L18
 329              		.cfi_endproc
 330              	.LFE7:
 332 0006 00BF     		.section	.text.PendSV_Handler,"ax",%progbits
 333              		.align	2
 334              		.weak	PendSV_Handler
 335              		.thumb
 336              		.thumb_func
 338              	PendSV_Handler:
 339              	.LFB8:
 333:../src/cr_startup_lpc17.c **** }
 334:../src/cr_startup_lpc17.c **** 
 335:../src/cr_startup_lpc17.c **** void PendSV_Handler(void)
 336:../src/cr_startup_lpc17.c **** {
 340              		.loc 1 336 0
 341              		.cfi_startproc
 342              		@ args = 0, pretend = 0, frame = 0
 343              		@ frame_needed = 1, uses_anonymous_args = 0
 344              		@ link register save eliminated.
 345 0000 80B4     		push	{r7}
 346              	.LCFI17:
 347              		.cfi_def_cfa_offset 4
 348              		.cfi_offset 7, -4
 349 0002 00AF     		add	r7, sp, #0
 350              	.LCFI18:
 351              		.cfi_def_cfa_register 7
 352              	.L20:
 337:../src/cr_startup_lpc17.c ****     while(1)
 338:../src/cr_startup_lpc17.c ****     {
 339:../src/cr_startup_lpc17.c ****     }
 353              		.loc 1 339 0 discriminator 1
 354 0004 FEE7     		b	.L20
 355              		.cfi_endproc
 356              	.LFE8:
 358 0006 00BF     		.section	.text.SysTick_Handler,"ax",%progbits
 359              		.align	2
 360              		.weak	SysTick_Handler
 361              		.thumb
 362              		.thumb_func
 364              	SysTick_Handler:
 365              	.LFB9:
 340:../src/cr_startup_lpc17.c **** }
 341:../src/cr_startup_lpc17.c **** 
 342:../src/cr_startup_lpc17.c **** void SysTick_Handler(void) 
 343:../src/cr_startup_lpc17.c **** {
 366              		.loc 1 343 0
 367              		.cfi_startproc
 368              		@ args = 0, pretend = 0, frame = 0
 369              		@ frame_needed = 1, uses_anonymous_args = 0
 370              		@ link register save eliminated.
 371 0000 80B4     		push	{r7}
 372              	.LCFI19:
 373              		.cfi_def_cfa_offset 4
 374              		.cfi_offset 7, -4
 375 0002 00AF     		add	r7, sp, #0
 376              	.LCFI20:
 377              		.cfi_def_cfa_register 7
 378              	.L22:
 344:../src/cr_startup_lpc17.c ****     while(1)
 345:../src/cr_startup_lpc17.c ****     {
 346:../src/cr_startup_lpc17.c ****     }
 379              		.loc 1 346 0 discriminator 1
 380 0004 FEE7     		b	.L22
 381              		.cfi_endproc
 382              	.LFE9:
 384 0006 00BF     		.section	.text.IntDefaultHandler,"ax",%progbits
 385              		.align	2
 386              		.weak	IntDefaultHandler
 387              		.thumb
 388              		.thumb_func
 390              	IntDefaultHandler:
 391              	.LFB10:
 347:../src/cr_startup_lpc17.c **** }
 348:../src/cr_startup_lpc17.c **** 
 349:../src/cr_startup_lpc17.c **** 
 350:../src/cr_startup_lpc17.c **** //*****************************************************************************
 351:../src/cr_startup_lpc17.c **** //
 352:../src/cr_startup_lpc17.c **** // Processor ends up here if an unexpected interrupt occurs or a handler
 353:../src/cr_startup_lpc17.c **** // is not present in the application code.
 354:../src/cr_startup_lpc17.c **** //
 355:../src/cr_startup_lpc17.c **** //*****************************************************************************
 356:../src/cr_startup_lpc17.c **** void IntDefaultHandler(void)
 357:../src/cr_startup_lpc17.c **** {
 392              		.loc 1 357 0
 393              		.cfi_startproc
 394              		@ args = 0, pretend = 0, frame = 0
 395              		@ frame_needed = 1, uses_anonymous_args = 0
 396              		@ link register save eliminated.
 397 0000 80B4     		push	{r7}
 398              	.LCFI21:
 399              		.cfi_def_cfa_offset 4
 400              		.cfi_offset 7, -4
 401 0002 00AF     		add	r7, sp, #0
 402              	.LCFI22:
 403              		.cfi_def_cfa_register 7
 404              	.L24:
 358:../src/cr_startup_lpc17.c ****     //
 359:../src/cr_startup_lpc17.c ****     // Go into an infinite loop.
 360:../src/cr_startup_lpc17.c ****     //
 361:../src/cr_startup_lpc17.c ****     while(1)
 362:../src/cr_startup_lpc17.c ****     {
 363:../src/cr_startup_lpc17.c ****     }
 405              		.loc 1 363 0 discriminator 1
 406 0004 FEE7     		b	.L24
 407              		.cfi_endproc
 408              	.LFE10:
 410              		.weak	WDT_IRQHandler
 411              		.thumb_set WDT_IRQHandler,IntDefaultHandler
 412              		.weak	TIMER0_IRQHandler
 413              		.thumb_set TIMER0_IRQHandler,IntDefaultHandler
 414              		.weak	TIMER1_IRQHandler
 415              		.thumb_set TIMER1_IRQHandler,IntDefaultHandler
 416              		.weak	TIMER2_IRQHandler
 417              		.thumb_set TIMER2_IRQHandler,IntDefaultHandler
 418              		.weak	TIMER3_IRQHandler
 419              		.thumb_set TIMER3_IRQHandler,IntDefaultHandler
 420              		.weak	UART0_IRQHandler
 421              		.thumb_set UART0_IRQHandler,IntDefaultHandler
 422              		.weak	UART1_IRQHandler
 423              		.thumb_set UART1_IRQHandler,IntDefaultHandler
 424              		.weak	UART2_IRQHandler
 425              		.thumb_set UART2_IRQHandler,IntDefaultHandler
 426              		.weak	UART3_IRQHandler
 427              		.thumb_set UART3_IRQHandler,IntDefaultHandler
 428              		.weak	PWM1_IRQHandler
 429              		.thumb_set PWM1_IRQHandler,IntDefaultHandler
 430              		.weak	I2C0_IRQHandler
 431              		.thumb_set I2C0_IRQHandler,IntDefaultHandler
 432              		.weak	I2C1_IRQHandler
 433              		.thumb_set I2C1_IRQHandler,IntDefaultHandler
 434              		.weak	I2C2_IRQHandler
 435              		.thumb_set I2C2_IRQHandler,IntDefaultHandler
 436              		.weak	SPI_IRQHandler
 437              		.thumb_set SPI_IRQHandler,IntDefaultHandler
 438              		.weak	SSP0_IRQHandler
 439              		.thumb_set SSP0_IRQHandler,IntDefaultHandler
 440              		.weak	SSP1_IRQHandler
 441              		.thumb_set SSP1_IRQHandler,IntDefaultHandler
 442              		.weak	PLL0_IRQHandler
 443              		.thumb_set PLL0_IRQHandler,IntDefaultHandler
 444              		.weak	RTC_IRQHandler
 445              		.thumb_set RTC_IRQHandler,IntDefaultHandler
 446              		.weak	EINT0_IRQHandler
 447              		.thumb_set EINT0_IRQHandler,IntDefaultHandler
 448              		.weak	EINT1_IRQHandler
 449              		.thumb_set EINT1_IRQHandler,IntDefaultHandler
 450              		.weak	EINT2_IRQHandler
 451              		.thumb_set EINT2_IRQHandler,IntDefaultHandler
 452              		.weak	EINT3_IRQHandler
 453              		.thumb_set EINT3_IRQHandler,IntDefaultHandler
 454              		.weak	ADC_IRQHandler
 455              		.thumb_set ADC_IRQHandler,IntDefaultHandler
 456              		.weak	BOD_IRQHandler
 457              		.thumb_set BOD_IRQHandler,IntDefaultHandler
 458              		.weak	USB_IRQHandler
 459              		.thumb_set USB_IRQHandler,IntDefaultHandler
 460              		.weak	CAN_IRQHandler
 461              		.thumb_set CAN_IRQHandler,IntDefaultHandler
 462              		.weak	DMA_IRQHandler
 463              		.thumb_set DMA_IRQHandler,IntDefaultHandler
 464              		.weak	I2S_IRQHandler
 465              		.thumb_set I2S_IRQHandler,IntDefaultHandler
 466              		.weak	ENET_IRQHandler
 467              		.thumb_set ENET_IRQHandler,IntDefaultHandler
 468              		.weak	RIT_IRQHandler
 469              		.thumb_set RIT_IRQHandler,IntDefaultHandler
 470              		.weak	MCPWM_IRQHandler
 471              		.thumb_set MCPWM_IRQHandler,IntDefaultHandler
 472              		.weak	QEI_IRQHandler
 473              		.thumb_set QEI_IRQHandler,IntDefaultHandler
 474              		.weak	PLL1_IRQHandler
 475              		.thumb_set PLL1_IRQHandler,IntDefaultHandler
 476              		.weak	USBActivity_IRQHandler
 477              		.thumb_set USBActivity_IRQHandler,IntDefaultHandler
 478              		.weak	CANActivity_IRQHandler
 479              		.thumb_set CANActivity_IRQHandler,IntDefaultHandler
 480 0006 00BF     		.text
 481              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:00000000 cr_startup_lpc17.c
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:23     .isr_vector:00000000 g_pfnVectors
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:20     .isr_vector:00000000 $d
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:81     .text.ResetISR:00000000 ResetISR
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:156    .text.NMI_Handler:00000000 NMI_Handler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:182    .text.HardFault_Handler:00000000 HardFault_Handler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:208    .text.MemManage_Handler:00000000 MemManage_Handler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:234    .text.BusFault_Handler:00000000 BusFault_Handler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:260    .text.UsageFault_Handler:00000000 UsageFault_Handler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:286    .text.SVCall_Handler:00000000 SVCall_Handler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:312    .text.DebugMon_Handler:00000000 DebugMon_Handler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:338    .text.PendSV_Handler:00000000 PendSV_Handler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:364    .text.SysTick_Handler:00000000 SysTick_Handler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 WDT_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 TIMER0_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 TIMER1_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 TIMER2_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 TIMER3_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 UART0_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 UART1_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 UART2_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 UART3_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 PWM1_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 I2C0_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 I2C1_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 I2C2_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 SPI_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 SSP0_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 SSP1_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 PLL0_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 RTC_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 EINT0_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 EINT1_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 EINT2_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 EINT3_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 ADC_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 BOD_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 USB_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 CAN_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 DMA_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 I2S_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 ENET_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 RIT_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 MCPWM_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 QEI_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 PLL1_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 USBActivity_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 CANActivity_IRQHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:76     .text.ResetISR:00000000 $t
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:133    .text.ResetISR:0000004a zero_loop
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:151    .text.NMI_Handler:00000000 $t
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:177    .text.HardFault_Handler:00000000 $t
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:203    .text.MemManage_Handler:00000000 $t
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:229    .text.BusFault_Handler:00000000 $t
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:255    .text.UsageFault_Handler:00000000 $t
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:281    .text.SVCall_Handler:00000000 $t
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:307    .text.DebugMon_Handler:00000000 $t
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:333    .text.PendSV_Handler:00000000 $t
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:359    .text.SysTick_Handler:00000000 $t
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:385    .text.IntDefaultHandler:00000000 $t
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:390    .text.IntDefaultHandler:00000000 IntDefaultHandler
C:\Users\ngnig\AppData\Local\Temp\cc6CVjh3.s:150    .text.ResetISR:0000005e $d
                     .debug_frame:00000010 $d

UNDEFINED SYMBOLS
_vStackTop
_etext
_data
_edata
_bss
_ebss
SystemInit
__main
