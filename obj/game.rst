                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.4 #9329 (Linux)
                              4 ; This file was generated Tue Oct  6 16:24:27 2015
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
   05CB                      33 _player::
   05CB                      34 	.ds 2
   05CD                      35 _pvideomem::
   05CD                      36 	.ds 2
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
   0107 CD 3B 04      [17]   71 	call	_cpct_px2byteM1
   010A F1            [10]   72 	pop	af
   010B F1            [10]   73 	pop	af
   010C 55            [ 4]   74 	ld	d,l
   010D 21 40 C8      [10]   75 	ld	hl,#0xC840
   0110 E5            [11]   76 	push	hl
   0111 D5            [11]   77 	push	de
   0112 33            [ 6]   78 	inc	sp
   0113 21 00 C0      [10]   79 	ld	hl,#0xC000
   0116 E5            [11]   80 	push	hl
   0117 CD 68 04      [17]   81 	call	_cpct_drawSolidBox
   011A F1            [10]   82 	pop	af
   011B F1            [10]   83 	pop	af
   011C 33            [ 6]   84 	inc	sp
                             85 ;src/game.c:25: cpct_drawSolidBox(INIT_VMEM + 64, cpct_px2byteM1(1, 1, 1, 1), 16, 200);
   011D 21 01 01      [10]   86 	ld	hl,#0x0101
   0120 E5            [11]   87 	push	hl
   0121 2E 01         [ 7]   88 	ld	l, #0x01
   0123 E5            [11]   89 	push	hl
   0124 CD 3B 04      [17]   90 	call	_cpct_px2byteM1
   0127 F1            [10]   91 	pop	af
   0128 F1            [10]   92 	pop	af
   0129 55            [ 4]   93 	ld	d,l
   012A 21 10 C8      [10]   94 	ld	hl,#0xC810
   012D E5            [11]   95 	push	hl
   012E D5            [11]   96 	push	de
   012F 33            [ 6]   97 	inc	sp
   0130 21 40 C0      [10]   98 	ld	hl,#0xC040
   0133 E5            [11]   99 	push	hl
   0134 CD 68 04      [17]  100 	call	_cpct_drawSolidBox
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
                            114 ;src/game.c:31: x = &(player->pe.de.e.c.x);
   0144 ED 4B CB 05   [20]  115 	ld	bc,(_player)
   0148 21 04 00      [10]  116 	ld	hl,#0x0004
   014B 09            [11]  117 	add	hl,bc
   014C EB            [ 4]  118 	ex	de,hl
                            119 ;src/game.c:32: y = &(player->pe.de.e.c.y);
   014D 21 05 00      [10]  120 	ld	hl,#0x0005
   0150 09            [11]  121 	add	hl,bc
   0151 E3            [19]  122 	ex	(sp), hl
                            123 ;src/game.c:34: cpct_scanKeyboard_f();
   0152 D5            [11]  124 	push	de
   0153 CD 44 03      [17]  125 	call	_cpct_scanKeyboard_f
   0156 21 00 02      [10]  126 	ld	hl,#0x0200
   0159 CD 38 03      [17]  127 	call	_cpct_isKeyPressed
   015C 7D            [ 4]  128 	ld	a,l
   015D D1            [10]  129 	pop	de
   015E B7            [ 4]  130 	or	a, a
   015F 28 1E         [12]  131 	jr	Z,00105$
   0161 1A            [ 7]  132 	ld	a,(de)
   0162 4F            [ 4]  133 	ld	c,a
   0163 D6 4C         [ 7]  134 	sub	a, #0x4C
   0165 30 18         [12]  135 	jr	NC,00105$
                            136 ;src/game.c:36: pvideomem = cpct_getScreenPtr(INIT_VMEM,++(*x),*y);
   0167 E1            [10]  137 	pop	hl
   0168 E5            [11]  138 	push	hl
   0169 46            [ 7]  139 	ld	b,(hl)
   016A 79            [ 4]  140 	ld	a,c
   016B 3C            [ 4]  141 	inc	a
   016C 12            [ 7]  142 	ld	(de),a
   016D D5            [11]  143 	push	de
   016E C5            [11]  144 	push	bc
   016F 33            [ 6]  145 	inc	sp
   0170 F5            [11]  146 	push	af
   0171 33            [ 6]  147 	inc	sp
   0172 21 00 C0      [10]  148 	ld	hl,#0xC000
   0175 E5            [11]  149 	push	hl
   0176 CD 20 05      [17]  150 	call	_cpct_getScreenPtr
   0179 D1            [10]  151 	pop	de
   017A 22 CD 05      [16]  152 	ld	(_pvideomem),hl
   017D 18 26         [12]  153 	jr	00106$
   017F                     154 00105$:
                            155 ;src/game.c:38: else if (cpct_isKeyPressed(Key_CursorLeft)  && (*x) >   0        ) {
   017F D5            [11]  156 	push	de
   0180 21 01 01      [10]  157 	ld	hl,#0x0101
   0183 CD 38 03      [17]  158 	call	_cpct_isKeyPressed
   0186 7D            [ 4]  159 	ld	a,l
   0187 D1            [10]  160 	pop	de
   0188 B7            [ 4]  161 	or	a, a
   0189 28 1A         [12]  162 	jr	Z,00106$
   018B 1A            [ 7]  163 	ld	a,(de)
   018C B7            [ 4]  164 	or	a, a
   018D 28 16         [12]  165 	jr	Z,00106$
                            166 ;src/game.c:39: pvideomem = cpct_getScreenPtr(INIT_VMEM,--(*x),*y);
   018F E1            [10]  167 	pop	hl
   0190 E5            [11]  168 	push	hl
   0191 46            [ 7]  169 	ld	b,(hl)
   0192 C6 FF         [ 7]  170 	add	a,#0xFF
   0194 12            [ 7]  171 	ld	(de),a
   0195 D5            [11]  172 	push	de
   0196 C5            [11]  173 	push	bc
   0197 33            [ 6]  174 	inc	sp
   0198 F5            [11]  175 	push	af
   0199 33            [ 6]  176 	inc	sp
   019A 21 00 C0      [10]  177 	ld	hl,#0xC000
   019D E5            [11]  178 	push	hl
   019E CD 20 05      [17]  179 	call	_cpct_getScreenPtr
   01A1 D1            [10]  180 	pop	de
   01A2 22 CD 05      [16]  181 	ld	(_pvideomem),hl
   01A5                     182 00106$:
                            183 ;src/game.c:41: if      (cpct_isKeyPressed(Key_CursorUp)    && *y >   0        ) { 
   01A5 D5            [11]  184 	push	de
   01A6 21 00 01      [10]  185 	ld	hl,#0x0100
   01A9 CD 38 03      [17]  186 	call	_cpct_isKeyPressed
   01AC 7D            [ 4]  187 	ld	a,l
   01AD D1            [10]  188 	pop	de
   01AE B7            [ 4]  189 	or	a, a
   01AF 28 1D         [12]  190 	jr	Z,00112$
   01B1 E1            [10]  191 	pop	hl
   01B2 E5            [11]  192 	push	hl
   01B3 7E            [ 7]  193 	ld	a,(hl)
   01B4 B7            [ 4]  194 	or	a, a
   01B5 28 17         [12]  195 	jr	Z,00112$
                            196 ;src/game.c:42: *y = (*y)-3;
   01B7 C6 FD         [ 7]  197 	add	a,#0xFD
   01B9 47            [ 4]  198 	ld	b,a
   01BA E1            [10]  199 	pop	hl
   01BB E5            [11]  200 	push	hl
   01BC 70            [ 7]  201 	ld	(hl),b
                            202 ;src/game.c:43: pvideomem = cpct_getScreenPtr(INIT_VMEM, *x, *y); 
   01BD 1A            [ 7]  203 	ld	a,(de)
   01BE C5            [11]  204 	push	bc
   01BF 33            [ 6]  205 	inc	sp
   01C0 F5            [11]  206 	push	af
   01C1 33            [ 6]  207 	inc	sp
   01C2 21 00 C0      [10]  208 	ld	hl,#0xC000
   01C5 E5            [11]  209 	push	hl
   01C6 CD 20 05      [17]  210 	call	_cpct_getScreenPtr
   01C9 22 CD 05      [16]  211 	ld	(_pvideomem),hl
   01CC 18 29         [12]  212 	jr	00115$
   01CE                     213 00112$:
                            214 ;src/game.c:45: else if (cpct_isKeyPressed(Key_CursorDown)  && *y < 197 - SPR_H) { 
   01CE D5            [11]  215 	push	de
   01CF 21 00 04      [10]  216 	ld	hl,#0x0400
   01D2 CD 38 03      [17]  217 	call	_cpct_isKeyPressed
   01D5 7D            [ 4]  218 	ld	a,l
   01D6 D1            [10]  219 	pop	de
   01D7 B7            [ 4]  220 	or	a, a
   01D8 28 1D         [12]  221 	jr	Z,00115$
   01DA E1            [10]  222 	pop	hl
   01DB E5            [11]  223 	push	hl
   01DC 46            [ 7]  224 	ld	b,(hl)
   01DD 78            [ 4]  225 	ld	a,b
   01DE D6 B5         [ 7]  226 	sub	a, #0xB5
   01E0 30 15         [12]  227 	jr	NC,00115$
                            228 ;src/game.c:46: *y = (*y)+3;
   01E2 04            [ 4]  229 	inc	b
   01E3 04            [ 4]  230 	inc	b
   01E4 04            [ 4]  231 	inc	b
   01E5 E1            [10]  232 	pop	hl
   01E6 E5            [11]  233 	push	hl
   01E7 70            [ 7]  234 	ld	(hl),b
                            235 ;src/game.c:47: pvideomem = cpct_getScreenPtr(INIT_VMEM, *x, *y); 
   01E8 1A            [ 7]  236 	ld	a,(de)
   01E9 C5            [11]  237 	push	bc
   01EA 33            [ 6]  238 	inc	sp
   01EB F5            [11]  239 	push	af
   01EC 33            [ 6]  240 	inc	sp
   01ED 21 00 C0      [10]  241 	ld	hl,#0xC000
   01F0 E5            [11]  242 	push	hl
   01F1 CD 20 05      [17]  243 	call	_cpct_getScreenPtr
   01F4 22 CD 05      [16]  244 	ld	(_pvideomem),hl
   01F7                     245 00115$:
   01F7 DD F9         [10]  246 	ld	sp, ix
   01F9 DD E1         [14]  247 	pop	ix
   01FB C9            [10]  248 	ret
                            249 ;src/game.c:51: void drawAll(){
                            250 ;	---------------------------------
                            251 ; Function drawAll
                            252 ; ---------------------------------
   01FC                     253 _drawAll::
                            254 ;src/game.c:53: cpct_drawSpriteMasked(player->pe.de.e.sprite, pvideomem, SPR_W, SPR_H);
   01FC ED 4B CD 05   [20]  255 	ld	bc,(_pvideomem)
   0200 2A CB 05      [16]  256 	ld	hl,(_player)
   0203 23            [ 6]  257 	inc	hl
   0204 23            [ 6]  258 	inc	hl
   0205 5E            [ 7]  259 	ld	e,(hl)
   0206 23            [ 6]  260 	inc	hl
   0207 56            [ 7]  261 	ld	d,(hl)
   0208 21 04 10      [10]  262 	ld	hl,#0x1004
   020B E5            [11]  263 	push	hl
   020C C5            [11]  264 	push	bc
   020D D5            [11]  265 	push	de
   020E CD D7 03      [17]  266 	call	_cpct_drawSpriteMasked
   0211 C9            [10]  267 	ret
                            268 ;src/game.c:56: void game() {
                            269 ;	---------------------------------
                            270 ; Function game
                            271 ; ---------------------------------
   0212                     272 _game::
                            273 ;src/game.c:58: player = getPlayer();
   0212 CD 0B 03      [17]  274 	call	_getPlayer
   0215 22 CB 05      [16]  275 	ld	(_player),hl
                            276 ;src/game.c:64: pvideomem = INIT_VMEM; 
   0218 21 00 C0      [10]  277 	ld	hl,#0xC000
   021B 22 CD 05      [16]  278 	ld	(_pvideomem),hl
                            279 ;src/game.c:66: initializeGameScreen();   // Set up Game Screen
   021E CD 00 01      [17]  280 	call	_initializeGameScreen
                            281 ;src/game.c:71: while(player->lifes > 0) {      
   0221                     282 00101$:
   0221 FD 2A CB 05   [20]  283 	ld	iy,(_player)
   0225 FD 7E 10      [19]  284 	ld	a,16 (iy)
   0228 B7            [ 4]  285 	or	a, a
   0229 C8            [11]  286 	ret	Z
                            287 ;src/game.c:72: cpct_waitVSYNC();            
   022A CD 33 04      [17]  288 	call	_cpct_waitVSYNC
                            289 ;src/game.c:74: cpct_drawSolidBox(pvideomem, cpct_px2byteM1(1, 1, 1, 1), SPR_W, SPR_H);
   022D 21 01 01      [10]  290 	ld	hl,#0x0101
   0230 E5            [11]  291 	push	hl
   0231 2E 01         [ 7]  292 	ld	l, #0x01
   0233 E5            [11]  293 	push	hl
   0234 CD 3B 04      [17]  294 	call	_cpct_px2byteM1
   0237 F1            [10]  295 	pop	af
   0238 F1            [10]  296 	pop	af
   0239 45            [ 4]  297 	ld	b,l
   023A ED 5B CD 05   [20]  298 	ld	de,(_pvideomem)
   023E 21 04 10      [10]  299 	ld	hl,#0x1004
   0241 E5            [11]  300 	push	hl
   0242 C5            [11]  301 	push	bc
   0243 33            [ 6]  302 	inc	sp
   0244 D5            [11]  303 	push	de
   0245 CD 68 04      [17]  304 	call	_cpct_drawSolidBox
   0248 F1            [10]  305 	pop	af
   0249 F1            [10]  306 	pop	af
   024A 33            [ 6]  307 	inc	sp
                            308 ;src/game.c:75: updateUser();                
   024B CD 3B 01      [17]  309 	call	_updateUser
                            310 ;src/game.c:76: drawAll();                   
   024E CD FC 01      [17]  311 	call	_drawAll
   0251 18 CE         [12]  312 	jr	00101$
                            313 	.area _CODE
                            314 	.area _INITIALIZER
                            315 	.area _CABS (ABS)
