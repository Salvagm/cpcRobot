;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.4 #9329 (Linux)
; This file was generated Mon Oct 12 17:40:39 2015
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
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/game.c:32: x = &(player->pe.de.e.c.x);
	ld	de,(_player)
	ld	hl,#0x0004
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
;src/game.c:33: y = &(player->pe.de.e.c.y);
	ld	hl,#0x0005
	add	hl,de
	ex	(sp), hl
;src/game.c:34: player->pe.de.e.pscreen = player->pe.de.npscreen;
	ld	l, e
	ld	h, d
	ld	bc, #0x000A
	add	hl, bc
	ld	b,(hl)
	inc	hl
	ld	c,(hl)
	ld	a,b
	ld	(de),a
	inc	de
	ld	a,c
	ld	(de),a
;src/game.c:36: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/game.c:37: if      (cpct_isKeyPressed(Key_CursorRight) && (*x) <  80 - SPR_W) { 
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00105$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	ld	a,c
	sub	a, #0x4C
	jr	NC,00105$
;src/game.c:38: player->pe.de.npscreen = cpct_getScreenPtr(INIT_VMEM,++(*x),*y);
	ld	de,(_player)
	ld	hl,#0x000A
	add	hl,de
	ex	de,hl
	pop	hl
	push	hl
	ld	b,(hl)
	ld	a,c
	inc	a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),a
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	b,l
	ld	c,h
	pop	de
	ld	a,b
	ld	(de),a
	inc	de
	ld	a,c
	ld	(de),a
	jr	00106$
00105$:
;src/game.c:40: else if (cpct_isKeyPressed(Key_CursorLeft)  && (*x) >   0        ) {
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00106$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	b,(hl)
	ld	a,b
	or	a, a
	jr	Z,00106$
;src/game.c:41: player->pe.de.npscreen = cpct_getScreenPtr(INIT_VMEM,--(*x),*y);
	ld	de,(_player)
	ld	hl,#0x000A
	add	hl,de
	ex	de,hl
	pop	hl
	push	hl
	ld	c,(hl)
	dec	b
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl),b
	push	de
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	b,l
	ld	c,h
	pop	de
	ld	a,b
	ld	(de),a
	inc	de
	ld	a,c
	ld	(de),a
00106$:
;src/game.c:43: if      (cpct_isKeyPressed(Key_CursorUp)    && *y >   0        ) { 
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00112$
	pop	hl
	push	hl
	ld	a,(hl)
	or	a, a
	jr	Z,00112$
;src/game.c:44: *y = (*y)-3;
	add	a,#0xFD
	ld	b,a
	pop	hl
	push	hl
	ld	(hl),b
;src/game.c:45: player->pe.de.npscreen = cpct_getScreenPtr(INIT_VMEM, *x, *y); 
	ld	de,(_player)
	ld	hl,#0x000A
	add	hl,de
	ex	de,hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	b,l
	ld	c,h
	pop	de
	ld	a,b
	ld	(de),a
	inc	de
	ld	a,c
	ld	(de),a
	jr	00115$
00112$:
;src/game.c:47: else if (cpct_isKeyPressed(Key_CursorDown)  && *y < 197 - SPR_H) { 
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00115$
	pop	hl
	push	hl
	ld	b,(hl)
	ld	a,b
	sub	a, #0xB5
	jr	NC,00115$
;src/game.c:48: *y = (*y)+3;
	inc	b
	inc	b
	inc	b
	pop	hl
	push	hl
	ld	(hl),b
;src/game.c:49: player->pe.de.npscreen = cpct_getScreenPtr(INIT_VMEM, *x, *y); 
	ld	de,(_player)
	ld	hl,#0x000A
	add	hl,de
	ex	de,hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a,(hl)
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	b,l
	ld	c,h
	pop	de
	ld	a,b
	ld	(de),a
	inc	de
	ld	a,c
	ld	(de),a
00115$:
	ld	sp, ix
	pop	ix
	ret
;src/game.c:53: void drawAll(){
;	---------------------------------
; Function drawAll
; ---------------------------------
_drawAll::
;src/game.c:54: cpct_drawSolidBox(player->pe.de.e.pscreen, cpct_px2byteM1(1, 1, 1, 1), SPR_W, SPR_H);
	ld	hl,#0x0101
	push	hl
	ld	l, #0x01
	push	hl
	call	_cpct_px2byteM1
	pop	af
	pop	af
	ld	b,l
	ld	hl,(_player)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x1004
	push	hl
	push	bc
	inc	sp
	push	de
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	ld	iy,(_player)
;src/game.c:55: cpct_drawSpriteMasked(player->pe.de.e.sprite, player->pe.de.npscreen, SPR_W, SPR_H);
	push	iy
	pop	hl
	ld	de, #0x000A
	add	hl, de
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	e,2 (iy)
	ld	d,3 (iy)
	ld	hl,#0x1004
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	ret
;src/game.c:58: void game() {
;	---------------------------------
; Function game
; ---------------------------------
_game::
;src/game.c:60: player = getPlayer();
	call	_getPlayer
	ld	(_player),hl
;src/game.c:61: player->pe.de.e.c.e = &player->pe.de.e;
	ld	de,(_player)
	ld	hl,#0x0008
	add	hl,de
	ld	(hl),e
	inc	hl
	ld	(hl),d
;src/game.c:67: pvideomem = INIT_VMEM; 
	ld	hl,#0xC000
	ld	(_pvideomem),hl
;src/game.c:69: initializeGameScreen();   // Set up Game Screen
	call	_initializeGameScreen
;src/game.c:74: while(player->lifes > 0) {      
00101$:
	ld	iy,(_player)
	ld	a,18 (iy)
	or	a, a
	ret	Z
;src/game.c:75: cpct_waitVSYNC();            
	call	_cpct_waitVSYNC
;src/game.c:77: updateUser();                
	call	_updateUser
;src/game.c:78: drawAll();                   
	call	_drawAll
	jr	00101$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
