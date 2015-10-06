                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.4 #9329 (Linux)
                              4 ; This file was generated Tue Oct  6 15:22:14 2015
                              5 ;--------------------------------------------------------
                              6 	.module main
                              7 	.optsdcc -mz80
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _main
                             13 	.globl _init
                             14 	.globl _game
                             15 	.globl _cpct_setPALColour
                             16 	.globl _cpct_setPalette
                             17 	.globl _cpct_fw2hw
                             18 	.globl _cpct_setVideoMode
                             19 	.globl _cpct_disableFirmware
                             20 ;--------------------------------------------------------
                             21 ; special function registers
                             22 ;--------------------------------------------------------
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _DATA
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _INITIALIZED
                             31 ;--------------------------------------------------------
                             32 ; absolute external ram data
                             33 ;--------------------------------------------------------
                             34 	.area _DABS (ABS)
                             35 ;--------------------------------------------------------
                             36 ; global & static initialisations
                             37 ;--------------------------------------------------------
                             38 	.area _HOME
                             39 	.area _GSINIT
                             40 	.area _GSFINAL
                             41 	.area _GSINIT
                             42 ;--------------------------------------------------------
                             43 ; Home
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _HOME
                             47 ;--------------------------------------------------------
                             48 ; code
                             49 ;--------------------------------------------------------
                             50 	.area _CODE
                             51 ;src/main.c:6: void init(){
                             52 ;	---------------------------------
                             53 ; Function init
                             54 ; ---------------------------------
   0253                      55 _init::
                             56 ;src/main.c:8: cpct_disableFirmware();
   0253 CD 57 04      [17]   57 	call	_cpct_disableFirmware
                             58 ;src/main.c:10: cpct_fw2hw     (g_palette, 4);
   0256 21 87 02      [10]   59 	ld	hl,#_g_palette
   0259 01 04 00      [10]   60 	ld	bc,#0x0004
   025C C5            [11]   61 	push	bc
   025D E5            [11]   62 	push	hl
   025E CD BA 03      [17]   63 	call	_cpct_fw2hw
                             64 ;src/main.c:11: cpct_setPalette(g_palette, 4);
   0261 21 87 02      [10]   65 	ld	hl,#_g_palette
   0264 01 04 00      [10]   66 	ld	bc,#0x0004
   0267 C5            [11]   67 	push	bc
   0268 E5            [11]   68 	push	hl
   0269 CD 21 03      [17]   69 	call	_cpct_setPalette
                             70 ;src/main.c:12: cpct_setBorder (g_palette[3]);
   026C 3A 8A 02      [13]   71 	ld	a, (#_g_palette + 3)
   026F 57            [ 4]   72 	ld	d,a
   0270 1E 10         [ 7]   73 	ld	e,#0x10
   0272 D5            [11]   74 	push	de
   0273 CD AE 03      [17]   75 	call	_cpct_setPALColour
                             76 ;src/main.c:14: cpct_setVideoMode(1);
   0276 3E 01         [ 7]   77 	ld	a,#0x01
   0278 F5            [11]   78 	push	af
   0279 33            [ 6]   79 	inc	sp
   027A CD 21 04      [17]   80 	call	_cpct_setVideoMode
   027D 33            [ 6]   81 	inc	sp
   027E C9            [10]   82 	ret
                             83 ;src/main.c:17: void main(void) {
                             84 ;	---------------------------------
                             85 ; Function main
                             86 ; ---------------------------------
   027F                      87 _main::
                             88 ;src/main.c:19: init();         
   027F CD 53 02      [17]   89 	call	_init
                             90 ;src/main.c:21: while (1){
   0282                      91 00102$:
                             92 ;src/main.c:22: game();
   0282 CD 12 02      [17]   93 	call	_game
   0285 18 FB         [12]   94 	jr	00102$
                             95 	.area _CODE
                             96 	.area _INITIALIZER
                             97 	.area _CABS (ABS)
