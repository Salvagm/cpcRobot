;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.4 #9329 (Linux)
; This file was generated Mon Oct 12 17:40:40 2015
;--------------------------------------------------------
	.module entities
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _character
	.globl _getPlayer
	.globl _createMapCollider
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
;src/entities/entities.c:36: TCharacter *getPlayer()
;	---------------------------------
; Function getPlayer
; ---------------------------------
_getPlayer::
;src/entities/entities.c:38: return &character;
	ld	hl,#_character
	ret
_character:
	.dw #0xC000
	.dw _g_character
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x10	; 16
	.dw #0x0000
	.dw #0xC000
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
;src/entities/entities.c:41: TCollider *createMapCollider(u8 x, u8 y, u8 width, u8 height)
;	---------------------------------
; Function createMapCollider
; ---------------------------------
_createMapCollider::
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;src/entities/entities.c:43: TCollider col = 
	ld	hl,#0x0000
	add	hl,sp
	ld	iy,#8
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
	ld	hl,#0x0000
	add	hl,sp
	ld	e,l
	ld	d,h
	inc	hl
	ld	iy,#9
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	iy,#10
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	iy,#11
	add	iy,sp
	ld	a,0 (iy)
	ld	(hl),a
	ld	hl,#0x0004
	add	hl,de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/entities/entities.c:49: return &col;
	ex	de,hl
	pop	af
	pop	af
	pop	af
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
