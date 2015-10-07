                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.4 #9329 (Linux)
                              4 ; This file was generated Wed Oct  7 20:33:57 2015
                              5 ;--------------------------------------------------------
                              6 	.module physics
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _resetIndex
                             13 	.globl _insertInCollisionArray
                             14 	.globl _topRightIndex
                             15 	.globl _botRighttIndex
                             16 	.globl _topLeftIndex
                             17 	.globl _botLeftIndex
                             18 	.globl _TRstaticColliders
                             19 	.globl _TLstaticColliders
                             20 	.globl _BRstaticColliders
                             21 	.globl _BLstaticColliders
                             22 	.globl _addStaticCollider
                             23 ;--------------------------------------------------------
                             24 ; special function registers
                             25 ;--------------------------------------------------------
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DATA
   07DC                      30 _BLstaticColliders::
   07DC                      31 	.ds 10
   07E6                      32 _BRstaticColliders::
   07E6                      33 	.ds 10
   07F0                      34 _TLstaticColliders::
   07F0                      35 	.ds 10
   07FA                      36 _TRstaticColliders::
   07FA                      37 	.ds 10
                             38 ;--------------------------------------------------------
                             39 ; ram data
                             40 ;--------------------------------------------------------
                             41 	.area _INITIALIZED
   0804                      42 _botLeftIndex::
   0804                      43 	.ds 1
   0805                      44 _topLeftIndex::
   0805                      45 	.ds 1
   0806                      46 _botRighttIndex::
   0806                      47 	.ds 1
   0807                      48 _topRightIndex::
   0807                      49 	.ds 1
                             50 ;--------------------------------------------------------
                             51 ; absolute external ram data
                             52 ;--------------------------------------------------------
                             53 	.area _DABS (ABS)
                             54 ;--------------------------------------------------------
                             55 ; global & static initialisations
                             56 ;--------------------------------------------------------
                             57 	.area _HOME
                             58 	.area _GSINIT
                             59 	.area _GSFINAL
                             60 	.area _GSINIT
                             61 ;--------------------------------------------------------
                             62 ; Home
                             63 ;--------------------------------------------------------
                             64 	.area _HOME
                             65 	.area _HOME
                             66 ;--------------------------------------------------------
                             67 ; code
                             68 ;--------------------------------------------------------
                             69 	.area _CODE
                             70 ;src/utilities/physics.c:24: void insertInCollisionArray(TCollider *col, u8 pointX, u8 pointY)
                             71 ;	---------------------------------
                             72 ; Function insertInCollisionArray
                             73 ; ---------------------------------
   0305                      74 _insertInCollisionArray::
   0305 DD E5         [15]   75 	push	ix
   0307 DD 21 00 00   [14]   76 	ld	ix,#0
   030B DD 39         [15]   77 	add	ix,sp
                             78 ;src/utilities/physics.c:28: if(pointX < MID_VSCREEN)
   030D DD 7E 06      [19]   79 	ld	a,6 (ix)
   0310 D6 28         [ 7]   80 	sub	a, #0x28
   0312 3E 00         [ 7]   81 	ld	a,#0x00
   0314 17            [ 4]   82 	rla
   0315 4F            [ 4]   83 	ld	c,a
                             84 ;src/utilities/physics.c:26: if(pointY < MID_HSCREEN)
   0316 DD 7E 07      [19]   85 	ld	a,7 (ix)
   0319 D6 64         [ 7]   86 	sub	a, #0x64
   031B 30 3E         [12]   87 	jr	NC,00108$
                             88 ;src/utilities/physics.c:28: if(pointX < MID_VSCREEN)
   031D 79            [ 4]   89 	ld	a,c
   031E B7            [ 4]   90 	or	a, a
   031F 28 1D         [12]   91 	jr	Z,00102$
                             92 ;src/utilities/physics.c:30: BLstaticColliders[botLeftIndex] = col;	
   0321 FD 21 04 08   [14]   93 	ld	iy,#_botLeftIndex
   0325 FD 6E 00      [19]   94 	ld	l,0 (iy)
   0328 26 00         [ 7]   95 	ld	h,#0x00
   032A 29            [11]   96 	add	hl, hl
   032B 11 DC 07      [10]   97 	ld	de,#_BLstaticColliders
   032E 19            [11]   98 	add	hl,de
   032F DD 7E 04      [19]   99 	ld	a,4 (ix)
   0332 77            [ 7]  100 	ld	(hl),a
   0333 23            [ 6]  101 	inc	hl
   0334 DD 7E 05      [19]  102 	ld	a,5 (ix)
   0337 77            [ 7]  103 	ld	(hl),a
                            104 ;src/utilities/physics.c:31: ++botLeftIndex;
   0338 21 04 08      [10]  105 	ld	hl, #_botLeftIndex+0
   033B 34            [11]  106 	inc	(hl)
   033C 18 59         [12]  107 	jr	00110$
   033E                     108 00102$:
                            109 ;src/utilities/physics.c:35: BRstaticColliders[botRighttIndex] = col;
   033E FD 21 06 08   [14]  110 	ld	iy,#_botRighttIndex
   0342 FD 6E 00      [19]  111 	ld	l,0 (iy)
   0345 26 00         [ 7]  112 	ld	h,#0x00
   0347 29            [11]  113 	add	hl, hl
   0348 11 E6 07      [10]  114 	ld	de,#_BRstaticColliders
   034B 19            [11]  115 	add	hl,de
   034C DD 7E 04      [19]  116 	ld	a,4 (ix)
   034F 77            [ 7]  117 	ld	(hl),a
   0350 23            [ 6]  118 	inc	hl
   0351 DD 7E 05      [19]  119 	ld	a,5 (ix)
   0354 77            [ 7]  120 	ld	(hl),a
                            121 ;src/utilities/physics.c:36: ++botRighttIndex;
   0355 21 06 08      [10]  122 	ld	hl, #_botRighttIndex+0
   0358 34            [11]  123 	inc	(hl)
   0359 18 3C         [12]  124 	jr	00110$
   035B                     125 00108$:
                            126 ;src/utilities/physics.c:41: if(pointX < MID_VSCREEN)
   035B 79            [ 4]  127 	ld	a,c
   035C B7            [ 4]  128 	or	a, a
   035D 28 1D         [12]  129 	jr	Z,00105$
                            130 ;src/utilities/physics.c:43: TLstaticColliders[topLeftIndex] = col;	
   035F FD 21 05 08   [14]  131 	ld	iy,#_topLeftIndex
   0363 FD 6E 00      [19]  132 	ld	l,0 (iy)
   0366 26 00         [ 7]  133 	ld	h,#0x00
   0368 29            [11]  134 	add	hl, hl
   0369 11 F0 07      [10]  135 	ld	de,#_TLstaticColliders
   036C 19            [11]  136 	add	hl,de
   036D DD 7E 04      [19]  137 	ld	a,4 (ix)
   0370 77            [ 7]  138 	ld	(hl),a
   0371 23            [ 6]  139 	inc	hl
   0372 DD 7E 05      [19]  140 	ld	a,5 (ix)
   0375 77            [ 7]  141 	ld	(hl),a
                            142 ;src/utilities/physics.c:44: ++topLeftIndex;
   0376 21 05 08      [10]  143 	ld	hl, #_topLeftIndex+0
   0379 34            [11]  144 	inc	(hl)
   037A 18 1B         [12]  145 	jr	00110$
   037C                     146 00105$:
                            147 ;src/utilities/physics.c:48: TRstaticColliders[topRightIndex] = col;	
   037C FD 21 07 08   [14]  148 	ld	iy,#_topRightIndex
   0380 FD 6E 00      [19]  149 	ld	l,0 (iy)
   0383 26 00         [ 7]  150 	ld	h,#0x00
   0385 29            [11]  151 	add	hl, hl
   0386 11 FA 07      [10]  152 	ld	de,#_TRstaticColliders
   0389 19            [11]  153 	add	hl,de
   038A DD 7E 04      [19]  154 	ld	a,4 (ix)
   038D 77            [ 7]  155 	ld	(hl),a
   038E 23            [ 6]  156 	inc	hl
   038F DD 7E 05      [19]  157 	ld	a,5 (ix)
   0392 77            [ 7]  158 	ld	(hl),a
                            159 ;src/utilities/physics.c:49: ++topRightIndex;
   0393 21 07 08      [10]  160 	ld	hl, #_topRightIndex+0
   0396 34            [11]  161 	inc	(hl)
   0397                     162 00110$:
   0397 DD E1         [14]  163 	pop	ix
   0399 C9            [10]  164 	ret
                            165 ;src/utilities/physics.c:54: void addStaticCollider(TCollider *col)
                            166 ;	---------------------------------
                            167 ; Function addStaticCollider
                            168 ; ---------------------------------
   039A                     169 _addStaticCollider::
   039A DD E5         [15]  170 	push	ix
   039C DD 21 00 00   [14]  171 	ld	ix,#0
   03A0 DD 39         [15]  172 	add	ix,sp
   03A2 21 FA FF      [10]  173 	ld	hl,#-6
   03A5 39            [11]  174 	add	hl,sp
   03A6 F9            [ 6]  175 	ld	sp,hl
                            176 ;src/utilities/physics.c:57: insertInCollisionArray(col, col->x, col->y);
   03A7 DD 5E 04      [19]  177 	ld	e,4 (ix)
   03AA DD 56 05      [19]  178 	ld	d,5 (ix)
   03AD 21 01 00      [10]  179 	ld	hl,#0x0001
   03B0 19            [11]  180 	add	hl,de
   03B1 E3            [19]  181 	ex	(sp), hl
   03B2 E1            [10]  182 	pop	hl
   03B3 E5            [11]  183 	push	hl
   03B4 46            [ 7]  184 	ld	b,(hl)
   03B5 1A            [ 7]  185 	ld	a,(de)
   03B6 D5            [11]  186 	push	de
   03B7 C5            [11]  187 	push	bc
   03B8 33            [ 6]  188 	inc	sp
   03B9 F5            [11]  189 	push	af
   03BA 33            [ 6]  190 	inc	sp
   03BB D5            [11]  191 	push	de
   03BC CD 05 03      [17]  192 	call	_insertInCollisionArray
   03BF F1            [10]  193 	pop	af
   03C0 F1            [10]  194 	pop	af
   03C1 D1            [10]  195 	pop	de
                            196 ;src/utilities/physics.c:58: insertInCollisionArray(col, col->x+col->w, col->y);
   03C2 E1            [10]  197 	pop	hl
   03C3 E5            [11]  198 	push	hl
   03C4 46            [ 7]  199 	ld	b,(hl)
   03C5 1A            [ 7]  200 	ld	a,(de)
   03C6 4F            [ 4]  201 	ld	c,a
   03C7 21 02 00      [10]  202 	ld	hl,#0x0002
   03CA 19            [11]  203 	add	hl,de
   03CB DD 75 FE      [19]  204 	ld	-2 (ix),l
   03CE DD 74 FF      [19]  205 	ld	-1 (ix),h
   03D1 DD 6E FE      [19]  206 	ld	l,-2 (ix)
   03D4 DD 66 FF      [19]  207 	ld	h,-1 (ix)
   03D7 66            [ 7]  208 	ld	h,(hl)
   03D8 79            [ 4]  209 	ld	a,c
   03D9 84            [ 4]  210 	add	a, h
   03DA D5            [11]  211 	push	de
   03DB C5            [11]  212 	push	bc
   03DC 33            [ 6]  213 	inc	sp
   03DD F5            [11]  214 	push	af
   03DE 33            [ 6]  215 	inc	sp
   03DF D5            [11]  216 	push	de
   03E0 CD 05 03      [17]  217 	call	_insertInCollisionArray
   03E3 F1            [10]  218 	pop	af
   03E4 F1            [10]  219 	pop	af
   03E5 D1            [10]  220 	pop	de
                            221 ;src/utilities/physics.c:59: insertInCollisionArray(col, col->x, col->y+col->h);
   03E6 E1            [10]  222 	pop	hl
   03E7 E5            [11]  223 	push	hl
   03E8 46            [ 7]  224 	ld	b,(hl)
   03E9 21 03 00      [10]  225 	ld	hl,#0x0003
   03EC 19            [11]  226 	add	hl,de
   03ED DD 75 FC      [19]  227 	ld	-4 (ix),l
   03F0 DD 74 FD      [19]  228 	ld	-3 (ix),h
   03F3 DD 6E FC      [19]  229 	ld	l,-4 (ix)
   03F6 DD 66 FD      [19]  230 	ld	h,-3 (ix)
   03F9 6E            [ 7]  231 	ld	l,(hl)
   03FA 78            [ 4]  232 	ld	a,b
   03FB 85            [ 4]  233 	add	a, l
   03FC 47            [ 4]  234 	ld	b,a
   03FD 1A            [ 7]  235 	ld	a,(de)
   03FE D5            [11]  236 	push	de
   03FF C5            [11]  237 	push	bc
   0400 33            [ 6]  238 	inc	sp
   0401 F5            [11]  239 	push	af
   0402 33            [ 6]  240 	inc	sp
   0403 D5            [11]  241 	push	de
   0404 CD 05 03      [17]  242 	call	_insertInCollisionArray
   0407 F1            [10]  243 	pop	af
   0408 F1            [10]  244 	pop	af
   0409 D1            [10]  245 	pop	de
                            246 ;src/utilities/physics.c:60: insertInCollisionArray(col, col->x+col->w, col->y+col->h);	
   040A E1            [10]  247 	pop	hl
   040B E5            [11]  248 	push	hl
   040C 46            [ 7]  249 	ld	b,(hl)
   040D DD 6E FC      [19]  250 	ld	l,-4 (ix)
   0410 DD 66 FD      [19]  251 	ld	h,-3 (ix)
   0413 66            [ 7]  252 	ld	h,(hl)
   0414 78            [ 4]  253 	ld	a,b
   0415 84            [ 4]  254 	add	a, h
   0416 47            [ 4]  255 	ld	b,a
   0417 1A            [ 7]  256 	ld	a,(de)
   0418 4F            [ 4]  257 	ld	c,a
   0419 DD 6E FE      [19]  258 	ld	l,-2 (ix)
   041C DD 66 FF      [19]  259 	ld	h,-1 (ix)
   041F 66            [ 7]  260 	ld	h,(hl)
   0420 79            [ 4]  261 	ld	a,c
   0421 84            [ 4]  262 	add	a, h
   0422 C5            [11]  263 	push	bc
   0423 33            [ 6]  264 	inc	sp
   0424 F5            [11]  265 	push	af
   0425 33            [ 6]  266 	inc	sp
   0426 D5            [11]  267 	push	de
   0427 CD 05 03      [17]  268 	call	_insertInCollisionArray
   042A DD F9         [10]  269 	ld	sp,ix
   042C DD E1         [14]  270 	pop	ix
   042E C9            [10]  271 	ret
                            272 ;src/utilities/physics.c:68: void resetIndex()
                            273 ;	---------------------------------
                            274 ; Function resetIndex
                            275 ; ---------------------------------
   042F                     276 _resetIndex::
                            277 ;src/utilities/physics.c:70: botLeftIndex = 0;
   042F 21 04 08      [10]  278 	ld	hl,#_botLeftIndex + 0
   0432 36 00         [10]  279 	ld	(hl), #0x00
                            280 ;src/utilities/physics.c:71: topLeftIndex = 0;
   0434 21 05 08      [10]  281 	ld	hl,#_topLeftIndex + 0
   0437 36 00         [10]  282 	ld	(hl), #0x00
                            283 ;src/utilities/physics.c:72: botRighttIndex = 0;
   0439 21 06 08      [10]  284 	ld	hl,#_botRighttIndex + 0
   043C 36 00         [10]  285 	ld	(hl), #0x00
                            286 ;src/utilities/physics.c:73: topRightIndex = 0;
   043E 21 07 08      [10]  287 	ld	hl,#_topRightIndex + 0
   0441 36 00         [10]  288 	ld	(hl), #0x00
   0443 C9            [10]  289 	ret
                            290 	.area _CODE
                            291 	.area _INITIALIZER
   0808                     292 __xinit__botLeftIndex:
   0808 00                  293 	.db #0x00	; 0
   0809                     294 __xinit__topLeftIndex:
   0809 00                  295 	.db #0x00	; 0
   080A                     296 __xinit__botRighttIndex:
   080A 00                  297 	.db #0x00	; 0
   080B                     298 __xinit__topRightIndex:
   080B 00                  299 	.db #0x00	; 0
                            300 	.area _CABS (ABS)
