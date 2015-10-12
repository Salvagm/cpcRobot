;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.4 #9329 (Linux)
; This file was generated Mon Oct 12 18:21:21 2015
;--------------------------------------------------------
	.module physics
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _resetIndex
	.globl _insertInCollisionArray
	.globl _getCollisionedCollider
	.globl _topRightIndex
	.globl _botRighttIndex
	.globl _topLeftIndex
	.globl _botLeftIndex
	.globl _TRstaticColliders
	.globl _TLstaticColliders
	.globl _BRstaticColliders
	.globl _BLstaticColliders
	.globl _addStaticCollider
	.globl _checkWorldCollision
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
_BLstaticColliders::
	.ds 10
_BRstaticColliders::
	.ds 10
_TLstaticColliders::
	.ds 10
_TRstaticColliders::
	.ds 10
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
;src/utilities/physics.c:28: TCollider* getCollisionedCollider(TCollider* vCollider[] , TCollider* entCollider, u8 vColliderSize)
;	---------------------------------
; Function getCollisionedCollider
; ---------------------------------
_getCollisionedCollider::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-15
	add	hl,sp
	ld	sp,hl
;src/utilities/physics.c:34: u8 index = vColliderSize;
	ld	a,8 (ix)
	ld	-3 (ix),a
;src/utilities/physics.c:36: i8 entTopY = entCollider->y;
	ld	e,6 (ix)
	ld	d,7 (ix)
	ld	l, e
	ld	h, d
	inc	hl
	ld	c,(hl)
	ld	-9 (ix),c
;src/utilities/physics.c:37: i8 entBotY = entCollider->y + entCollider->h;
	push	de
	pop	iy
	ld	l,3 (iy)
	add	hl, bc
	ld	-10 (ix),l
;src/utilities/physics.c:38: i8 entLefX = entCollider->x;
	ld	a,(de)
	ld	c,a
	ld	-11 (ix),c
;src/utilities/physics.c:39: i8 entRightX = entCollider->x + entCollider->w;
	ex	de,hl
	inc	hl
	inc	hl
	ld	l,(hl)
	add	hl, bc
	ld	c,l
;src/utilities/physics.c:40: TCollider* collisionedColliders[2] = {0,0};
	ld	hl,#0x0000
	add	hl,sp
	ld	e,l
	ld	d,h
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/utilities/physics.c:42: while(index)
	ld	-8 (ix),#0x00
00106$:
	ld	a,-3 (ix)
	or	a, a
	jp	Z,00108$
;src/utilities/physics.c:44: blockLeftX = entRightX - vCollider[index]->x ; // X_1 + W_1 - X_2 > 0
	ld	l,-3 (ix)
	ld	h,#0x00
	add	hl, hl
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,-2 (ix)
	add	a, 4 (ix)
	ld	l,a
	ld	a,-1 (ix)
	adc	a, 5 (ix)
	ld	h,a
	ld	a,(hl)
	ld	-2 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-1 (ix),a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	b,(hl)
	ld	h,b
	ld	a,c
	sub	a, h
	ld	-6 (ix),a
;src/utilities/physics.c:45: blockRightX = vCollider[index]->x - vCollider[index]->w - entLefX; // X_2 + W_2 - X_1 > 0
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	inc	hl
	ld	h,(hl)
	ld	a,b
	sub	a, h
	sub	a, -11 (ix)
	ld	-7 (ix),a
