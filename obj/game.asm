;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 26 2015) (Linux)
; This file was generated Mon Oct  5 21:06:19 2015
;--------------------------------------------------------
	.module game
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _drawAll
	.globl _cpct_waitVSYNC
	.globl _cpct_drawSolidBox
	.globl _cpct_drawSpriteMasked
	.globl _cpct_px2byteM1
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _pvideomem
	.globl _character
	.globl _initializeGameScreen
	.globl _updateUser
	.globl _game
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_character::
	.ds 4
_pvideomem::
	.ds 2
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
;src/game.c:23: void initializeGameScreen() {
;	---------------------------------
; Function initializeGameScreen
; ---------------------------------
_initializeGameScreen::
;src/game.c:25: cpct_drawSolidBox(INIT_VMEM, cpct_px2byteM1(1, 1, 1, 1), 64, 200);
	ld	hl,#0x0101
	push	hl
	ld	l, #0x01
	push	hl
	call	_cpct_px2byteM1
	pop	af
	pop	af
	ld	d,l
	ld	hl,#0xC840
	push	hl
	push	de
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
;src/game.c:26: cpct_drawSolidBox(INIT_VMEM + 64, cpct_px2byteM1(1, 1, 1, 1), 16, 200);
	ld	hl,#0x0101
	push	hl
	ld	l, #0x01
	push	hl
	call	_cpct_px2byteM1
	pop	af
	pop	af
	ld	d,l
	ld	hl,#0xC810
	push	hl
	push	de
	inc	sp
	ld	hl,#0xC040
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	ret
;src/game.c:29: void updateUser() {
;	---------------------------------
; Function updateUser
; ---------------------------------
_updateUser::
;src/game.c:32: x = &(character.pe->de->e->c->x);
	ld	hl, (#_character + 0)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	de, #0x0004
	add	hl, de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
;src/game.c:35: cpct_scanKeyboard_f();
	push	de
	call	_cpct_scanKeyboard_f
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	or	a, a
	jr	Z,00105$
	ld	a,(de)
	ld	h,a
	sub	a, #0x4C
	jr	NC,00105$
	ld	a,h
	inc	a
	ld	(de),a
	ld	hl, #_pvideomem+0
	inc	(hl)
	ret	NZ
	ld	hl, #_pvideomem+1
	inc	(hl)
	ret
00105$:
;src/game.c:37: else if (cpct_isKeyPressed(Key_CursorLeft)  && (*x) >   0        ) { --(*x); --pvideomem; }
	push	de
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	or	a, a
	ret	Z
	ld	a,(de)
	or	a, a
	ret	Z
	add	a,#0xFF
	ld	(de),a
	ld	hl,(_pvideomem)
	dec	hl
	ld	(_pvideomem),hl
	ret
;src/game.c:47: void drawAll(){
;	---------------------------------
; Function drawAll
; ---------------------------------
_drawAll::
;src/game.c:49: cpct_drawSpriteMasked(character.pe->de->e->sprite, pvideomem, SPR_W, SPR_H);
	ld	bc,(_pvideomem)
	ld	hl, (#_character + 0)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x1004
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	ret
;src/game.c:52: void game() {
;	---------------------------------
; Function game
; ---------------------------------
_game::
;src/game.c:54: character.lifes = 1;   
	ld	hl,#(_character + 0x0002)
	ld	(hl),#0x01
;src/game.c:55: character.pe->de->e->c->x = 0;
	ld	hl, (#_character + 0)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	de, #0x0004
	add	hl, de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	xor	a, a
	ld	(de),a
;src/game.c:56: character.pe->de->e->c->y = 0;
	ld	hl, (#_character + 0)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	de, #0x0004
	add	hl, de
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	de
	xor	a, a
	ld	(de),a
;src/game.c:57: character.pe->de->e->sprite = g_character;
	ld	hl, (#_character + 0)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	de
	inc	de
	ld	l,e
	ld	bc,#_g_character+0
	ld	h, d
	ld	(hl),c
	inc	hl
	ld	(hl),b
;src/game.c:59: pvideomem = INIT_VMEM; 
	ld	hl,#0xC000
	ld	(_pvideomem),hl
;src/game.c:61: initializeGameScreen();   // Set up Game Screen
	call	_initializeGameScreen
;src/game.c:66: while(character.lifes > 0) {      
00101$:
	ld	a, (#(_character + 0x0002) + 0)
	or	a, a
	ret	Z
;src/game.c:67: cpct_waitVSYNC();            
	call	_cpct_waitVSYNC
;src/game.c:69: cpct_drawSolidBox(pvideomem, cpct_px2byteM1(1, 1, 1, 1), SPR_W, SPR_H);
	ld	hl,#0x0101
	push	hl
	ld	l, #0x01
	push	hl
	call	_cpct_px2byteM1
	pop	af
	pop	af
	ld	b,l
	ld	de,(_pvideomem)
	ld	hl,#0x1004
	push	hl
	push	bc
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
;src/game.c:70: updateUser();                
	call	_updateUser
;src/game.c:71: drawAll();                   
	call	_drawAll
	jr	00101$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
