                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.4 #9329 (Linux)
                              4 ; This file was generated Wed Oct  7 20:30:13 2015
                              5 ;--------------------------------------------------------
                              6 	.module entities
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _character
                             13 	.globl _getPlayer
                             14 	.globl _createMapCollider
                             15 ;--------------------------------------------------------
                             16 ; special function registers
                             17 ;--------------------------------------------------------
                             18 ;--------------------------------------------------------
                             19 ; ram data
                             20 ;--------------------------------------------------------
                             21 	.area _DATA
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _INITIALIZED
                             26 ;--------------------------------------------------------
                             27 ; absolute external ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DABS (ABS)
                             30 ;--------------------------------------------------------
                             31 ; global & static initialisations
                             32 ;--------------------------------------------------------
                             33 	.area _HOME
                             34 	.area _GSINIT
                             35 	.area _GSFINAL
                             36 	.area _GSINIT
                             37 ;--------------------------------------------------------
                             38 ; Home
                             39 ;--------------------------------------------------------
                             40 	.area _HOME
                             41 	.area _HOME
                             42 ;--------------------------------------------------------
                             43 ; code
                             44 ;--------------------------------------------------------
                             45 	.area _CODE
                             46 ;src/entities/entities.c:36: TCharacter *getPlayer()
                             47 ;	---------------------------------
                             48 ; Function getPlayer
                             49 ; ---------------------------------
   04C8                      50 _getPlayer::
                             51 ;src/entities/entities.c:38: return &character;
   04C8 21 CC 04      [10]   52 	ld	hl,#_character
   04CB C9            [10]   53 	ret
   04CC                      54 _character:
   04CC 00 C0                55 	.dw #0xC000
   04CE 48 04                56 	.dw _g_character
   04D0 00                   57 	.db #0x00	; 0
   04D1 00                   58 	.db #0x00	; 0
   04D2 04                   59 	.db #0x04	; 4
   04D3 10                   60 	.db #0x10	; 16
   04D4 00 00                61 	.dw #0x0000
   04D6 00 C0                62 	.dw #0xC000
   04D8 01                   63 	.db #0x01	; 1
   04D9 01                   64 	.db #0x01	; 1
   04DA 00                   65 	.db #0x00	;  0
   04DB 00                   66 	.db #0x00	;  0
   04DC 00                   67 	.db #0x00	; 0
   04DD 00                   68 	.db #0x00	; 0
   04DE 01                   69 	.db #0x01	; 1
   04DF 03                   70 	.db #0x03	; 3
                             71 ;src/entities/entities.c:41: TCollider *createMapCollider(u8 x, u8 y, u8 width, u8 height)
                             72 ;	---------------------------------
                             73 ; Function createMapCollider
                             74 ; ---------------------------------
   04E0                      75 _createMapCollider::
   04E0 21 FA FF      [10]   76 	ld	hl,#-6
   04E3 39            [11]   77 	add	hl,sp
   04E4 F9            [ 6]   78 	ld	sp,hl
                             79 ;src/entities/entities.c:43: TCollider col = 
   04E5 21 00 00      [10]   80 	ld	hl,#0x0000
   04E8 39            [11]   81 	add	hl,sp
   04E9 FD 21 08 00   [14]   82 	ld	iy,#8
   04ED FD 39         [15]   83 	add	iy,sp
   04EF FD 7E 00      [19]   84 	ld	a,0 (iy)
   04F2 77            [ 7]   85 	ld	(hl),a
   04F3 21 00 00      [10]   86 	ld	hl,#0x0000
   04F6 39            [11]   87 	add	hl,sp
   04F7 5D            [ 4]   88 	ld	e,l
   04F8 54            [ 4]   89 	ld	d,h
   04F9 23            [ 6]   90 	inc	hl
   04FA FD 21 09 00   [14]   91 	ld	iy,#9
   04FE FD 39         [15]   92 	add	iy,sp
   0500 FD 7E 00      [19]   93 	ld	a,0 (iy)
   0503 77            [ 7]   94 	ld	(hl),a
   0504 6B            [ 4]   95 	ld	l, e
   0505 62            [ 4]   96 	ld	h, d
   0506 23            [ 6]   97 	inc	hl
   0507 23            [ 6]   98 	inc	hl
   0508 FD 21 0A 00   [14]   99 	ld	iy,#10
   050C FD 39         [15]  100 	add	iy,sp
   050E FD 7E 00      [19]  101 	ld	a,0 (iy)
   0511 77            [ 7]  102 	ld	(hl),a
   0512 6B            [ 4]  103 	ld	l, e
   0513 62            [ 4]  104 	ld	h, d
   0514 23            [ 6]  105 	inc	hl
   0515 23            [ 6]  106 	inc	hl
   0516 23            [ 6]  107 	inc	hl
   0517 FD 21 0B 00   [14]  108 	ld	iy,#11
   051B FD 39         [15]  109 	add	iy,sp
   051D FD 7E 00      [19]  110 	ld	a,0 (iy)
   0520 77            [ 7]  111 	ld	(hl),a
   0521 21 04 00      [10]  112 	ld	hl,#0x0004
   0524 19            [11]  113 	add	hl,de
   0525 AF            [ 4]  114 	xor	a, a
   0526 77            [ 7]  115 	ld	(hl), a
   0527 23            [ 6]  116 	inc	hl
   0528 77            [ 7]  117 	ld	(hl), a
                            118 ;src/entities/entities.c:49: return &col;
   0529 EB            [ 4]  119 	ex	de,hl
   052A F1            [10]  120 	pop	af
   052B F1            [10]  121 	pop	af
   052C F1            [10]  122 	pop	af
   052D C9            [10]  123 	ret
                            124 	.area _CODE
                            125 	.area _INITIALIZER
                            126 	.area _CABS (ABS)
