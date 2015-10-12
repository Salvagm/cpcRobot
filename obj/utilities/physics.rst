                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.4 #9329 (Linux)
                              4 ; This file was generated Mon Oct 12 18:21:21 2015
                              5 ;--------------------------------------------------------
                              6 	.module physics
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _resetIndex
                             13 	.globl _insertInCollisionArray
                             14 	.globl _getCollisionedCollider
                             15 	.globl _topRightIndex
                             16 	.globl _botRighttIndex
                             17 	.globl _topLeftIndex
                             18 	.globl _botLeftIndex
                             19 	.globl _TRstaticColliders
                             20 	.globl _TLstaticColliders
                             21 	.globl _BRstaticColliders
                             22 	.globl _BLstaticColliders
                             23 	.globl _addStaticCollider
                             24 	.globl _checkWorldCollision
                             25 ;--------------------------------------------------------
                             26 ; special function registers
                             27 ;--------------------------------------------------------
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _DATA
                             32 ;--------------------------------------------------------
                             33 ; ram data
                             34 ;--------------------------------------------------------
                             35 	.area _INITIALIZED
   08EA                      36 _BLstaticColliders::
   08EA                      37 	.ds 10
   08F4                      38 _BRstaticColliders::
   08F4                      39 	.ds 10
   08FE                      40 _TLstaticColliders::
   08FE                      41 	.ds 10
   0908                      42 _TRstaticColliders::
   0908                      43 	.ds 10
   0912                      44 _botLeftIndex::
   0912                      45 	.ds 1
   0913                      46 _topLeftIndex::
   0913                      47 	.ds 1
   0914                      48 _botRighttIndex::
   0914                      49 	.ds 1
   0915                      50 _topRightIndex::
   0915                      51 	.ds 1
                             52 ;--------------------------------------------------------
                             53 ; absolute external ram data
                             54 ;--------------------------------------------------------
                             55 	.area _DABS (ABS)
                             56 ;--------------------------------------------------------
                             57 ; global & static initialisations
                             58 ;--------------------------------------------------------
                             59 	.area _HOME
                             60 	.area _GSINIT
                             61 	.area _GSFINAL
                             62 	.area _GSINIT
                             63 ;--------------------------------------------------------
                             64 ; Home
                             65 ;--------------------------------------------------------
                             66 	.area _HOME
                             67 	.area _HOME
                             68 ;--------------------------------------------------------
                             69 ; code
                             70 ;--------------------------------------------------------
                             71 	.area _CODE
                             72 ;src/utilities/physics.c:28: TCollider* getCollisionedCollider(TCollider* vCollider[] , TCollider* entCollider, u8 vColliderSize)
                             73 ;	---------------------------------
                             74 ; Function getCollisionedCollider
                             75 ; ---------------------------------
   0305                      76 _getCollisionedCollider::
   0305 DD E5         [15]   77 	push	ix
   0307 DD 21 00 00   [14]   78 	ld	ix,#0
   030B DD 39         [15]   79 	add	ix,sp
   030D 21 F1 FF      [10]   80 	ld	hl,#-15
   0310 39            [11]   81 	add	hl,sp
   0311 F9            [ 6]   82 	ld	sp,hl
                             83 ;src/utilities/physics.c:34: u8 index = vColliderSize;
   0312 DD 7E 08      [19]   84 	ld	a,8 (ix)
   0315 DD 77 FD      [19]   85 	ld	-3 (ix),a
                             86 ;src/utilities/physics.c:36: i8 entTopY = entCollider->y;
   0318 DD 5E 06      [19]   87 	ld	e,6 (ix)
   031B DD 56 07      [19]   88 	ld	d,7 (ix)
   031E 6B            [ 4]   89 	ld	l, e
   031F 62            [ 4]   90 	ld	h, d
   0320 23            [ 6]   91 	inc	hl
   0321 4E            [ 7]   92 	ld	c,(hl)
   0322 DD 71 F7      [19]   93 	ld	-9 (ix),c
                             94 ;src/utilities/physics.c:37: i8 entBotY = entCollider->y + entCollider->h;
   0325 D5            [11]   95 	push	de
   0326 FD E1         [14]   96 	pop	iy
   0328 FD 6E 03      [19]   97 	ld	l,3 (iy)
   032B 09            [11]   98 	add	hl, bc
   032C DD 75 F6      [19]   99 	ld	-10 (ix),l
                            100 ;src/utilities/physics.c:38: i8 entLefX = entCollider->x;
   032F 1A            [ 7]  101 	ld	a,(de)
   0330 4F            [ 4]  102 	ld	c,a
   0331 DD 71 F5      [19]  103 	ld	-11 (ix),c
                            104 ;src/utilities/physics.c:39: i8 entRightX = entCollider->x + entCollider->w;
   0334 EB            [ 4]  105 	ex	de,hl
   0335 23            [ 6]  106 	inc	hl
   0336 23            [ 6]  107 	inc	hl
   0337 6E            [ 7]  108 	ld	l,(hl)
   0338 09            [11]  109 	add	hl, bc
   0339 4D            [ 4]  110 	ld	c,l
                            111 ;src/utilities/physics.c:40: TCollider* collisionedColliders[2] = {0,0};
   033A 21 00 00      [10]  112 	ld	hl,#0x0000
   033D 39            [11]  113 	add	hl,sp
   033E 5D            [ 4]  114 	ld	e,l
   033F 54            [ 4]  115 	ld	d,h
   0340 AF            [ 4]  116 	xor	a, a
   0341 77            [ 7]  117 	ld	(hl), a
   0342 23            [ 6]  118 	inc	hl
   0343 77            [ 7]  119 	ld	(hl), a
   0344 6B            [ 4]  120 	ld	l, e
   0345 62            [ 4]  121 	ld	h, d
   0346 23            [ 6]  122 	inc	hl
   0347 23            [ 6]  123 	inc	hl
   0348 AF            [ 4]  124 	xor	a, a
   0349 77            [ 7]  125 	ld	(hl), a
   034A 23            [ 6]  126 	inc	hl
   034B 77            [ 7]  127 	ld	(hl), a
                            128 ;src/utilities/physics.c:42: while(index)
   034C DD 36 F8 00   [19]  129 	ld	-8 (ix),#0x00
   0350                     130 00106$:
   0350 DD 7E FD      [19]  131 	ld	a,-3 (ix)
   0353 B7            [ 4]  132 	or	a, a
   0354 CA EA 03      [10]  133 	jp	Z,00108$
                            134 ;src/utilities/physics.c:44: blockLeftX = entRightX - vCollider[index]->x ; // X_1 + W_1 - X_2 > 0
   0357 DD 6E FD      [19]  135 	ld	l,-3 (ix)
   035A 26 00         [ 7]  136 	ld	h,#0x00
   035C 29            [11]  137 	add	hl, hl
   035D DD 75 FE      [19]  138 	ld	-2 (ix),l
   0360 DD 74 FF      [19]  139 	ld	-1 (ix),h
   0363 DD 7E FE      [19]  140 	ld	a,-2 (ix)
   0366 DD 86 04      [19]  141 	add	a, 4 (ix)
   0369 6F            [ 4]  142 	ld	l,a
   036A DD 7E FF      [19]  143 	ld	a,-1 (ix)
   036D DD 8E 05      [19]  144 	adc	a, 5 (ix)
   0370 67            [ 4]  145 	ld	h,a
   0371 7E            [ 7]  146 	ld	a,(hl)
   0372 DD 77 FE      [19]  147 	ld	-2 (ix),a
   0375 23            [ 6]  148 	inc	hl
   0376 7E            [ 7]  149 	ld	a,(hl)
   0377 DD 77 FF      [19]  150 	ld	-1 (ix),a
   037A DD 6E FE      [19]  151 	ld	l,-2 (ix)
   037D DD 66 FF      [19]  152 	ld	h,-1 (ix)
   0380 46            [ 7]  153 	ld	b,(hl)
   0381 60            [ 4]  154 	ld	h,b
   0382 79            [ 4]  155 	ld	a,c
   0383 94            [ 4]  156 	sub	a, h
   0384 DD 77 FA      [19]  157 	ld	-6 (ix),a
                            158 ;src/utilities/physics.c:45: blockRightX = vCollider[index]->x - vCollider[index]->w - entLefX; // X_2 + W_2 - X_1 > 0
   0387 DD 6E FE      [19]  159 	ld	l,-2 (ix)
   038A DD 66 FF      [19]  160 	ld	h,-1 (ix)
   038D 23            [ 6]  161 	inc	hl
   038E 23            [ 6]  162 	inc	hl
   038F 66            [ 7]  163 	ld	h,(hl)
   0390 78            [ 4]  164 	ld	a,b
   0391 94            [ 4]  165 	sub	a, h
   0392 DD 96 F5      [19]  166 	sub	a, -11 (ix)
   0395 DD 77 F9      [19]  167 	ld	-7 (ix),a
                            168 ;src/utilities/physics.c:46: blockBotY = vCollider[index]->y + vCollider[index]->h - entTopY; // Y_2 + H_2 - Y_1 > 0
   0398 DD 6E FE      [19]  169 	ld	l,-2 (ix)
   039B DD 66 FF      [19]  170 	ld	h,-1 (ix)
   039E 23            [ 6]  171 	inc	hl
   039F 46            [ 7]  172 	ld	b,(hl)
   03A0 DD 6E FE      [19]  173 	ld	l,-2 (ix)
   03A3 DD 66 FF      [19]  174 	ld	h,-1 (ix)
   03A6 23            [ 6]  175 	inc	hl
   03A7 23            [ 6]  176 	inc	hl
   03A8 23            [ 6]  177 	inc	hl
   03A9 66            [ 7]  178 	ld	h,(hl)
   03AA 78            [ 4]  179 	ld	a,b
   03AB 84            [ 4]  180 	add	a, h
   03AC DD 96 F7      [19]  181 	sub	a, -9 (ix)
   03AF DD 77 FB      [19]  182 	ld	-5 (ix),a
                            183 ;src/utilities/physics.c:47: blockTopY = entBotY - vCollider[index]->y ; // Y_1 + H_1 - Y_2 > 0
   03B2 DD 7E F6      [19]  184 	ld	a,-10 (ix)
   03B5 90            [ 4]  185 	sub	a, b
   03B6 DD 77 FC      [19]  186 	ld	-4 (ix),a
                            187 ;src/utilities/physics.c:49: if(blockLeftX && blockRightX && blockBotY && blockTopY)
   03B9 DD 7E FA      [19]  188 	ld	a,-6 (ix)
   03BC B7            [ 4]  189 	or	a, a
   03BD 28 25         [12]  190 	jr	Z,00102$
   03BF DD 7E F9      [19]  191 	ld	a,-7 (ix)
   03C2 B7            [ 4]  192 	or	a, a
   03C3 28 1F         [12]  193 	jr	Z,00102$
   03C5 DD 7E FB      [19]  194 	ld	a,-5 (ix)
   03C8 B7            [ 4]  195 	or	a, a
   03C9 28 19         [12]  196 	jr	Z,00102$
   03CB DD 7E FC      [19]  197 	ld	a,-4 (ix)
   03CE B7            [ 4]  198 	or	a, a
   03CF 28 13         [12]  199 	jr	Z,00102$
                            200 ;src/utilities/physics.c:51: collisionedColliders[collisions] = vCollider[index];
   03D1 DD 6E F8      [19]  201 	ld	l,-8 (ix)
   03D4 26 00         [ 7]  202 	ld	h,#0x00
   03D6 29            [11]  203 	add	hl, hl
   03D7 19            [11]  204 	add	hl,de
   03D8 DD 7E FE      [19]  205 	ld	a,-2 (ix)
   03DB 77            [ 7]  206 	ld	(hl),a
   03DC 23            [ 6]  207 	inc	hl
   03DD DD 7E FF      [19]  208 	ld	a,-1 (ix)
   03E0 77            [ 7]  209 	ld	(hl),a
                            210 ;src/utilities/physics.c:52: ++collisions;
   03E1 DD 34 F8      [23]  211 	inc	-8 (ix)
   03E4                     212 00102$:
                            213 ;src/utilities/physics.c:55: --index;
   03E4 DD 35 FD      [23]  214 	dec	-3 (ix)
   03E7 C3 50 03      [10]  215 	jp	00106$
   03EA                     216 00108$:
                            217 ;src/utilities/physics.c:57: return collisionedColliders;
   03EA EB            [ 4]  218 	ex	de,hl
   03EB DD F9         [10]  219 	ld	sp, ix
   03ED DD E1         [14]  220 	pop	ix
   03EF C9            [10]  221 	ret
                            222 ;src/utilities/physics.c:61: void insertInCollisionArray(TCollider *col, u8 pointX, u8 pointY)
                            223 ;	---------------------------------
                            224 ; Function insertInCollisionArray
                            225 ; ---------------------------------
   03F0                     226 _insertInCollisionArray::
   03F0 DD E5         [15]  227 	push	ix
   03F2 DD 21 00 00   [14]  228 	ld	ix,#0
   03F6 DD 39         [15]  229 	add	ix,sp
                            230 ;src/utilities/physics.c:65: if(pointX < MID_VSCREEN)
   03F8 DD 7E 06      [19]  231 	ld	a,6 (ix)
   03FB D6 28         [ 7]  232 	sub	a, #0x28
   03FD 3E 00         [ 7]  233 	ld	a,#0x00
   03FF 17            [ 4]  234 	rla
   0400 4F            [ 4]  235 	ld	c,a
                            236 ;src/utilities/physics.c:63: if(pointY < MID_HSCREEN)
   0401 DD 7E 07      [19]  237 	ld	a,7 (ix)
   0404 D6 64         [ 7]  238 	sub	a, #0x64
   0406 30 3E         [12]  239 	jr	NC,00108$
                            240 ;src/utilities/physics.c:65: if(pointX < MID_VSCREEN)
   0408 79            [ 4]  241 	ld	a,c
   0409 B7            [ 4]  242 	or	a, a
   040A 28 1D         [12]  243 	jr	Z,00102$
                            244 ;src/utilities/physics.c:67: BLstaticColliders[botLeftIndex] = col;	
   040C FD 21 12 09   [14]  245 	ld	iy,#_botLeftIndex
   0410 FD 6E 00      [19]  246 	ld	l,0 (iy)
   0413 26 00         [ 7]  247 	ld	h,#0x00
   0415 29            [11]  248 	add	hl, hl
   0416 11 EA 08      [10]  249 	ld	de,#_BLstaticColliders
   0419 19            [11]  250 	add	hl,de
   041A DD 7E 04      [19]  251 	ld	a,4 (ix)
   041D 77            [ 7]  252 	ld	(hl),a
   041E 23            [ 6]  253 	inc	hl
   041F DD 7E 05      [19]  254 	ld	a,5 (ix)
   0422 77            [ 7]  255 	ld	(hl),a
                            256 ;src/utilities/physics.c:68: ++botLeftIndex;
   0423 21 12 09      [10]  257 	ld	hl, #_botLeftIndex+0
   0426 34            [11]  258 	inc	(hl)
   0427 18 59         [12]  259 	jr	00110$
   0429                     260 00102$:
                            261 ;src/utilities/physics.c:72: BRstaticColliders[botRighttIndex] = col;
   0429 FD 21 14 09   [14]  262 	ld	iy,#_botRighttIndex
   042D FD 6E 00      [19]  263 	ld	l,0 (iy)
   0430 26 00         [ 7]  264 	ld	h,#0x00
   0432 29            [11]  265 	add	hl, hl
   0433 11 F4 08      [10]  266 	ld	de,#_BRstaticColliders
   0436 19            [11]  267 	add	hl,de
   0437 DD 7E 04      [19]  268 	ld	a,4 (ix)
   043A 77            [ 7]  269 	ld	(hl),a
   043B 23            [ 6]  270 	inc	hl
   043C DD 7E 05      [19]  271 	ld	a,5 (ix)
   043F 77            [ 7]  272 	ld	(hl),a
                            273 ;src/utilities/physics.c:73: ++botRighttIndex;
   0440 21 14 09      [10]  274 	ld	hl, #_botRighttIndex+0
   0443 34            [11]  275 	inc	(hl)
   0444 18 3C         [12]  276 	jr	00110$
   0446                     277 00108$:
                            278 ;src/utilities/physics.c:78: if(pointX < MID_VSCREEN)
   0446 79            [ 4]  279 	ld	a,c
   0447 B7            [ 4]  280 	or	a, a
   0448 28 1D         [12]  281 	jr	Z,00105$
                            282 ;src/utilities/physics.c:80: TLstaticColliders[topLeftIndex] = col;	
   044A FD 21 13 09   [14]  283 	ld	iy,#_topLeftIndex
   044E FD 6E 00      [19]  284 	ld	l,0 (iy)
   0451 26 00         [ 7]  285 	ld	h,#0x00
   0453 29            [11]  286 	add	hl, hl
   0454 11 FE 08      [10]  287 	ld	de,#_TLstaticColliders
   0457 19            [11]  288 	add	hl,de
   0458 DD 7E 04      [19]  289 	ld	a,4 (ix)
   045B 77            [ 7]  290 	ld	(hl),a
   045C 23            [ 6]  291 	inc	hl
   045D DD 7E 05      [19]  292 	ld	a,5 (ix)
   0460 77            [ 7]  293 	ld	(hl),a
                            294 ;src/utilities/physics.c:81: ++topLeftIndex;
   0461 21 13 09      [10]  295 	ld	hl, #_topLeftIndex+0
   0464 34            [11]  296 	inc	(hl)
   0465 18 1B         [12]  297 	jr	00110$
   0467                     298 00105$:
                            299 ;src/utilities/physics.c:85: TRstaticColliders[topRightIndex] = col;	
   0467 FD 21 15 09   [14]  300 	ld	iy,#_topRightIndex
   046B FD 6E 00      [19]  301 	ld	l,0 (iy)
   046E 26 00         [ 7]  302 	ld	h,#0x00
   0470 29            [11]  303 	add	hl, hl
   0471 11 08 09      [10]  304 	ld	de,#_TRstaticColliders
   0474 19            [11]  305 	add	hl,de
   0475 DD 7E 04      [19]  306 	ld	a,4 (ix)
   0478 77            [ 7]  307 	ld	(hl),a
   0479 23            [ 6]  308 	inc	hl
   047A DD 7E 05      [19]  309 	ld	a,5 (ix)
   047D 77            [ 7]  310 	ld	(hl),a
                            311 ;src/utilities/physics.c:86: ++topRightIndex;
   047E 21 15 09      [10]  312 	ld	hl, #_topRightIndex+0
   0481 34            [11]  313 	inc	(hl)
   0482                     314 00110$:
   0482 DD E1         [14]  315 	pop	ix
   0484 C9            [10]  316 	ret
                            317 ;src/utilities/physics.c:95: void addStaticCollider(TCollider* col)
                            318 ;	---------------------------------
                            319 ; Function addStaticCollider
                            320 ; ---------------------------------
   0485                     321 _addStaticCollider::
   0485 DD E5         [15]  322 	push	ix
   0487 DD 21 00 00   [14]  323 	ld	ix,#0
   048B DD 39         [15]  324 	add	ix,sp
   048D 21 FA FF      [10]  325 	ld	hl,#-6
   0490 39            [11]  326 	add	hl,sp
   0491 F9            [ 6]  327 	ld	sp,hl
                            328 ;src/utilities/physics.c:97: insertInCollisionArray(col, col->x, col->y);
   0492 DD 5E 04      [19]  329 	ld	e,4 (ix)
   0495 DD 56 05      [19]  330 	ld	d,5 (ix)
   0498 21 01 00      [10]  331 	ld	hl,#0x0001
   049B 19            [11]  332 	add	hl,de
   049C DD 75 FC      [19]  333 	ld	-4 (ix),l
   049F DD 74 FD      [19]  334 	ld	-3 (ix),h
   04A2 DD 6E FC      [19]  335 	ld	l,-4 (ix)
   04A5 DD 66 FD      [19]  336 	ld	h,-3 (ix)
   04A8 46            [ 7]  337 	ld	b,(hl)
   04A9 1A            [ 7]  338 	ld	a,(de)
   04AA D5            [11]  339 	push	de
   04AB C5            [11]  340 	push	bc
   04AC 33            [ 6]  341 	inc	sp
   04AD F5            [11]  342 	push	af
   04AE 33            [ 6]  343 	inc	sp
   04AF D5            [11]  344 	push	de
   04B0 CD F0 03      [17]  345 	call	_insertInCollisionArray
   04B3 F1            [10]  346 	pop	af
   04B4 F1            [10]  347 	pop	af
   04B5 D1            [10]  348 	pop	de
                            349 ;src/utilities/physics.c:98: insertInCollisionArray(col, col->x+col->w, col->y);
   04B6 DD 6E FC      [19]  350 	ld	l,-4 (ix)
   04B9 DD 66 FD      [19]  351 	ld	h,-3 (ix)
   04BC 46            [ 7]  352 	ld	b,(hl)
   04BD 1A            [ 7]  353 	ld	a,(de)
   04BE 4F            [ 4]  354 	ld	c,a
   04BF 21 02 00      [10]  355 	ld	hl,#0x0002
   04C2 19            [11]  356 	add	hl,de
   04C3 DD 75 FE      [19]  357 	ld	-2 (ix),l
   04C6 DD 74 FF      [19]  358 	ld	-1 (ix),h
   04C9 DD 6E FE      [19]  359 	ld	l,-2 (ix)
   04CC DD 66 FF      [19]  360 	ld	h,-1 (ix)
   04CF 66            [ 7]  361 	ld	h,(hl)
   04D0 79            [ 4]  362 	ld	a,c
   04D1 84            [ 4]  363 	add	a, h
   04D2 D5            [11]  364 	push	de
   04D3 C5            [11]  365 	push	bc
   04D4 33            [ 6]  366 	inc	sp
   04D5 F5            [11]  367 	push	af
   04D6 33            [ 6]  368 	inc	sp
   04D7 D5            [11]  369 	push	de
   04D8 CD F0 03      [17]  370 	call	_insertInCollisionArray
   04DB F1            [10]  371 	pop	af
   04DC F1            [10]  372 	pop	af
   04DD D1            [10]  373 	pop	de
                            374 ;src/utilities/physics.c:99: insertInCollisionArray(col, col->x, col->y+col->h);
   04DE DD 6E FC      [19]  375 	ld	l,-4 (ix)
   04E1 DD 66 FD      [19]  376 	ld	h,-3 (ix)
   04E4 46            [ 7]  377 	ld	b,(hl)
   04E5 21 03 00      [10]  378 	ld	hl,#0x0003
   04E8 19            [11]  379 	add	hl,de
   04E9 E3            [19]  380 	ex	(sp), hl
   04EA E1            [10]  381 	pop	hl
   04EB E5            [11]  382 	push	hl
   04EC 6E            [ 7]  383 	ld	l,(hl)
   04ED 78            [ 4]  384 	ld	a,b
   04EE 85            [ 4]  385 	add	a, l
   04EF 47            [ 4]  386 	ld	b,a
   04F0 1A            [ 7]  387 	ld	a,(de)
   04F1 D5            [11]  388 	push	de
   04F2 C5            [11]  389 	push	bc
   04F3 33            [ 6]  390 	inc	sp
   04F4 F5            [11]  391 	push	af
   04F5 33            [ 6]  392 	inc	sp
   04F6 D5            [11]  393 	push	de
   04F7 CD F0 03      [17]  394 	call	_insertInCollisionArray
   04FA F1            [10]  395 	pop	af
   04FB F1            [10]  396 	pop	af
   04FC D1            [10]  397 	pop	de
                            398 ;src/utilities/physics.c:100: insertInCollisionArray(col, col->x+col->w, col->y+col->h);	
   04FD DD 6E FC      [19]  399 	ld	l,-4 (ix)
   0500 DD 66 FD      [19]  400 	ld	h,-3 (ix)
   0503 46            [ 7]  401 	ld	b,(hl)
   0504 E1            [10]  402 	pop	hl
   0505 E5            [11]  403 	push	hl
   0506 66            [ 7]  404 	ld	h,(hl)
   0507 78            [ 4]  405 	ld	a,b
   0508 84            [ 4]  406 	add	a, h
   0509 47            [ 4]  407 	ld	b,a
   050A 1A            [ 7]  408 	ld	a,(de)
   050B 4F            [ 4]  409 	ld	c,a
   050C DD 6E FE      [19]  410 	ld	l,-2 (ix)
   050F DD 66 FF      [19]  411 	ld	h,-1 (ix)
   0512 66            [ 7]  412 	ld	h,(hl)
   0513 79            [ 4]  413 	ld	a,c
   0514 84            [ 4]  414 	add	a, h
   0515 C5            [11]  415 	push	bc
   0516 33            [ 6]  416 	inc	sp
   0517 F5            [11]  417 	push	af
   0518 33            [ 6]  418 	inc	sp
   0519 D5            [11]  419 	push	de
   051A CD F0 03      [17]  420 	call	_insertInCollisionArray
   051D DD F9         [10]  421 	ld	sp,ix
   051F DD E1         [14]  422 	pop	ix
   0521 C9            [10]  423 	ret
                            424 ;src/utilities/physics.c:103: TCollider* checkWorldCollision(TCollider* entCollider)
                            425 ;	---------------------------------
                            426 ; Function checkWorldCollision
                            427 ; ---------------------------------
   0522                     428 _checkWorldCollision::
                            429 ;src/utilities/physics.c:107: getCollisionedCollider(TLstaticColliders,entCollider,topLeftIndex);
   0522 11 FE 08      [10]  430 	ld	de,#_TLstaticColliders
   0525 3A 13 09      [13]  431 	ld	a,(_topLeftIndex)
   0528 F5            [11]  432 	push	af
   0529 33            [ 6]  433 	inc	sp
   052A 21 03 00      [10]  434 	ld	hl, #3
   052D 39            [11]  435 	add	hl, sp
   052E 4E            [ 7]  436 	ld	c, (hl)
   052F 23            [ 6]  437 	inc	hl
   0530 46            [ 7]  438 	ld	b, (hl)
   0531 C5            [11]  439 	push	bc
   0532 D5            [11]  440 	push	de
   0533 CD 05 03      [17]  441 	call	_getCollisionedCollider
   0536 F1            [10]  442 	pop	af
   0537 F1            [10]  443 	pop	af
   0538 33            [ 6]  444 	inc	sp
                            445 ;src/utilities/physics.c:110: return collision;
   0539 21 00 00      [10]  446 	ld	hl,#0x0000
   053C C9            [10]  447 	ret
                            448 ;src/utilities/physics.c:113: void resetIndex()
                            449 ;	---------------------------------
                            450 ; Function resetIndex
                            451 ; ---------------------------------
   053D                     452 _resetIndex::
                            453 ;src/utilities/physics.c:115: botLeftIndex = 0;
   053D 21 12 09      [10]  454 	ld	hl,#_botLeftIndex + 0
   0540 36 00         [10]  455 	ld	(hl), #0x00
                            456 ;src/utilities/physics.c:116: topLeftIndex = 0;
   0542 21 13 09      [10]  457 	ld	hl,#_topLeftIndex + 0
   0545 36 00         [10]  458 	ld	(hl), #0x00
                            459 ;src/utilities/physics.c:117: botRighttIndex = 0;
   0547 21 14 09      [10]  460 	ld	hl,#_botRighttIndex + 0
   054A 36 00         [10]  461 	ld	(hl), #0x00
                            462 ;src/utilities/physics.c:118: topRightIndex = 0;
   054C 21 15 09      [10]  463 	ld	hl,#_topRightIndex + 0
   054F 36 00         [10]  464 	ld	(hl), #0x00
   0551 C9            [10]  465 	ret
                            466 	.area _CODE
                            467 	.area _INITIALIZER
   0916                     468 __xinit__BLstaticColliders:
   0916 00 00               469 	.dw #0x0000
   0918 00 00               470 	.dw #0x0000
   091A 00 00               471 	.dw #0x0000
   091C 00 00               472 	.dw #0x0000
   091E 00 00               473 	.dw #0x0000
   0920                     474 __xinit__BRstaticColliders:
   0920 00 00               475 	.dw #0x0000
   0922 00 00               476 	.dw #0x0000
   0924 00 00               477 	.dw #0x0000
   0926 00 00               478 	.dw #0x0000
   0928 00 00               479 	.dw #0x0000
   092A                     480 __xinit__TLstaticColliders:
   092A 00 00               481 	.dw #0x0000
   092C 00 00               482 	.dw #0x0000
   092E 00 00               483 	.dw #0x0000
   0930 00 00               484 	.dw #0x0000
   0932 00 00               485 	.dw #0x0000
   0934                     486 __xinit__TRstaticColliders:
   0934 00 00               487 	.dw #0x0000
   0936 00 00               488 	.dw #0x0000
   0938 00 00               489 	.dw #0x0000
   093A 00 00               490 	.dw #0x0000
   093C 00 00               491 	.dw #0x0000
   093E                     492 __xinit__botLeftIndex:
   093E 00                  493 	.db #0x00	; 0
   093F                     494 __xinit__topLeftIndex:
   093F 00                  495 	.db #0x00	; 0
   0940                     496 __xinit__botRighttIndex:
   0940 00                  497 	.db #0x00	; 0
   0941                     498 __xinit__topRightIndex:
   0941 00                  499 	.db #0x00	; 0
                            500 	.area _CABS (ABS)
