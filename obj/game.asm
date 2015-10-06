;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.4 #9329 (Linux)
; This file was generated Tue Oct  6 16:24:27 2015
;--------------------------------------------------------
	.module game
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _drawAll
	.globl _getPlayer
	.globl _cpct_getScreenPtr
	.globl _cpct_waitVSYNC
	.globl _cpct_drawSolidBox
	.globl _cpct_drawSpriteMasked
	.globl _cpct_px2byteM1
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _pvideomem
	.globl _player
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
_player::
	.ds 2
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
;src/game.c:22: void initializeGameScreen() {
;	---------------------------------
; Function initializeGameScreen
; ---------------------------------
_initializeGameScreen::
;src/game.c:24: cpct_drawSolidBox(INIT_VMEM, cpct_px2byteM1(1, 1, 1, 1), 64, 200);
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
;src/game.c:25: cpct_drawSolidBox(INIT_VMEM + 64, cpct_px2byteM1(1, 1, 1, 1), 16, 200);
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
;src/game.c:28: void updateUser() {
;	---------------------------------
; Function updateUser
; ---------------------------------
_updateUser::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/game.c:31: x = &(player->pe.de.e.c.x);
	ld	bc,(_player)
	ld	hl,#0x0004
	add	hl,bc
	ex	de,hl
;src/game.c:32: y = &(player->pe.de.e.c.y);
	ld	hl,#0x0005
	add	hl,bc
	ex	(sp), hl
;src/game.c:34: cpct_scanKeyboard_f();
	push	de
	call	_cpct_scanKeyboard_f
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	or	a, a
	jr	Z,00105$
	ld	a,(de)
	ld	c,a
	sub	a, #0x4C
	jr	NC,00105$
;src/game.c:36: pvideomem = cpct_getScreenPtr(INIT_VMEM,++(*x),*y);
	pop	hl
	push	hl
	ld	b,(hl)
	ld	a,c
	inc	a
	ld	(de),a
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	ld	(_pvideomem),hl
	jr	00106$
00105$:
;src/game.c:38: else if (cpct_isKeyPressed(Key_CursorLeft)  && (*x) >   0        ) {
	push	de
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	or	a, a
	jr	Z,00106$
	ld	a,(de)
	or	a, a
	jr	Z,00106$
;src/game.c:39: pvideomem = cpct_getScreenPtr(INIT_VMEM,--(*x),*y);
	pop	hl
	push	hl
	ld	b,(hl)
	add	a,#0xFF
	ld	(de),a
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	ld	(_pvideomem),hl
00106$:
;src/game.c:41: if      (cpct_isKeyPressed(Key_CursorUp)    && *y >   0        ) { 
	push	de
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	or	a, a
	jr	Z,00112$
	pop	hl
	push	hl
	ld	a,(hl)
	or	a, a
	jr	Z,00112$
;src/game.c:42: *y = (*y)-3;
	add	a,#0xFD
	ld	b,a
	pop	hl
	push	hl
	ld	(hl),b
;src/game.c:43: pvideomem = cpct_getScreenPtr(INIT_VMEM, *x, *y); 
	ld	a,(de)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvideomem),hl
	jr	00115$
00112$:
;src/game.c:45: else if (cpct_isKeyPressed(Key_CursorDown)  && *y < 197 - SPR_H) { 
	push	de
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	pop	de
	or	a, a
	jr	Z,00115$
	pop	hl
	push	hl
	ld	b,(hl)
	ld	a,b
	sub	a, #0xB5
	jr	NC,00115$
;src/game.c:46: *y = (*y)+3;
	inc	b
	inc	b
	inc	b
	pop	hl
	push	hl
	ld	(hl),b
;src/game.c:47: pvideomem = cpct_getScreenPtr(INIT_VMEM, *x, *y); 
	ld	a,(de)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvideomem),hl
00115$:
	ld	sp, ix
	pop	ix
	ret
;src/game.c:51: void drawAll(){
;	---------------------------------
; Function drawAll
; ---------------------------------
_drawAll::
;src/game.c:53: cpct_drawSpriteMasked(player->pe.de.e.sprite, pvideomem, SPR_W, SPR_H);
	ld	bc,(_pvideomem)
	ld	hl,(_player)
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
;src/game.c:56: void game() {
;	---------------------------------
; Function game
; ---------------------------------
_game::
;src/game.c:58: player = getPlayer();
	call	_getPlayer
	ld	(_player),hl
;src/game.c:64: pvideomem = INIT_VMEM; 
	ld	hl,#0xC000
	ld	(_pvideomem),hl
;src/game.c:66: initializeGameScreen();   // Set up Game Screen
	call	_initializeGameScreen
;src/game.c:71: while(player->lifes > 0) {      
00101$:
	ld	iy,(_player)
	ld	a,16 (iy)
	or	a, a
	ret	Z
;src/game.c:72: cpct_waitVSYNC();            
	call	_cpct_waitVSYNC
;src/game.c:74: cpct_drawSolidBox(pvideomem, cpct_px2byteM1(1, 1, 1, 1), SPR_W, SPR_H);
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
;src/game.c:75: updateUser();                
	call	_updateUser
;src/game.c:76: drawAll();                   
	call	_drawAll
	jr	00101$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
