#include <cpctelera.h>
#include "sprites/sprites.h"
#include "game.h"

#define INIT_VMEM (u8*)0xC000

/** TODO PASAR ESTOS ATRIBUTOS A ENTIDADES **/

u8  alive;
u8  x, y;      // Sprite coordinates (in bytes)                     

/** FIN TODO ENTIDADES **/

/** PARTE PRIVADA **/

u8* pvideomem;    // Inicio memoria de video
void initializeGameScreen ();
void updateUser           ();

/** FIN PARTE PRIVADA **/


void initializeGameScreen() {
   //Pintamos el fondo de color solido
   cpct_drawSolidBox(INIT_VMEM, cpct_px2byteM1(1, 1, 1, 1), 64, 200);
   cpct_drawSolidBox(INIT_VMEM + 64, cpct_px2byteM1(1, 1, 1, 1), 16, 200);
}

void updateUser() {

   //Comprobamos si se pulsa alguna tecla y movemos al personaje principal
   cpct_scanKeyboard_f();
   if      (cpct_isKeyPressed(Key_CursorRight) && x <  80 - SPR_W) { x++; pvideomem++; }
   else if (cpct_isKeyPressed(Key_CursorLeft)  && x >   0        ) { x--; pvideomem--; }
   if      (cpct_isKeyPressed(Key_CursorUp)    && y >   0        ) { 
      y = y-3;
      pvideomem = cpct_getScreenPtr(INIT_VMEM, x, y); 
   }
   else if (cpct_isKeyPressed(Key_CursorDown)  && y < 197 - SPR_H) { 
      y = y+3;
      pvideomem = cpct_getScreenPtr(INIT_VMEM, x, y); 
   }
}
void drawAll(){
   
   cpct_drawSpriteMasked(g_character, pvideomem, SPR_W, SPR_H);
}

void game() {
   
   alive = 1;
   x=0, y=0;
   pvideomem = INIT_VMEM; 

   initializeGameScreen();   // Set up Game Screen

   /////
   // Main Game Loop (while character is alive)
   /////
   while(alive) {
      cpct_waitVSYNC();            
      //Limpiamos la posicion del personaje 
      cpct_drawSolidBox(pvideomem, cpct_px2byteM1(1, 1, 1, 1), SPR_W, SPR_H);
      updateUser();                
      drawAll();                   
   }
}
