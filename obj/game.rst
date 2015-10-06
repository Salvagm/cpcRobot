                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.4 #9329 (Linux)
                              4 ; This file was generated Tue Oct  6 16:57:36 2015
                              5 ;--------------------------------------------------------
                              6 	.module game
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _drawAll
                             13 	.globl _getPlayer
                             14 	.globl _cpct_getScreenPtr
                             15 	.globl _cpct_waitVSYNC
                             16 	.globl _cpct_drawSolidBox
                             17 	.globl _cpct_drawSpriteMasked
                             18 	.globl _cpct_px2byteM1
                             19 	.globl _cpct_isKeyPressed
                             20 	.globl _cpct_scanKeyboard_f
                             21 	.globl _pvideomem
                             22 	.globl _player
                             23 	.globl _initializeGameScreen
                             24 	.globl _updateUser
                             25 	.globl _game
                             26 ;--------------------------------------------------------
                             27 ; special function registers
                             28 ;--------------------------------------------------------
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DATA
   063E                      33 _player::
   063E                      34 	.ds 2
   0640                      35 _pvideomem::
   0640                      36 	.ds 2
                             37 ;--------------------------------------------------------
                             38 ; ram data
                             39 ;--------------------------------------------------------
                             40 	.area _INITIALIZED
                             41 ;--------------------------------------------------------
                             42 ; absolute external ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DABS (ABS)
                             45 ;--------------------------------------------------------
                             46 ; global & static initialisations
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _GSINIT
                             50 	.area _GSFINAL
                             51 	.area _GSINIT
                             52 ;--------------------------------------------------------
                             53 ; Home
                             54 ;--------------------------------------------------------
                             55 	.area _HOME
                             56 	.area _HOME
                             57 ;--------------------------------------------------------
                             58 ; code
                             59 ;--------------------------------------------------------
                             60 	.area _CODE
                             61 ;src/game.c:22: void initializeGameScreen() {
                             62 ;	---------------------------------
                             63 ; Function initializeGameScreen
                             64 ; ---------------------------------
   0100                      65 _initializeGameScreen::
                             66 ;src/game.c:24: cpct_drawSolidBox(INIT_VMEM, cpct_px2byteM1(1, 1, 1, 1), 64, 200);
   0100 21 01 01      [10]   67 	ld	hl,#0x0101
   0103 E5            [11]   68 	push	hl
   0104 2E 01         [ 7]   69 	ld	l, #0x01
   0106 E5            [11]   70 	push	hl
   0107 CD AE 04      [17]   71 	call	_cpct_px2byteM1
   010A F1            [10]   72 	pop	af
   010B F1            [10]   73 	pop	af
   010C 55            [ 4]   74 	ld	d,l
   010D 21 40 C8      [10]   75 	ld	hl,#0xC840
   0110 E5            [11]   76 	push	hl
   0111 D5            [11]   77 	push	de
   0112 33            [ 6]   78 	inc	sp
   0113 21 00 C0      [10]   79 	ld	hl,#0xC000
   0116 E5            [11]   80 	push	hl
   0117 CD DB 04      [17]   81 	call	_cpct_drawSolidBox
   011A F1            [10]   82 	pop	af
   011B F1            [10]   83 	pop	af
   011C 33            [ 6]   84 	inc	sp
                             85 ;src/game.c:25: cpct_drawSolidBox(INIT_VMEM + 64, cpct_px2byteM1(1, 1, 1, 1), 16, 200);
   011D 21 01 01      [10]   86 	ld	hl,#0x0101
   0120 E5            [11]   87 	push	hl
   0121 2E 01         [ 7]   88 	ld	l, #0x01
   0123 E5            [11]   89 	push	hl
   0124 CD AE 04      [17]   90 	call	_cpct_px2byteM1
   0127 F1            [10]   91 	pop	af
   0128 F1            [10]   92 	pop	af
   0129 55            [ 4]   93 	ld	d,l
   012A 21 10 C8      [10]   94 	ld	hl,#0xC810
   012D E5            [11]   95 	push	hl
   012E D5            [11]   96 	push	de
   012F 33            [ 6]   97 	inc	sp
   0130 21 40 C0      [10]   98 	ld	hl,#0xC040
   0133 E5            [11]   99 	push	hl
   0134 CD DB 04      [17]  100 	call	_cpct_drawSolidBox
   0137 F1            [10]  101 	pop	af
   0138 F1            [10]  102 	pop	af
   0139 33            [ 6]  103 	inc	sp
   013A C9            [10]  104 	ret
                            105 ;src/game.c:28: void updateUser() {
                            106 ;	---------------------------------
                            107 ; Function updateUser
                            108 ; ---------------------------------
   013B                     109 _updateUser::
   013B DD E5         [15]  110 	push	ix
   013D DD 21 00 00   [14]  111 	ld	ix,#0
   0141 DD 39         [15]  112 	add	ix,sp
   0143 F5            [11]  113 	push	af
   0144 F5            [11]  114 	push	af
                            115 ;src/game.c:31: x = &(player->pe.de.e.c.x);
   0145 ED 5B 3E 06   [20]  116 	ld	de,(_player)
   0149 21 04 00      [10]  117 	ld	hl,#0x0004
   014C 19            [11]  118 	add	hl,de
   014D DD 75 FE      [19]  119 	ld	-2 (ix),l
   0150 DD 74 FF      [19]  120 	ld	-1 (ix),h
                            121 ;src/game.c:32: y = &(player->pe.de.e.c.y);
   0153 21 05 00      [10]  122 	ld	hl,#0x0005
   0156 19            [11]  123 	add	hl,de
   0157 E3            [19]  124 	ex	(sp), hl
                            125 ;src/game.c:33: player->pe.de.e.pscreen = player->pe.de.npscreen;
   0158 6B            [ 4]  126 	ld	l, e
   0159 62            [ 4]  127 	ld	h, d
   015A 01 08 00      [10]  128 	ld	bc, #0x0008
   015D 09            [11]  129 	add	hl, bc
   015E 46            [ 7]  130 	ld	b,(hl)
   015F 23            [ 6]  131 	inc	hl
   0160 4E            [ 7]  132 	ld	c,(hl)
   0161 78            [ 4]  133 	ld	a,b
   0162 12            [ 7]  134 	ld	(de),a
   0163 13            [ 6]  135 	inc	de
   0164 79            [ 4]  136 	ld	a,c
   0165 12            [ 7]  137 	ld	(de),a
                            138 ;src/game.c:35: cpct_scanKeyboard_f();
   0166 CD B7 03      [17]  139 	call	_cpct_scanKeyboard_f
                            140 ;src/game.c:36: if      (cpct_isKeyPressed(Key_CursorRight) && (*x) <  80 - SPR_W) { 
   0169 21 00 02      [10]  141 	ld	hl,#0x0200
   016C CD AB 03      [17]  142 	call	_cpct_isKeyPressed
   016F 7D            [ 4]  143 	ld	a,l
   0170 B7            [ 4]  144 	or	a, a
   0171 28 37         [12]  145 	jr	Z,00105$
   0173 DD 6E FE      [19]  146 	ld	l,-2 (ix)
   0176 DD 66 FF      [19]  147 	ld	h,-1 (ix)
   0179 4E            [ 7]  148 	ld	c,(hl)
   017A 79            [ 4]  149 	ld	a,c
   017B D6 4C         [ 7]  150 	sub	a, #0x4C
   017D 30 2B         [12]  151 	jr	NC,00105$
                            152 ;src/game.c:37: player->pe.de.npscreen = cpct_getScreenPtr(INIT_VMEM,++(*x),*y);
   017F ED 5B 3E 06   [20]  153 	ld	de,(_player)
   0183 21 08 00      [10]  154 	ld	hl,#0x0008
   0186 19            [11]  155 	add	hl,de
   0187 EB            [ 4]  156 	ex	de,hl
   0188 E1            [10]  157 	pop	hl
   0189 E5            [11]  158 	push	hl
   018A 46            [ 7]  159 	ld	b,(hl)
   018B 79            [ 4]  160 	ld	a,c
   018C 3C            [ 4]  161 	inc	a
   018D DD 6E FE      [19]  162 	ld	l,-2 (ix)
   0190 DD 66 FF      [19]  163 	ld	h,-1 (ix)
   0193 77            [ 7]  164 	ld	(hl),a
   0194 D5            [11]  165 	push	de
   0195 C5            [11]  166 	push	bc
   0196 33            [ 6]  167 	inc	sp
   0197 F5            [11]  168 	push	af
   0198 33            [ 6]  169 	inc	sp
   0199 21 00 C0      [10]  170 	ld	hl,#0xC000
   019C E5            [11]  171 	push	hl
   019D CD 93 05      [17]  172 	call	_cpct_getScreenPtr
   01A0 45            [ 4]  173 	ld	b,l
   01A1 4C            [ 4]  174 	ld	c,h
   01A2 D1            [10]  175 	pop	de
   01A3 78            [ 4]  176 	ld	a,b
   01A4 12            [ 7]  177 	ld	(de),a
   01A5 13            [ 6]  178 	inc	de
   01A6 79            [ 4]  179 	ld	a,c
   01A7 12            [ 7]  180 	ld	(de),a
   01A8 18 3E         [12]  181 	jr	00106$
   01AA                     182 00105$:
                            183 ;src/game.c:39: else if (cpct_isKeyPressed(Key_CursorLeft)  && (*x) >   0        ) {
   01AA 21 01 01      [10]  184 	ld	hl,#0x0101
   01AD CD AB 03      [17]  185 	call	_cpct_isKeyPressed
   01B0 7D            [ 4]  186 	ld	a,l
   01B1 B7            [ 4]  187 	or	a, a
   01B2 28 34         [12]  188 	jr	Z,00106$
   01B4 DD 6E FE      [19]  189 	ld	l,-2 (ix)
   01B7 DD 66 FF      [19]  190 	ld	h,-1 (ix)
   01BA 46            [ 7]  191 	ld	b,(hl)
   01BB 78            [ 4]  192 	ld	a,b
   01BC B7            [ 4]  193 	or	a, a
   01BD 28 29         [12]  194 	jr	Z,00106$
                            195 ;src/game.c:40: player->pe.de.npscreen = cpct_getScreenPtr(INIT_VMEM,--(*x),*y);
   01BF ED 5B 3E 06   [20]  196 	ld	de,(_player)
   01C3 21 08 00      [10]  197 	ld	hl,#0x0008
   01C6 19            [11]  198 	add	hl,de
   01C7 EB            [ 4]  199 	ex	de,hl
   01C8 E1            [10]  200 	pop	hl
   01C9 E5            [11]  201 	push	hl
   01CA 4E            [ 7]  202 	ld	c,(hl)
   01CB 05            [ 4]  203 	dec	b
   01CC DD 6E FE      [19]  204 	ld	l,-2 (ix)
   01CF DD 66 FF      [19]  205 	ld	h,-1 (ix)
   01D2 70            [ 7]  206 	ld	(hl),b
   01D3 D5            [11]  207 	push	de
   01D4 79            [ 4]  208 	ld	a,c
   01D5 F5            [11]  209 	push	af
   01D6 33            [ 6]  210 	inc	sp
   01D7 C5            [11]  211 	push	bc
   01D8 33            [ 6]  212 	inc	sp
   01D9 21 00 C0      [10]  213 	ld	hl,#0xC000
   01DC E5            [11]  214 	push	hl
   01DD CD 93 05      [17]  215 	call	_cpct_getScreenPtr
   01E0 45            [ 4]  216 	ld	b,l
   01E1 4C            [ 4]  217 	ld	c,h
   01E2 D1            [10]  218 	pop	de
   01E3 78            [ 4]  219 	ld	a,b
   01E4 12            [ 7]  220 	ld	(de),a
   01E5 13            [ 6]  221 	inc	de
   01E6 79            [ 4]  222 	ld	a,c
   01E7 12            [ 7]  223 	ld	(de),a
   01E8                     224 00106$:
                            225 ;src/game.c:42: if      (cpct_isKeyPressed(Key_CursorUp)    && *y >   0        ) { 
   01E8 21 00 01      [10]  226 	ld	hl,#0x0100
   01EB CD AB 03      [17]  227 	call	_cpct_isKeyPressed
   01EE 7D            [ 4]  228 	ld	a,l
   01EF B7            [ 4]  229 	or	a, a
   01F0 28 32         [12]  230 	jr	Z,00112$
   01F2 E1            [10]  231 	pop	hl
   01F3 E5            [11]  232 	push	hl
   01F4 7E            [ 7]  233 	ld	a,(hl)
   01F5 B7            [ 4]  234 	or	a, a
   01F6 28 2C         [12]  235 	jr	Z,00112$
                            236 ;src/game.c:43: *y = (*y)-3;
   01F8 C6 FD         [ 7]  237 	add	a,#0xFD
   01FA 47            [ 4]  238 	ld	b,a
   01FB E1            [10]  239 	pop	hl
   01FC E5            [11]  240 	push	hl
   01FD 70            [ 7]  241 	ld	(hl),b
                            242 ;src/game.c:44: player->pe.de.npscreen = cpct_getScreenPtr(INIT_VMEM, *x, *y); 
   01FE ED 5B 3E 06   [20]  243 	ld	de,(_player)
   0202 21 08 00      [10]  244 	ld	hl,#0x0008
   0205 19            [11]  245 	add	hl,de
   0206 EB            [ 4]  246 	ex	de,hl
   0207 DD 6E FE      [19]  247 	ld	l,-2 (ix)
   020A DD 66 FF      [19]  248 	ld	h,-1 (ix)
   020D 7E            [ 7]  249 	ld	a,(hl)
   020E D5            [11]  250 	push	de
   020F C5            [11]  251 	push	bc
   0210 33            [ 6]  252 	inc	sp
   0211 F5            [11]  253 	push	af
   0212 33            [ 6]  254 	inc	sp
   0213 21 00 C0      [10]  255 	ld	hl,#0xC000
   0216 E5            [11]  256 	push	hl
   0217 CD 93 05      [17]  257 	call	_cpct_getScreenPtr
   021A 45            [ 4]  258 	ld	b,l
   021B 4C            [ 4]  259 	ld	c,h
   021C D1            [10]  260 	pop	de
   021D 78            [ 4]  261 	ld	a,b
   021E 12            [ 7]  262 	ld	(de),a
   021F 13            [ 6]  263 	inc	de
   0220 79            [ 4]  264 	ld	a,c
   0221 12            [ 7]  265 	ld	(de),a
   0222 18 3C         [12]  266 	jr	00115$
   0224                     267 00112$:
                            268 ;src/game.c:46: else if (cpct_isKeyPressed(Key_CursorDown)  && *y < 197 - SPR_H) { 
   0224 21 00 04      [10]  269 	ld	hl,#0x0400
   0227 CD AB 03      [17]  270 	call	_cpct_isKeyPressed
   022A 7D            [ 4]  271 	ld	a,l
   022B B7            [ 4]  272 	or	a, a
   022C 28 32         [12]  273 	jr	Z,00115$
   022E E1            [10]  274 	pop	hl
   022F E5            [11]  275 	push	hl
   0230 46            [ 7]  276 	ld	b,(hl)
   0231 78            [ 4]  277 	ld	a,b
   0232 D6 B5         [ 7]  278 	sub	a, #0xB5
   0234 30 2A         [12]  279 	jr	NC,00115$
                            280 ;src/game.c:47: *y = (*y)+3;
   0236 04            [ 4]  281 	inc	b
   0237 04            [ 4]  282 	inc	b
   0238 04            [ 4]  283 	inc	b
   0239 E1            [10]  284 	pop	hl
   023A E5            [11]  285 	push	hl
   023B 70            [ 7]  286 	ld	(hl),b
                            287 ;src/game.c:48: player->pe.de.npscreen = cpct_getScreenPtr(INIT_VMEM, *x, *y); 
   023C ED 5B 3E 06   [20]  288 	ld	de,(_player)
   0240 21 08 00      [10]  289 	ld	hl,#0x0008
   0243 19            [11]  290 	add	hl,de
   0244 EB            [ 4]  291 	ex	de,hl
   0245 DD 6E FE      [19]  292 	ld	l,-2 (ix)
   0248 DD 66 FF      [19]  293 	ld	h,-1 (ix)
   024B 7E            [ 7]  294 	ld	a,(hl)
   024C D5            [11]  295 	push	de
   024D C5            [11]  296 	push	bc
   024E 33            [ 6]  297 	inc	sp
   024F F5            [11]  298 	push	af
   0250 33            [ 6]  299 	inc	sp
   0251 21 00 C0      [10]  300 	ld	hl,#0xC000
   0254 E5            [11]  301 	push	hl
   0255 CD 93 05      [17]  302 	call	_cpct_getScreenPtr
   0258 45            [ 4]  303 	ld	b,l
   0259 4C            [ 4]  304 	ld	c,h
   025A D1            [10]  305 	pop	de
   025B 78            [ 4]  306 	ld	a,b
   025C 12            [ 7]  307 	ld	(de),a
   025D 13            [ 6]  308 	inc	de
   025E 79            [ 4]  309 	ld	a,c
   025F 12            [ 7]  310 	ld	(de),a
   0260                     311 00115$:
   0260 DD F9         [10]  312 	ld	sp, ix
   0262 DD E1         [14]  313 	pop	ix
   0264 C9            [10]  314 	ret
                            315 ;src/game.c:52: void drawAll(){
                            316 ;	---------------------------------
                            317 ; Function drawAll
                            318 ; ---------------------------------
   0265                     319 _drawAll::
                            320 ;src/game.c:53: cpct_drawSolidBox(player->pe.de.e.pscreen, cpct_px2byteM1(1, 1, 1, 1), SPR_W, SPR_H);
   0265 21 01 01      [10]  321 	ld	hl,#0x0101
   0268 E5            [11]  322 	push	hl
   0269 2E 01         [ 7]  323 	ld	l, #0x01
   026B E5            [11]  324 	push	hl
   026C CD AE 04      [17]  325 	call	_cpct_px2byteM1
   026F F1            [10]  326 	pop	af
   0270 F1            [10]  327 	pop	af
   0271 45            [ 4]  328 	ld	b,l
   0272 2A 3E 06      [16]  329 	ld	hl,(_player)
   0275 5E            [ 7]  330 	ld	e,(hl)
   0276 23            [ 6]  331 	inc	hl
   0277 56            [ 7]  332 	ld	d,(hl)
   0278 21 04 10      [10]  333 	ld	hl,#0x1004
   027B E5            [11]  334 	push	hl
   027C C5            [11]  335 	push	bc
   027D 33            [ 6]  336 	inc	sp
   027E D5            [11]  337 	push	de
   027F CD DB 04      [17]  338 	call	_cpct_drawSolidBox
   0282 F1            [10]  339 	pop	af
   0283 F1            [10]  340 	pop	af
   0284 33            [ 6]  341 	inc	sp
   0285 FD 2A 3E 06   [20]  342 	ld	iy,(_player)
                            343 ;src/game.c:54: cpct_drawSpriteMasked(player->pe.de.e.sprite, player->pe.de.npscreen, SPR_W, SPR_H);
   0289 FD E5         [15]  344 	push	iy
   028B E1            [10]  345 	pop	hl
   028C 11 08 00      [10]  346 	ld	de, #0x0008
   028F 19            [11]  347 	add	hl, de
   0290 4E            [ 7]  348 	ld	c,(hl)
   0291 23            [ 6]  349 	inc	hl
   0292 46            [ 7]  350 	ld	b,(hl)
   0293 FD 5E 02      [19]  351 	ld	e,2 (iy)
   0296 FD 56 03      [19]  352 	ld	d,3 (iy)
   0299 21 04 10      [10]  353 	ld	hl,#0x1004
   029C E5            [11]  354 	push	hl
   029D C5            [11]  355 	push	bc
   029E D5            [11]  356 	push	de
   029F CD 4A 04      [17]  357 	call	_cpct_drawSpriteMasked
   02A2 C9            [10]  358 	ret
                            359 ;src/game.c:57: void game() {
                            360 ;	---------------------------------
                            361 ; Function game
                            362 ; ---------------------------------
   02A3                     363 _game::
                            364 ;src/game.c:59: player = getPlayer();
   02A3 CD 7E 03      [17]  365 	call	_getPlayer
   02A6 22 3E 06      [16]  366 	ld	(_player),hl
                            367 ;src/game.c:65: pvideomem = INIT_VMEM; 
   02A9 21 00 C0      [10]  368 	ld	hl,#0xC000
   02AC 22 40 06      [16]  369 	ld	(_pvideomem),hl
                            370 ;src/game.c:67: initializeGameScreen();   // Set up Game Screen
   02AF CD 00 01      [17]  371 	call	_initializeGameScreen
                            372 ;src/game.c:72: while(player->lifes > 0) {      
   02B2                     373 00101$:
   02B2 FD 2A 3E 06   [20]  374 	ld	iy,(_player)
   02B6 FD 7E 10      [19]  375 	ld	a,16 (iy)
   02B9 B7            [ 4]  376 	or	a, a
   02BA C8            [11]  377 	ret	Z
                            378 ;src/game.c:73: cpct_waitVSYNC();            
   02BB CD A6 04      [17]  379 	call	_cpct_waitVSYNC
                            380 ;src/game.c:75: updateUser();                
   02BE CD 3B 01      [17]  381 	call	_updateUser
                            382 ;src/game.c:76: drawAll();                   
   02C1 CD 65 02      [17]  383 	call	_drawAll
   02C4 18 EC         [12]  384 	jr	00101$
                            385 	.area _CODE
                            386 	.area _INITIALIZER
                            387 	.area _CABS (ABS)
