                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.4 #9329 (Linux)
                              4 ; This file was generated Mon Oct 12 17:40:40 2015
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
   05D6                      50 _getPlayer::
                             51 ;src/entities/entities.c:38: return &character;
   05D6 21 DA 05      [10]   52 	ld	hl,#_character
   05D9 C9            [10]   53 	ret
   05DA                      54 _character:
   05DA 00 C0                55 	.dw #0xC000
   05DC 56 05                56 	.dw _g_character
   05DE 00                   57 	.db #0x00	; 0
   05DF 00                   58 	.db #0x00	; 0
   05E0 04                   59 	.db #0x04	; 4
   05E1 10                   60 	.db #0x10	; 16
   05E2 00 00                61 	.dw #0x0000
   05E4 00 C0                62 	.dw #0xC000
   05E6 01                   63 	.db #0x01	; 1
   05E7 01                   64 	.db #0x01	; 1
   05E8 00                   65 	.db #0x00	;  0
   05E9 00                   66 	.db #0x00	;  0
   05EA 00                   67 	.db #0x00	; 0
   05EB 00                   68 	.db #0x00	; 0
   05EC 01                   69 	.db #0x01	; 1
   05ED 03                   70 	.db #0x03	; 3
                             71 ;src/entities/entities.c:41: TCollider *createMapCollider(u8 x, u8 y, u8 width, u8 height)
                             72 ;	---------------------------------
                             73 ; Function createMapCollider
                             74 ; ---------------------------------
   05EE                      75 _createMapCollider::
   05EE 21 FA FF      [10]   76 	ld	hl,#-6
   05F1 39            [11]   77 	add	hl,sp
   05F2 F9            [ 6]   78 	ld	sp,hl
                             79 ;src/entities/entities.c:43: TCollider col = 
   05F3 21 00 00      [10]   80 	ld	hl,#0x0000
   05F6 39            [11]   81 	add	hl,sp
   05F7 FD 21 08 00   [14]   82 	ld	iy,#8
   05FB FD 39         [15]   83 	add	iy,sp
   05FD FD 7E 00      [19]   84 	ld	a,0 (iy)
   0600 77            [ 7]   85 	ld	(hl),a
   0601 21 00 00      [10]   86 	ld	hl,#0x0000
   0604 39            [11]   87 	add	hl,sp
   0605 5D            [ 4]   88 	ld	e,l
   0606 54            [ 4]   89 	ld	d,h
   0607 23            [ 6]   90 	inc	hl
   0608 FD 21 09 00   [14]   91 	ld	iy,#9
   060C FD 39         [15]   92 	add	iy,sp
   060E FD 7E 00      [19]   93 	ld	a,0 (iy)
   0611 77            [ 7]   94 	ld	(hl),a
   0612 6B            [ 4]   95 	ld	l, e
   0613 62            [ 4]   96 	ld	h, d
   0614 23            [ 6]   97 	inc	hl
   0615 23            [ 6]   98 	inc	hl
   0616 FD 21 0A 00   [14]   99 	ld	iy,#10
   061A FD 39         [15]  100 	add	iy,sp
   061C FD 7E 00      [19]  101 	ld	a,0 (iy)
   061F 77            [ 7]  102 	ld	(hl),a
   0620 6B            [ 4]  103 	ld	l, e
   0621 62            [ 4]  104 	ld	h, d
   0622 23            [ 6]  105 	inc	hl
   0623 23            [ 6]  106 	inc	hl
   0624 23            [ 6]  107 	inc	hl
   0625 FD 21 0B 00   [14]  108 	ld	iy,#11
   0629 FD 39         [15]  109 	add	iy,sp
   062B FD 7E 00      [19]  110 	ld	a,0 (iy)
   062E 77            [ 7]  111 	ld	(hl),a
   062F 21 04 00      [10]  112 	ld	hl,#0x0004
   0632 19            [11]  113 	add	hl,de
   0633 AF            [ 4]  114 	xor	a, a
   0634 77            [ 7]  115 	ld	(hl), a
   0635 23            [ 6]  116 	inc	hl
   0636 77            [ 7]  117 	ld	(hl), a
                            118 ;src/entities/entities.c:49: return &col;
   0637 EB            [ 4]  119 	ex	de,hl
   0638 F1            [10]  120 	pop	af
   0639 F1            [10]  121 	pop	af
   063A F1            [10]  122 	pop	af
   063B C9            [10]  123 	ret
                            124 	.area _CODE
                            125 	.area _INITIALIZER
                            126 	.area _CABS (ABS)