;src/utilities/physics.c:46: blockBotY = vCollider[index]->y + vCollider[index]->h - entTopY; // Y_2 + H_2 - Y_1 > 0
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	ld	b,(hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	h,(hl)
	ld	a,b
	add	a, h
	sub	a, -9 (ix)
	ld	-5 (ix),a
;src/utilities/physics.c:47: blockTopY = entBotY - vCollider[index]->y ; // Y_1 + H_1 - Y_2 > 0
	ld	a,-10 (ix)
	sub	a, b
	ld	-4 (ix),a
;src/utilities/physics.c:49: if(blockLeftX && blockRightX && blockBotY && blockTopY)
	ld	a,-6 (ix)
	or	a, a
	jr	Z,00102$
	ld	a,-7 (ix)
	or	a, a
	jr	Z,00102$
	ld	a,-5 (ix)
	or	a, a
	jr	Z,00102$
	ld	a,-4 (ix)
	or	a, a
	jr	Z,00102$
;src/utilities/physics.c:51: collisionedColliders[collisions] = vCollider[index];
	ld	l,-8 (ix)
	ld	h,#0x00
	add	hl, hl
	add	hl,de
	ld	a,-2 (ix)
	ld	(hl),a
	inc	hl
	ld	a,-1 (ix)
	ld	(hl),a
;src/utilities/physics.c:52: ++collisions;
	inc	-8 (ix)
00102$:
;src/utilities/physics.c:55: --index;
	dec	-3 (ix)
	jp	00106$
00108$:
;src/utilities/physics.c:57: return collisionedColliders;
	ex	de,hl
	ld	sp, ix
	pop	ix
	ret
;src/utilities/physics.c:61: void insertInCollisionArray(TCollider *col, u8 pointX, u8 pointY)
;	---------------------------------
; Function insertInCollisionArray
; ---------------------------------
_insertInCollisionArray::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/utilities/physics.c:65: if(pointX < MID_VSCREEN)
	ld	a,6 (ix)
	sub	a, #0x28
	ld	a,#0x00
	rla
	ld	c,a
;src/utilities/physics.c:63: if(pointY < MID_HSCREEN)
	ld	a,7 (ix)
	sub	a, #0x64
	jr	NC,00108$
;src/utilities/physics.c:65: if(pointX < MID_VSCREEN)
	ld	a,c
	or	a, a
	jr	Z,00102$
;src/utilities/physics.c:67: BLstaticColliders[botLeftIndex] = col;	
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
;src/utilities/physics.c:68: ++botLeftIndex;
	ld	hl, #_botLeftIndex+0
	inc	(hl)
	jr	00110$
00102$:
;src/utilities/physics.c:72: BRstaticColliders[botRighttIndex] = col;
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
;src/utilities/physics.c:73: ++botRighttIndex;
	ld	hl, #_botRighttIndex+0
	inc	(hl)
	jr	00110$
00108$:
;src/utilities/physics.c:78: if(pointX < MID_VSCREEN)
	ld	a,c
	or	a, a
	jr	Z,00105$
;src/utilities/physics.c:80: TLstaticColliders[topLeftIndex] = col;	
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
;src/utilities/physics.c:81: ++topLeftIndex;
	ld	hl, #_topLeftIndex+0
	inc	(hl)
	jr	00110$
00105$:
;src/utilities/physics.c:85: TRstaticColliders[topRightIndex] = col;	
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
;src/utilities/physics.c:86: ++topRightIndex;
	ld	hl, #_topRightIndex+0
	inc	(hl)
00110$:
	pop	ix
	ret
;src/utilities/physics.c:95: void addStaticCollider(TCollider* col)
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
;src/utilities/physics.c:97: insertInCollisionArray(col, col->x, col->y);
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	hl,#0x0001
	add	hl,de
	ld	-4 (ix),l
	ld	-3 (ix),h
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
;src/utilities/physics.c:98: insertInCollisionArray(col, col->x+col->w, col->y);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
;src/utilities/physics.c:99: insertInCollisionArray(col, col->x, col->y+col->h);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	b,(hl)
	ld	hl,#0x0003
	add	hl,de
	ex	(sp), hl
	pop	hl
	push	hl
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
;src/utilities/physics.c:100: insertInCollisionArray(col, col->x+col->w, col->y+col->h);	
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	b,(hl)
	pop	hl
	push	hl
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
;src/utilities/physics.c:103: TCollider* checkWorldCollision(TCollider* entCollider)
;	---------------------------------
; Function checkWorldCollision
; ---------------------------------
_checkWorldCollision::
;src/utilities/physics.c:107: getCollisionedCollider(TLstaticColliders,entCollider,topLeftIndex);
	ld	de,#_TLstaticColliders
	ld	a,(_topLeftIndex)
	push	af
	inc	sp
	ld	hl, #3
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	push	de
	call	_getCollisionedCollider
	pop	af
	pop	af
	inc	sp
;src/utilities/physics.c:110: return collision;
	ld	hl,#0x0000
	ret
;src/utilities/physics.c:113: void resetIndex()
;	---------------------------------
; Function resetIndex
; ---------------------------------
_resetIndex::
;src/utilities/physics.c:115: botLeftIndex = 0;
	ld	hl,#_botLeftIndex + 0
	ld	(hl), #0x00
;src/utilities/physics.c:116: topLeftIndex = 0;
	ld	hl,#_topLeftIndex + 0
	ld	(hl), #0x00
;src/utilities/physics.c:117: botRighttIndex = 0;
	ld	hl,#_botRighttIndex + 0
	ld	(hl), #0x00
;src/utilities/physics.c:118: topRightIndex = 0;
	ld	hl,#_topRightIndex + 0
	ld	(hl), #0x00
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__BLstaticColliders:
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
__xinit__BRstaticColliders:
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
__xinit__TLstaticColliders:
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
__xinit__TRstaticColliders:
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
	.dw #0x0000
__xinit__botLeftIndex:
	.db #0x00	; 0
__xinit__topLeftIndex:
	.db #0x00	; 0
__xinit__botRighttIndex:
	.db #0x00	; 0
__xinit__topRightIndex:
	.db #0x00	; 0
	.area _CABS (ABS)
