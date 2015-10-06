                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (Linux)
                              4 ; This file was generated Mon Oct  5 21:06:19 2015
                              5 ;--------------------------------------------------------
                              6 	.module game
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _drawAll
                             13 	.globl _cpct_waitVSYNC
                             14 	.globl _cpct_drawSolidBox
                             15 	.globl _cpct_drawSpriteMasked
                             16 	.globl _cpct_px2byteM1
                             17 	.globl _cpct_isKeyPressed
                             18 	.globl _cpct_scanKeyboard_f
                             19 	.globl _pvideomem
                             20 	.globl _character
                             21 	.globl _initializeGameScreen
                             22 	.globl _updateUser
                             23 	.globl _game
                             24 ;--------------------------------------------------------
                             25 ; special function registers
                             26 ;--------------------------------------------------------
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DATA
   0579                      31 _character::
   0579                      32 	.ds 4
   057D                      33 _pvideomem::
   057D                      34 	.ds 2
                             35 ;--------------------------------------------------------
                             36 ; ram data
                             37 ;--------------------------------------------------------
                             38 	.area _INITIALIZED
                             39 ;--------------------------------------------------------
                             40 ; absolute external ram data
                             41 ;--------------------------------------------------------
                             42 	.area _DABS (ABS)
                             43 ;--------------------------------------------------------
                             44 ; global & static initialisations
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _GSINIT
                             48 	.area _GSFINAL
                             49 	.area _GSINIT
                             50 ;--------------------------------------------------------
                             51 ; Home
                             52 ;--------------------------------------------------------
                             53 	.area _HOME
                             54 	.area _HOME
                             55 ;--------------------------------------------------------
                             56 ; code
                             57 ;--------------------------------------------------------
                             58 	.area _CODE
                             59 ;src/game.c:23: void initializeGameScreen() {
                             60 ;	---------------------------------
                             61 ; Function initializeGameScreen
                             62 ; ---------------------------------
   0100                      63 _initializeGameScreen::
                             64 ;src/game.c:25: cpct_drawSolidBox(INIT_VMEM, cpct_px2byteM1(1, 1, 1, 1), 64, 200);
   0100 21 01 01      [10]   65 	ld	hl,#0x0101
   0103 E5            [11]   66 	push	hl
   0104 2E 01         [ 7]   67 	ld	l, #0x01
   0106 E5            [11]   68 	push	hl
   0107 CD 09 04      [17]   69 	call	_cpct_px2byteM1
   010A F1            [10]   70 	pop	af
   010B F1            [10]   71 	pop	af
   010C 55            [ 4]   72 	ld	d,l
   010D 21 40 C8      [10]   73 	ld	hl,#0xC840
   0110 E5            [11]   74 	push	hl
   0111 D5            [11]   75 	push	de
   0112 33            [ 6]   76 	inc	sp
   0113 21 00 C0      [10]   77 	ld	hl,#0xC000
   0116 E5            [11]   78 	push	hl
   0117 CD 36 04      [17]   79 	call	_cpct_drawSolidBox
   011A F1            [10]   80 	pop	af
   011B F1            [10]   81 	pop	af
   011C 33            [ 6]   82 	inc	sp
                             83 ;src/game.c:26: cpct_drawSolidBox(INIT_VMEM + 64, cpct_px2byteM1(1, 1, 1, 1), 16, 200);
   011D 21 01 01      [10]   84 	ld	hl,#0x0101
   0120 E5            [11]   85 	push	hl
   0121 2E 01         [ 7]   86 	ld	l, #0x01
   0123 E5            [11]   87 	push	hl
   0124 CD 09 04      [17]   88 	call	_cpct_px2byteM1
   0127 F1            [10]   89 	pop	af
   0128 F1            [10]   90 	pop	af
   0129 55            [ 4]   91 	ld	d,l
   012A 21 10 C8      [10]   92 	ld	hl,#0xC810
   012D E5            [11]   93 	push	hl
   012E D5            [11]   94 	push	de
   012F 33            [ 6]   95 	inc	sp
   0130 21 40 C0      [10]   96 	ld	hl,#0xC040
   0133 E5            [11]   97 	push	hl
   0134 CD 36 04      [17]   98 	call	_cpct_drawSolidBox
   0137 F1            [10]   99 	pop	af
   0138 F1            [10]  100 	pop	af
   0139 33            [ 6]  101 	inc	sp
   013A C9            [10]  102 	ret
                            103 ;src/game.c:29: void updateUser() {
                            104 ;	---------------------------------
                            105 ; Function updateUser
                            106 ; ---------------------------------
   013B                     107 _updateUser::
                            108 ;src/game.c:32: x = &(character.pe->de->e->c->x);
   013B 2A 79 05      [16]  109 	ld	hl, (#_character + 0)
   013E 7E            [ 7]  110 	ld	a, (hl)
   013F 23            [ 6]  111 	inc	hl
   0140 66            [ 7]  112 	ld	h,(hl)
   0141 6F            [ 4]  113 	ld	l,a
   0142 7E            [ 7]  114 	ld	a, (hl)
   0143 23            [ 6]  115 	inc	hl
   0144 66            [ 7]  116 	ld	h,(hl)
   0145 6F            [ 4]  117 	ld	l,a
   0146 11 04 00      [10]  118 	ld	de, #0x0004
   0149 19            [11]  119 	add	hl, de
   014A 5E            [ 7]  120 	ld	e,(hl)
   014B 23            [ 6]  121 	inc	hl
   014C 56            [ 7]  122 	ld	d,(hl)
                            123 ;src/game.c:35: cpct_scanKeyboard_f();
   014D D5            [11]  124 	push	de
   014E CD 0B 03      [17]  125 	call	_cpct_scanKeyboard_f
   0151 21 00 02      [10]  126 	ld	hl,#0x0200
   0154 CD FF 02      [17]  127 	call	_cpct_isKeyPressed
   0157 7D            [ 4]  128 	ld	a,l
   0158 D1            [10]  129 	pop	de
   0159 B7            [ 4]  130 	or	a, a
   015A 28 13         [12]  131 	jr	Z,00105$
   015C 1A            [ 7]  132 	ld	a,(de)
   015D 67            [ 4]  133 	ld	h,a
   015E D6 4C         [ 7]  134 	sub	a, #0x4C
   0160 30 0D         [12]  135 	jr	NC,00105$
   0162 7C            [ 4]  136 	ld	a,h
   0163 3C            [ 4]  137 	inc	a
   0164 12            [ 7]  138 	ld	(de),a
   0165 21 7D 05      [10]  139 	ld	hl, #_pvideomem+0
   0168 34            [11]  140 	inc	(hl)
   0169 C0            [11]  141 	ret	NZ
   016A 21 7E 05      [10]  142 	ld	hl, #_pvideomem+1
   016D 34            [11]  143 	inc	(hl)
   016E C9            [10]  144 	ret
   016F                     145 00105$:
                            146 ;src/game.c:37: else if (cpct_isKeyPressed(Key_CursorLeft)  && (*x) >   0        ) { --(*x); --pvideomem; }
   016F D5            [11]  147 	push	de
   0170 21 01 01      [10]  148 	ld	hl,#0x0101
   0173 CD FF 02      [17]  149 	call	_cpct_isKeyPressed
   0176 7D            [ 4]  150 	ld	a,l
   0177 D1            [10]  151 	pop	de
   0178 B7            [ 4]  152 	or	a, a
   0179 C8            [11]  153 	ret	Z
   017A 1A            [ 7]  154 	ld	a,(de)
   017B B7            [ 4]  155 	or	a, a
   017C C8            [11]  156 	ret	Z
   017D C6 FF         [ 7]  157 	add	a,#0xFF
   017F 12            [ 7]  158 	ld	(de),a
   0180 2A 7D 05      [16]  159 	ld	hl,(_pvideomem)
   0183 2B            [ 6]  160 	dec	hl
   0184 22 7D 05      [16]  161 	ld	(_pvideomem),hl
   0187 C9            [10]  162 	ret
                            163 ;src/game.c:47: void drawAll(){
                            164 ;	---------------------------------
                            165 ; Function drawAll
                            166 ; ---------------------------------
   0188                     167 _drawAll::
                            168 ;src/game.c:49: cpct_drawSpriteMasked(character.pe->de->e->sprite, pvideomem, SPR_W, SPR_H);
   0188 ED 4B 7D 05   [20]  169 	ld	bc,(_pvideomem)
   018C 2A 79 05      [16]  170 	ld	hl, (#_character + 0)
   018F 7E            [ 7]  171 	ld	a, (hl)
   0190 23            [ 6]  172 	inc	hl
   0191 66            [ 7]  173 	ld	h,(hl)
   0192 6F            [ 4]  174 	ld	l,a
   0193 7E            [ 7]  175 	ld	a, (hl)
   0194 23            [ 6]  176 	inc	hl
   0195 66            [ 7]  177 	ld	h,(hl)
   0196 6F            [ 4]  178 	ld	l,a
   0197 23            [ 6]  179 	inc	hl
   0198 23            [ 6]  180 	inc	hl
   0199 5E            [ 7]  181 	ld	e,(hl)
   019A 23            [ 6]  182 	inc	hl
   019B 56            [ 7]  183 	ld	d,(hl)
   019C 21 04 10      [10]  184 	ld	hl,#0x1004
   019F E5            [11]  185 	push	hl
   01A0 C5            [11]  186 	push	bc
   01A1 D5            [11]  187 	push	de
   01A2 CD A5 03      [17]  188 	call	_cpct_drawSpriteMasked
   01A5 C9            [10]  189 	ret
                            190 ;src/game.c:52: void game() {
                            191 ;	---------------------------------
                            192 ; Function game
                            193 ; ---------------------------------
   01A6                     194 _game::
                            195 ;src/game.c:54: character.lifes = 1;   
   01A6 21 7B 05      [10]  196 	ld	hl,#(_character + 0x0002)
   01A9 36 01         [10]  197 	ld	(hl),#0x01
                            198 ;src/game.c:55: character.pe->de->e->c->x = 0;
   01AB 2A 79 05      [16]  199 	ld	hl, (#_character + 0)
   01AE 7E            [ 7]  200 	ld	a, (hl)
   01AF 23            [ 6]  201 	inc	hl
   01B0 66            [ 7]  202 	ld	h,(hl)
   01B1 6F            [ 4]  203 	ld	l,a
   01B2 7E            [ 7]  204 	ld	a, (hl)
   01B3 23            [ 6]  205 	inc	hl
   01B4 66            [ 7]  206 	ld	h,(hl)
   01B5 6F            [ 4]  207 	ld	l,a
   01B6 11 04 00      [10]  208 	ld	de, #0x0004
   01B9 19            [11]  209 	add	hl, de
   01BA 5E            [ 7]  210 	ld	e,(hl)
   01BB 23            [ 6]  211 	inc	hl
   01BC 56            [ 7]  212 	ld	d,(hl)
   01BD AF            [ 4]  213 	xor	a, a
   01BE 12            [ 7]  214 	ld	(de),a
                            215 ;src/game.c:56: character.pe->de->e->c->y = 0;
   01BF 2A 79 05      [16]  216 	ld	hl, (#_character + 0)
   01C2 7E            [ 7]  217 	ld	a, (hl)
   01C3 23            [ 6]  218 	inc	hl
   01C4 66            [ 7]  219 	ld	h,(hl)
   01C5 6F            [ 4]  220 	ld	l,a
   01C6 7E            [ 7]  221 	ld	a, (hl)
   01C7 23            [ 6]  222 	inc	hl
   01C8 66            [ 7]  223 	ld	h,(hl)
   01C9 6F            [ 4]  224 	ld	l,a
   01CA 11 04 00      [10]  225 	ld	de, #0x0004
   01CD 19            [11]  226 	add	hl, de
   01CE 5E            [ 7]  227 	ld	e,(hl)
   01CF 23            [ 6]  228 	inc	hl
   01D0 56            [ 7]  229 	ld	d,(hl)
   01D1 13            [ 6]  230 	inc	de
   01D2 AF            [ 4]  231 	xor	a, a
   01D3 12            [ 7]  232 	ld	(de),a
                            233 ;src/game.c:57: character.pe->de->e->sprite = g_character;
   01D4 2A 79 05      [16]  234 	ld	hl, (#_character + 0)
   01D7 7E            [ 7]  235 	ld	a, (hl)
   01D8 23            [ 6]  236 	inc	hl
   01D9 66            [ 7]  237 	ld	h,(hl)
   01DA 6F            [ 4]  238 	ld	l,a
   01DB 5E            [ 7]  239 	ld	e,(hl)
   01DC 23            [ 6]  240 	inc	hl
   01DD 56            [ 7]  241 	ld	d,(hl)
   01DE 13            [ 6]  242 	inc	de
   01DF 13            [ 6]  243 	inc	de
   01E0 6B            [ 4]  244 	ld	l,e
   01E1 01 5B 02      [10]  245 	ld	bc,#_g_character+0
   01E4 62            [ 4]  246 	ld	h, d
   01E5 71            [ 7]  247 	ld	(hl),c
   01E6 23            [ 6]  248 	inc	hl
   01E7 70            [ 7]  249 	ld	(hl),b
                            250 ;src/game.c:59: pvideomem = INIT_VMEM; 
   01E8 21 00 C0      [10]  251 	ld	hl,#0xC000
   01EB 22 7D 05      [16]  252 	ld	(_pvideomem),hl
                            253 ;src/game.c:61: initializeGameScreen();   // Set up Game Screen
   01EE CD 00 01      [17]  254 	call	_initializeGameScreen
                            255 ;src/game.c:66: while(character.lifes > 0) {      
   01F1                     256 00101$:
   01F1 3A 7B 05      [13]  257 	ld	a, (#(_character + 0x0002) + 0)
   01F4 B7            [ 4]  258 	or	a, a
   01F5 C8            [11]  259 	ret	Z
                            260 ;src/game.c:67: cpct_waitVSYNC();            
   01F6 CD 01 04      [17]  261 	call	_cpct_waitVSYNC
                            262 ;src/game.c:69: cpct_drawSolidBox(pvideomem, cpct_px2byteM1(1, 1, 1, 1), SPR_W, SPR_H);
   01F9 21 01 01      [10]  263 	ld	hl,#0x0101
   01FC E5            [11]  264 	push	hl
   01FD 2E 01         [ 7]  265 	ld	l, #0x01
   01FF E5            [11]  266 	push	hl
   0200 CD 09 04      [17]  267 	call	_cpct_px2byteM1
   0203 F1            [10]  268 	pop	af
   0204 F1            [10]  269 	pop	af
   0205 45            [ 4]  270 	ld	b,l
   0206 ED 5B 7D 05   [20]  271 	ld	de,(_pvideomem)
   020A 21 04 10      [10]  272 	ld	hl,#0x1004
   020D E5            [11]  273 	push	hl
   020E C5            [11]  274 	push	bc
   020F 33            [ 6]  275 	inc	sp
   0210 D5            [11]  276 	push	de
   0211 CD 36 04      [17]  277 	call	_cpct_drawSolidBox
   0214 F1            [10]  278 	pop	af
   0215 F1            [10]  279 	pop	af
   0216 33            [ 6]  280 	inc	sp
                            281 ;src/game.c:70: updateUser();                
   0217 CD 3B 01      [17]  282 	call	_updateUser
                            283 ;src/game.c:71: drawAll();                   
   021A CD 88 01      [17]  284 	call	_drawAll
   021D 18 D2         [12]  285 	jr	00101$
                            286 	.area _CODE
                            287 	.area _INITIALIZER
                            288 	.area _CABS (ABS)
