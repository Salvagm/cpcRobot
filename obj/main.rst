                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.5.0 #9253 (Sep 26 2015) (Linux)
                              4 ; This file was generated Fri Oct  2 22:50:00 2015
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
   022D                      55 _init::
                             56 ;src/main.c:8: cpct_disableFirmware();
   022D CD 33 04      [17]   57 	call	_cpct_disableFirmware
                             58 ;src/main.c:10: cpct_fw2hw     (g_palette, 4);
   0230 11 65 02      [10]   59 	ld	de,#_g_palette
   0233 3E 04         [ 7]   60 	ld	a,#0x04
   0235 F5            [11]   61 	push	af
   0236 33            [ 6]   62 	inc	sp
   0237 D5            [11]   63 	push	de
   0238 CD 8F 03      [17]   64 	call	_cpct_fw2hw
   023B F1            [10]   65 	pop	af
   023C 33            [ 6]   66 	inc	sp
                             67 ;src/main.c:11: cpct_setPalette(g_palette, 4);
   023D 11 65 02      [10]   68 	ld	de,#_g_palette
   0240 3E 04         [ 7]   69 	ld	a,#0x04
   0242 F5            [11]   70 	push	af
   0243 33            [ 6]   71 	inc	sp
   0244 D5            [11]   72 	push	de
   0245 CD E9 02      [17]   73 	call	_cpct_setPalette
   0248 F1            [10]   74 	pop	af
   0249 33            [ 6]   75 	inc	sp
                             76 ;src/main.c:12: cpct_setBorder (g_palette[3]);
   024A 3A 68 02      [13]   77 	ld	a, (#_g_palette + 3)
   024D 57            [ 4]   78 	ld	d,a
   024E 1E 10         [ 7]   79 	ld	e,#0x10
   0250 D5            [11]   80 	push	de
   0251 CD 83 03      [17]   81 	call	_cpct_setPALColour
                             82 ;src/main.c:14: cpct_setVideoMode(1);
   0254 3E 01         [ 7]   83 	ld	a,#0x01
   0256 F5            [11]   84 	push	af
   0257 33            [ 6]   85 	inc	sp
   0258 CD FD 03      [17]   86 	call	_cpct_setVideoMode
   025B 33            [ 6]   87 	inc	sp
   025C C9            [10]   88 	ret
                             89 ;src/main.c:17: void main(void) {
                             90 ;	---------------------------------
                             91 ; Function main
                             92 ; ---------------------------------
   025D                      93 _main::
                             94 ;src/main.c:19: init();         
   025D CD 2D 02      [17]   95 	call	_init
                             96 ;src/main.c:21: while (1){
   0260                      97 00102$:
                             98 ;src/main.c:22: game();
   0260 CD E7 01      [17]   99 	call	_game
   0263 18 FB         [12]  100 	jr	00102$
                            101 	.area _CODE
                            102 	.area _INITIALIZER
                            103 	.area _CABS (ABS)
