;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.4 #9329 (Linux)
; This file was generated Wed Oct  7 20:33:57 2015
;--------------------------------------------------------
	.module physics
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _resetIndex
	.globl _insertInCollisionArray
	.globl _topRightIndex
	.globl _botRighttIndex
	.globl _topLeftIndex
	.globl _botLeftIndex
	.globl _TRstaticColliders
	.globl _TLstaticColliders
	.globl _BRstaticColliders
	.globl _BLstaticColliders
	.globl _addStaticCollider
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_BLstaticColliders::
	.ds 10
_BRstaticColliders::
	.ds 10
_TLstaticColliders::
	.ds 10
_TRstaticColliders::
	.ds 10
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_botLeftIndex::
	.ds 1
_topLeftIndex::
	.ds 1
_botRighttIndex::
	.ds 1
_topRightIndex::
	.ds 1
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
;src/utilities/physics.c:24: void insertInCollisionArray(TCollider *col, u8 pointX, u8 pointY)
;	---------------------------------
; Function insertInCollisionArray
; ---------------------------------
_insertInCollisionArray::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/utilities/physics.c:28: if(pointX < MID_VSCREEN)
	ld	a,6 (ix)
	sub	a, #0x28
	ld	a,#0x00
	rla
	ld	c,a
;src/utilities/physics.c:26: if(pointY < MID_HSCREEN)
	ld	a,7 (ix)
	sub	a, #0x64
	jr	NC,00108$
;src/utilities/physics.c:28: if(pointX < MID_VSCREEN)
	ld	a,c
	or	a, a
	jr	Z,00102$
;src/utilities/physics.c:30: BLstaticColliders[botLeftIndex] = col;	
	ld	iy,#_botLeftIndex
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_BLstaticColliders
	add	hl,de
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/utilities/physics.c:31: ++botLeftIndex;
	ld	hl, #_botLeftIndex+0
	inc	(hl)
	jr	00110$
00102$:
;src/utilities/physics.c:35: BRstaticColliders[botRighttIndex] = col;
	ld	iy,#_botRighttIndex
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_BRstaticColliders
	add	hl,de
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/utilities/physics.c:36: ++botRighttIndex;
	ld	hl, #_botRighttIndex+0
	inc	(hl)
	jr	00110$
00108$:
;src/utilities/physics.c:41: if(pointX < MID_VSCREEN)
	ld	a,c
	or	a, a
	jr	Z,00105$
;src/utilities/physics.c:43: TLstaticColliders[topLeftIndex] = col;	
	ld	iy,#_topLeftIndex
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_TLstaticColliders
	add	hl,de
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/utilities/physics.c:44: ++topLeftIndex;
	ld	hl, #_topLeftIndex+0
	inc	(hl)
	jr	00110$
00105$:
;src/utilities/physics.c:48: TRstaticColliders[topRightIndex] = col;	
	ld	iy,#_topRightIndex
	ld	l,0 (iy)
	ld	h,#0x00
	add	hl, hl
	ld	de,#_TRstaticColliders
	add	hl,de
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
;src/utilities/physics.c:49: ++topRightIndex;
	ld	hl, #_topRightIndex+0
	inc	(hl)
00110$:
	pop	ix
	ret
;src/utilities/physics.c:54: void addStaticCollider(TCollider *col)
;	---------------------------------
; Function addStaticCollider
; ---------------------------------
_addStaticCollider::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-6
	add	hl,sp
	ld	sp,hl
;src/utilities/physics.c:57: insertInCollisionArray(col, col->x, col->y);
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	hl,#0x0001
	add	hl,de
	ex	(sp), hl
	pop	hl
	push	hl
	ld	b,(hl)
	ld	a,(de)
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	push	de
	call	_insertInCollisionArray
	pop	af
	pop	af
	pop	de
;src/utilities/physics.c:58: insertInCollisionArray(col, col->x+col->w, col->y);
	pop	hl
	push	hl
	ld	b,(hl)
	ld	a,(de)
	ld	c,a
	ld	hl,#0x0002
	add	hl,de
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	h,(hl)
	ld	a,c
	add	a, h
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	push	de
	call	_insertInCollisionArray
	pop	af
	pop	af
	pop	de
;src/utilities/physics.c:59: insertInCollisionArray(col, col->x, col->y+col->h);
	pop	hl
	push	hl
	ld	b,(hl)
	ld	hl,#0x0003
	add	hl,de
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	l,(hl)
	ld	a,b
	add	a, l
	ld	b,a
	ld	a,(de)
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	push	de
	call	_insertInCollisionArray
	pop	af
	pop	af
	pop	de
;src/utilities/physics.c:60: insertInCollisionArray(col, col->x+col->w, col->y+col->h);	
	pop	hl
	push	hl
	ld	b,(hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	h,(hl)
	ld	a,b
	add	a, h
	ld	b,a
	ld	a,(de)
	ld	c,a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	h,(hl)
	ld	a,c
	add	a, h
	push	bc
	inc	sp
	push	af
	inc	sp
	push	de
	call	_insertInCollisionArray
	ld	sp,ix
	pop	ix
	ret
;src/utilities/physics.c:68: void resetIndex()
;	---------------------------------
; Function resetIndex
; ---------------------------------
_resetIndex::
;src/utilities/physics.c:70: botLeftIndex = 0;
	ld	hl,#_botLeftIndex + 0
	ld	(hl), #0x00
;src/utilities/physics.c:71: topLeftIndex = 0;
	ld	hl,#_topLeftIndex + 0
	ld	(hl), #0x00
;src/utilities/physics.c:72: botRighttIndex = 0;
	ld	hl,#_botRighttIndex + 0
	ld	(hl), #0x00
;src/utilities/physics.c:73: topRightIndex = 0;
	ld	hl,#_topRightIndex + 0
	ld	(hl), #0x00
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__botLeftIndex:
	.db #0x00	; 0
__xinit__topLeftIndex:
	.db #0x00	; 0
__xinit__botRighttIndex:
	.db #0x00	; 0
__xinit__topRightIndex:
	.db #0x00	; 0
	.area _CABS (ABS)
