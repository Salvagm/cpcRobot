;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Sep 26 2015) (Linux)
; This file was generated Mon Oct  5 17:09:31 2015
;--------------------------------------------------------
	.module game
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _drawAll
	.globl _cpct_getScreenPtr
	.globl _cpct_waitVSYNC
	.globl _cpct_drawSolidBox
	.globl _cpct_drawSpriteMasked
	.globl _cpct_px2byteM1
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _pvideomem
	.globl _y
	.globl _x
	.globl _alive
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
_alive::
	.ds 1
_x::
	.ds 1
_y::
	.ds 1
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
;src/game.c:32: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/game.c:33: if      (cpct_isKeyPressed(Key_CursorRight) && x <  80 - SPR_W) { x++; pvideomem++; }
	ld	hl,#0x0200
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00105$
	ld	a,(#_x + 0)
	sub	a, #0x4C
	jr	NC,00105$
	ld	hl, #_x+0
	inc	(hl)
	ld	hl, #_pvideomem+0
	inc	(hl)
	jr	NZ,00106$
	ld	hl, #_pvideomem+1
	inc	(hl)
	jr	00106$
00105$:
;src/game.c:34: else if (cpct_isKeyPressed(Key_CursorLeft)  && x >   0        ) { x--; pvideomem--; }
	ld	hl,#0x0101
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00106$
	ld	a,(#_x + 0)
	or	a, a
	jr	Z,00106$
	ld	hl, #_x+0
	dec	(hl)
	ld	hl,(_pvideomem)
	dec	hl
	ld	(_pvideomem),hl
00106$:
;src/game.c:35: if      (cpct_isKeyPressed(Key_CursorUp)    && y >   0        ) { 
	ld	hl,#0x0100
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	jr	Z,00112$
	ld	a,(#_y + 0)
	or	a, a
	jr	Z,00112$
;src/game.c:36: y = y-3;
	ld	hl,#_y
	ld	a,(hl)
	add	a,#0xFD
	ld	(hl),a
;src/game.c:37: pvideomem = cpct_getScreenPtr(INIT_VMEM, x, y); 
	ld	a,(_y)
	push	af
	inc	sp
	ld	a,(_x)
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvideomem),hl
	ret
00112$:
;src/game.c:39: else if (cpct_isKeyPressed(Key_CursorDown)  && y < 197 - SPR_H) { 
	ld	hl,#0x0400
	call	_cpct_isKeyPressed
	ld	a,l
	or	a, a
	ret	Z
	ld	a,(#_y + 0)
	sub	a, #0xB5
	ret	NC
;src/game.c:40: y = y+3;
	ld	hl, #_y+0
	inc	(hl)
	ld	hl, #_y+0
	inc	(hl)
	ld	hl, #_y+0
	inc	(hl)
;src/game.c:41: pvideomem = cpct_getScreenPtr(INIT_VMEM, x, y); 
	ld	a,(_y)
	push	af
	inc	sp
	ld	a,(_x)
	push	af
	inc	sp
	ld	hl,#0xC000
	push	hl
	call	_cpct_getScreenPtr
	ld	(_pvideomem),hl
	ret
;src/game.c:44: void drawAll(){
;	---------------------------------
; Function drawAll
; ---------------------------------
_drawAll::
;src/game.c:46: cpct_drawSpriteMasked(g_character, pvideomem, SPR_W, SPR_H);
	ld	bc,(_pvideomem)
	ld	de,#_g_character
	ld	hl,#0x1004
	push	hl
	push	bc
	push	de
	call	_cpct_drawSpriteMasked
	ret
;src/game.c:49: void game() {
;	---------------------------------
; Function game
; ---------------------------------
_game::
;src/game.c:51: alive = 1;
	ld	hl,#_alive + 0
	ld	(hl), #0x01
;src/game.c:52: x=0, y=0;
	ld	hl,#_x + 0
	ld	(hl), #0x00
	ld	hl,#_y + 0
	ld	(hl), #0x00
;src/game.c:53: pvideomem = INIT_VMEM; 
	ld	hl,#0xC000
	ld	(_pvideomem),hl
;src/game.c:55: initializeGameScreen();   // Set up Game Screen
	call	_initializeGameScreen
;src/game.c:60: while(alive) {
00101$:
	ld	a,(#_alive + 0)
	or	a, a
	ret	Z
;src/game.c:61: cpct_waitVSYNC();            
	call	_cpct_waitVSYNC
;src/game.c:63: cpct_drawSolidBox(pvideomem, cpct_px2byteM1(1, 1, 1, 1), SPR_W, SPR_H);
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
;src/game.c:64: updateUser();                
	call	_updateUser
;src/game.c:65: drawAll();                   
	call	_drawAll
	jr	00101$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
