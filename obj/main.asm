;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.4 #9329 (Linux)
; This file was generated Tue Oct  6 15:22:14 2015
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _init
	.globl _game
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_fw2hw
	.globl _cpct_setVideoMode
	.globl _cpct_disableFirmware
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
;src/main.c:6: void init(){
;	---------------------------------
; Function init
; ---------------------------------
_init::
;src/main.c:8: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:10: cpct_fw2hw     (g_palette, 4);
	ld	hl,#_g_palette
	ld	bc,#0x0004
	push	bc
	push	hl
	call	_cpct_fw2hw
;src/main.c:11: cpct_setPalette(g_palette, 4);
	ld	hl,#_g_palette
	ld	bc,#0x0004
	push	bc
	push	hl
	call	_cpct_setPalette
;src/main.c:12: cpct_setBorder (g_palette[3]);
	ld	a, (#_g_palette + 3)
	ld	d,a
	ld	e,#0x10
	push	de
	call	_cpct_setPALColour
;src/main.c:14: cpct_setVideoMode(1);
	ld	a,#0x01
	push	af
	inc	sp
	call	_cpct_setVideoMode
	inc	sp
	ret
;src/main.c:17: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:19: init();         
	call	_init
;src/main.c:21: while (1){
00102$:
;src/main.c:22: game();
	call	_game
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
