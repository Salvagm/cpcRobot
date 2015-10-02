                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (Linux)
                              4 ; This file was generated Fri Oct  2 22:50:00 2015
                              5 ;--------------------------------------------------------
                              6 	.module game
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _drawAll
                             13 	.globl _cpct_getScreenPtr
                             14 	.globl _cpct_waitVSYNC
                             15 	.globl _cpct_drawSolidBox
                             16 	.globl _cpct_drawSpriteMasked
                             17 	.globl _cpct_px2byteM1
                             18 	.globl _cpct_isKeyPressed
                             19 	.globl _cpct_scanKeyboard_f
                             20 	.globl _pvideomem
                             21 	.globl _y
                             22 	.globl _x
                             23 	.globl _alive
                             24 	.globl _initializeGameScreen
                             25 	.globl _updateUser
                             26 	.globl _game
                             27 ;--------------------------------------------------------
                             28 ; special function registers
                             29 ;--------------------------------------------------------
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _DATA
   05A7                      34 _alive::
   05A7                      35 	.ds 1
   05A8                      36 _x::
   05A8                      37 	.ds 1
   05A9                      38 _y::
   05A9                      39 	.ds 1
   05AA                      40 _pvideomem::
   05AA                      41 	.ds 2
                             42 ;--------------------------------------------------------
                             43 ; ram data
                             44 ;--------------------------------------------------------
                             45 	.area _INITIALIZED
                             46 ;--------------------------------------------------------
                             47 ; absolute external ram data
                             48 ;--------------------------------------------------------
                             49 	.area _DABS (ABS)
                             50 ;--------------------------------------------------------
                             51 ; global & static initialisations
                             52 ;--------------------------------------------------------
                             53 	.area _HOME
                             54 	.area _GSINIT
                             55 	.area _GSFINAL
                             56 	.area _GSINIT
                             57 ;--------------------------------------------------------
                             58 ; Home
                             59 ;--------------------------------------------------------
                             60 	.area _HOME
                             61 	.area _HOME
                             62 ;--------------------------------------------------------
                             63 ; code
                             64 ;--------------------------------------------------------
                             65 	.area _CODE
                             66 ;src/game.c:21: void initializeGameScreen() {
                             67 ;	---------------------------------
                             68 ; Function initializeGameScreen
                             69 ; ---------------------------------
   0100                      70 _initializeGameScreen::
                             71 ;src/game.c:23: cpct_drawSolidBox(INIT_VMEM, cpct_px2byteM1(1, 1, 1, 1), 64, 200);
   0100 21 01 01      [10]   72 	ld	hl,#0x0101
   0103 E5            [11]   73 	push	hl
   0104 2E 01         [ 7]   74 	ld	l, #0x01
   0106 E5            [11]   75 	push	hl
   0107 CD 17 04      [17]   76 	call	_cpct_px2byteM1
   010A F1            [10]   77 	pop	af
   010B F1            [10]   78 	pop	af
   010C 55            [ 4]   79 	ld	d,l
   010D 21 40 C8      [10]   80 	ld	hl,#0xC840
   0110 E5            [11]   81 	push	hl
   0111 D5            [11]   82 	push	de
   0112 33            [ 6]   83 	inc	sp
   0113 21 00 C0      [10]   84 	ld	hl,#0xC000
   0116 E5            [11]   85 	push	hl
   0117 CD 44 04      [17]   86 	call	_cpct_drawSolidBox
   011A F1            [10]   87 	pop	af
   011B F1            [10]   88 	pop	af
   011C 33            [ 6]   89 	inc	sp
                             90 ;src/game.c:24: cpct_drawSolidBox(INIT_VMEM + 64, cpct_px2byteM1(1, 1, 1, 1), 16, 200);
   011D 21 01 01      [10]   91 	ld	hl,#0x0101
   0120 E5            [11]   92 	push	hl
   0121 2E 01         [ 7]   93 	ld	l, #0x01
   0123 E5            [11]   94 	push	hl
   0124 CD 17 04      [17]   95 	call	_cpct_px2byteM1
   0127 F1            [10]   96 	pop	af
   0128 F1            [10]   97 	pop	af
   0129 55            [ 4]   98 	ld	d,l
   012A 21 10 C8      [10]   99 	ld	hl,#0xC810
   012D E5            [11]  100 	push	hl
   012E D5            [11]  101 	push	de
   012F 33            [ 6]  102 	inc	sp
   0130 21 40 C0      [10]  103 	ld	hl,#0xC040
   0133 E5            [11]  104 	push	hl
   0134 CD 44 04      [17]  105 	call	_cpct_drawSolidBox
   0137 F1            [10]  106 	pop	af
   0138 F1            [10]  107 	pop	af
   0139 33            [ 6]  108 	inc	sp
   013A C9            [10]  109 	ret
                            110 ;src/game.c:27: void updateUser() {
                            111 ;	---------------------------------
                            112 ; Function updateUser
                            113 ; ---------------------------------
   013B                     114 _updateUser::
                            115 ;src/game.c:30: cpct_scanKeyboard_f();
   013B CD 19 03      [17]  116 	call	_cpct_scanKeyboard_f
                            117 ;src/game.c:31: if      (cpct_isKeyPressed(Key_CursorRight) && x <  80 - SPR_W) { x++; pvideomem++; }
   013E 21 00 02      [10]  118 	ld	hl,#0x0200
   0141 CD 0D 03      [17]  119 	call	_cpct_isKeyPressed
   0144 7D            [ 4]  120 	ld	a,l
   0145 B7            [ 4]  121 	or	a, a
   0146 28 17         [12]  122 	jr	Z,00105$
   0148 3A A8 05      [13]  123 	ld	a,(#_x + 0)
   014B D6 4C         [ 7]  124 	sub	a, #0x4C
   014D 30 10         [12]  125 	jr	NC,00105$
   014F 21 A8 05      [10]  126 	ld	hl, #_x+0
   0152 34            [11]  127 	inc	(hl)
   0153 21 AA 05      [10]  128 	ld	hl, #_pvideomem+0
   0156 34            [11]  129 	inc	(hl)
   0157 20 21         [12]  130 	jr	NZ,00106$
   0159 21 AB 05      [10]  131 	ld	hl, #_pvideomem+1
   015C 34            [11]  132 	inc	(hl)
   015D 18 1B         [12]  133 	jr	00106$
   015F                     134 00105$:
                            135 ;src/game.c:32: else if (cpct_isKeyPressed(Key_CursorLeft)  && x >   0        ) { x--; pvideomem--; }
   015F 21 01 01      [10]  136 	ld	hl,#0x0101
   0162 CD 0D 03      [17]  137 	call	_cpct_isKeyPressed
   0165 7D            [ 4]  138 	ld	a,l
   0166 B7            [ 4]  139 	or	a, a
   0167 28 11         [12]  140 	jr	Z,00106$
   0169 3A A8 05      [13]  141 	ld	a,(#_x + 0)
   016C B7            [ 4]  142 	or	a, a
   016D 28 0B         [12]  143 	jr	Z,00106$
   016F 21 A8 05      [10]  144 	ld	hl, #_x+0
   0172 35            [11]  145 	dec	(hl)
   0173 2A AA 05      [16]  146 	ld	hl,(_pvideomem)
   0176 2B            [ 6]  147 	dec	hl
   0177 22 AA 05      [16]  148 	ld	(_pvideomem),hl
   017A                     149 00106$:
                            150 ;src/game.c:33: if      (cpct_isKeyPressed(Key_CursorUp)    && y >   0        ) { 
   017A 21 00 01      [10]  151 	ld	hl,#0x0100
   017D CD 0D 03      [17]  152 	call	_cpct_isKeyPressed
   0180 7D            [ 4]  153 	ld	a,l
   0181 B7            [ 4]  154 	or	a, a
   0182 28 22         [12]  155 	jr	Z,00112$
   0184 3A A9 05      [13]  156 	ld	a,(#_y + 0)
   0187 B7            [ 4]  157 	or	a, a
   0188 28 1C         [12]  158 	jr	Z,00112$
                            159 ;src/game.c:34: y = y-3;
   018A 21 A9 05      [10]  160 	ld	hl,#_y
   018D 7E            [ 7]  161 	ld	a,(hl)
   018E C6 FD         [ 7]  162 	add	a,#0xFD
   0190 77            [ 7]  163 	ld	(hl),a
                            164 ;src/game.c:35: pvideomem = cpct_getScreenPtr(INIT_VMEM, x, y); 
   0191 3A A9 05      [13]  165 	ld	a,(_y)
   0194 F5            [11]  166 	push	af
   0195 33            [ 6]  167 	inc	sp
   0196 3A A8 05      [13]  168 	ld	a,(_x)
   0199 F5            [11]  169 	push	af
   019A 33            [ 6]  170 	inc	sp
   019B 21 00 C0      [10]  171 	ld	hl,#0xC000
   019E E5            [11]  172 	push	hl
   019F CD FC 04      [17]  173 	call	_cpct_getScreenPtr
   01A2 22 AA 05      [16]  174 	ld	(_pvideomem),hl
   01A5 C9            [10]  175 	ret
   01A6                     176 00112$:
                            177 ;src/game.c:37: else if (cpct_isKeyPressed(Key_CursorDown)  && y < 197 - SPR_H) { 
   01A6 21 00 04      [10]  178 	ld	hl,#0x0400
   01A9 CD 0D 03      [17]  179 	call	_cpct_isKeyPressed
   01AC 7D            [ 4]  180 	ld	a,l
   01AD B7            [ 4]  181 	or	a, a
   01AE C8            [11]  182 	ret	Z
   01AF 3A A9 05      [13]  183 	ld	a,(#_y + 0)
   01B2 D6 B5         [ 7]  184 	sub	a, #0xB5
   01B4 D0            [11]  185 	ret	NC
                            186 ;src/game.c:38: y = y+3;
   01B5 21 A9 05      [10]  187 	ld	hl, #_y+0
   01B8 34            [11]  188 	inc	(hl)
   01B9 21 A9 05      [10]  189 	ld	hl, #_y+0
   01BC 34            [11]  190 	inc	(hl)
   01BD 21 A9 05      [10]  191 	ld	hl, #_y+0
   01C0 34            [11]  192 	inc	(hl)
                            193 ;src/game.c:39: pvideomem = cpct_getScreenPtr(INIT_VMEM, x, y); 
   01C1 3A A9 05      [13]  194 	ld	a,(_y)
   01C4 F5            [11]  195 	push	af
   01C5 33            [ 6]  196 	inc	sp
   01C6 3A A8 05      [13]  197 	ld	a,(_x)
   01C9 F5            [11]  198 	push	af
   01CA 33            [ 6]  199 	inc	sp
   01CB 21 00 C0      [10]  200 	ld	hl,#0xC000
   01CE E5            [11]  201 	push	hl
   01CF CD FC 04      [17]  202 	call	_cpct_getScreenPtr
   01D2 22 AA 05      [16]  203 	ld	(_pvideomem),hl
   01D5 C9            [10]  204 	ret
                            205 ;src/game.c:42: void drawAll(){
                            206 ;	---------------------------------
                            207 ; Function drawAll
                            208 ; ---------------------------------
   01D6                     209 _drawAll::
                            210 ;src/game.c:44: cpct_drawSpriteMasked(g_character, pvideomem, SPR_W, SPR_H);
   01D6 ED 4B AA 05   [20]  211 	ld	bc,(_pvideomem)
   01DA 11 69 02      [10]  212 	ld	de,#_g_character
   01DD 21 04 10      [10]  213 	ld	hl,#0x1004
   01E0 E5            [11]  214 	push	hl
   01E1 C5            [11]  215 	push	bc
   01E2 D5            [11]  216 	push	de
   01E3 CD B3 03      [17]  217 	call	_cpct_drawSpriteMasked
   01E6 C9            [10]  218 	ret
                            219 ;src/game.c:47: void game() {
                            220 ;	---------------------------------
                            221 ; Function game
                            222 ; ---------------------------------
   01E7                     223 _game::
                            224 ;src/game.c:49: alive = 1;
   01E7 21 A7 05      [10]  225 	ld	hl,#_alive + 0
   01EA 36 01         [10]  226 	ld	(hl), #0x01
                            227 ;src/game.c:50: x=0, y=0;
   01EC 21 A8 05      [10]  228 	ld	hl,#_x + 0
   01EF 36 00         [10]  229 	ld	(hl), #0x00
   01F1 21 A9 05      [10]  230 	ld	hl,#_y + 0
   01F4 36 00         [10]  231 	ld	(hl), #0x00
                            232 ;src/game.c:51: pvideomem = INIT_VMEM; 
   01F6 21 00 C0      [10]  233 	ld	hl,#0xC000
   01F9 22 AA 05      [16]  234 	ld	(_pvideomem),hl
                            235 ;src/game.c:53: initializeGameScreen();   // Set up Game Screen
   01FC CD 00 01      [17]  236 	call	_initializeGameScreen
                            237 ;src/game.c:58: while(alive) {
   01FF                     238 00101$:
   01FF 3A A7 05      [13]  239 	ld	a,(#_alive + 0)
   0202 B7            [ 4]  240 	or	a, a
   0203 C8            [11]  241 	ret	Z
                            242 ;src/game.c:59: cpct_waitVSYNC();            
   0204 CD 0F 04      [17]  243 	call	_cpct_waitVSYNC
                            244 ;src/game.c:61: cpct_drawSolidBox(pvideomem, cpct_px2byteM1(1, 1, 1, 1), SPR_W, SPR_H);
   0207 21 01 01      [10]  245 	ld	hl,#0x0101
   020A E5            [11]  246 	push	hl
   020B 2E 01         [ 7]  247 	ld	l, #0x01
   020D E5            [11]  248 	push	hl
   020E CD 17 04      [17]  249 	call	_cpct_px2byteM1
   0211 F1            [10]  250 	pop	af
   0212 F1            [10]  251 	pop	af
   0213 45            [ 4]  252 	ld	b,l
   0214 ED 5B AA 05   [20]  253 	ld	de,(_pvideomem)
   0218 21 04 10      [10]  254 	ld	hl,#0x1004
   021B E5            [11]  255 	push	hl
   021C C5            [11]  256 	push	bc
   021D 33            [ 6]  257 	inc	sp
   021E D5            [11]  258 	push	de
   021F CD 44 04      [17]  259 	call	_cpct_drawSolidBox
   0222 F1            [10]  260 	pop	af
   0223 F1            [10]  261 	pop	af
   0224 33            [ 6]  262 	inc	sp
                            263 ;src/game.c:62: updateUser();                
   0225 CD 3B 01      [17]  264 	call	_updateUser
                            265 ;src/game.c:63: drawAll();                   
   0228 CD D6 01      [17]  266 	call	_drawAll
   022B 18 D2         [12]  267 	jr	00101$
                            268 	.area _CODE
                            269 	.area _INITIALIZER
                            270 	.area _CABS (ABS)
