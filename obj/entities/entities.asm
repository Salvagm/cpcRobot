;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.4 #9329 (Linux)
; This file was generated Tue Oct  6 16:23:23 2015
;--------------------------------------------------------
	.module entities
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _character
	.globl _getPlayer
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
;src/entities/entities.c:35: TCharacter *getPlayer()
;	---------------------------------
; Function getPlayer
; ---------------------------------
_getPlayer::
;src/entities/entities.c:37: return &character;
	ld	hl,#_character
	ret
_character:
	.dw #0xC000
	.dw _g_character
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x10	; 16
	.dw #0xC000
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
