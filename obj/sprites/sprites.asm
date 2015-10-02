;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 26 2015) (Linux)
; This file was generated Fri Oct  2 21:47:40 2015
;--------------------------------------------------------
	.module sprites
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_character
	.globl _g_palette
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
_g_palette:
	.db #0x1A	; 26
	.db #0x18	; 24
	.db #0x0F	; 15
	.db #0x03	; 3
_g_character:
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0x77	; 119	'w'
	.db #0x88	; 136
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xCC	; 204
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0xF7	; 247
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x33	; 51	'3'
	.db #0xCC	; 204
	.db #0x88	; 136
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0x11	; 17
	.db #0x2E	; 46
	.db #0x88	; 136
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x8F	; 143
	.db #0x11	; 17
	.db #0xEE	; 238
	.db #0x88	; 136
	.db #0x56	; 86	'V'
	.db #0x00	; 0
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x11	; 17
	.db #0xEA	; 234
	.db #0x88	; 136
	.db #0x56	; 86	'V'
	.db #0x00	; 0
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x11	; 17
	.db #0xEA	; 234
	.db #0x88	; 136
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x11	; 17
	.db #0xEA	; 234
	.db #0x88	; 136
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0x00	; 0
	.db #0x8F	; 143
	.db #0x11	; 17
	.db #0xEE	; 238
	.db #0x88	; 136
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x11	; 17
	.db #0x2E	; 46
	.db #0xCC	; 204
	.db #0x33	; 51	'3'
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0x33	; 51	'3'
	.db #0xCC	; 204
	.db #0xEE	; 238
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0xE7	; 231
	.db #0x00	; 0
	.db #0x3D	; 61
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xEE	; 238
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0xE7	; 231
	.db #0x00	; 0
	.db #0x3D	; 61
	.db #0x00	; 0
	.db #0xFF	; 255
	.db #0xEE	; 238
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0xF7	; 247
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0x33	; 51	'3'
	.db #0xCC	; 204
	.db #0xEE	; 238
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x6F	; 111	'o'
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0xFF	; 255
	.db #0x00	; 0
	.db #0xEE	; 238
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x00	; 0
	.db #0x0F	; 15
	.db #0x77	; 119	'w'
	.db #0x88	; 136
	.db #0xEE	; 238
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x1F	; 31
	.db #0x00	; 0
	.db #0xCF	; 207
	.db #0x77	; 119	'w'
	.db #0x88	; 136
	.area _INITIALIZER
	.area _CABS (ABS)
