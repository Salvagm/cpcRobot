                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.4 #9329 (Linux)
                              4 ; This file was generated Mon Oct 12 17:40:40 2015
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
   02D1                      55 _init::
                             56 ;src/main.c:8: cpct_disableFirmware();
   02D1 CD 72 07      [17]   57 	call	_cpct_disableFirmware
                             58 ;src/main.c:10: cpct_fw2hw     (g_palette, 4);
   02D4 21 52 05      [10]   59 	ld	hl,#_g_palette
   02D7 01 04 00      [10]   60 	ld	bc,#0x0004
   02DA C5            [11]   61 	push	bc
   02DB E5            [11]   62 	push	hl
   02DC CD D5 06      [17]   63 	call	_cpct_fw2hw
                             64 ;src/main.c:11: cpct_setPalette(g_palette, 4);
   02DF 21 52 05      [10]   65 	ld	hl,#_g_palette
   02E2 01 04 00      [10]   66 	ld	bc,#0x0004
   02E5 C5            [11]   67 	push	bc
   02E6 E5            [11]   68 	push	hl
   02E7 CD 3C 06      [17]   69 	call	_cpct_setPalette
                             70 ;src/main.c:12: cpct_setBorder (g_palette[3]);
   02EA 3A 55 05      [13]   71 	ld	a, (#_g_palette + 3)
   02ED 57            [ 4]   72 	ld	d,a
   02EE 1E 10         [ 7]   73 	ld	e,#0x10
   02F0 D5            [11]   74 	push	de
   02F1 CD C9 06      [17]   75 	call	_cpct_setPALColour
                             76 ;src/main.c:14: cpct_setVideoMode(1);
   02F4 3E 01         [ 7]   77 	ld	a,#0x01
   02F6 F5            [11]   78 	push	af
   02F7 33            [ 6]   79 	inc	sp
   02F8 CD 3C 07      [17]   80 	call	_cpct_setVideoMode
   02FB 33            [ 6]   81 	inc	sp
   02FC C9            [10]   82 	ret
                             83 ;src/main.c:17: void main(void) {
                             84 ;	---------------------------------
                             85 ; Function main
                             86 ; ---------------------------------
   02FD                      87 _main::
                             88 ;src/main.c:19: init();         
   02FD CD D1 02      [17]   89 	call	_init
                             90 ;src/main.c:21: while (1){
   0300                      91 00102$:
                             92 ;src/main.c:22: game();
   0300 CD A3 02      [17]   93 	call	_game
   0303 18 FB         [12]   94 	jr	00102$
                             95 	.area _CODE
                             96 	.area _INITIALIZER
                             97 	.area _CABS (ABS)
