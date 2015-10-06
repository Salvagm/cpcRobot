#include <cpctelera.h>
#include "sprites/sprites.h"
#include "game.h"
#include "entities/entities.h"


/** TODO PASAR ESTOS ATRIBUTOS A ENTIDADES **/

TCharacter *player;

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

   u8  *x, *y;
   x = &(player->pe.de.e.c.x);
   y = &(player->pe.de.e.c.y);
   player->pe.de.e.pscreen = player->pe.de.npscreen;
   //Comprobamos si se pulsa alguna tecla y movemos al personaje principal
   cpct_scanKeyboard_f();
   if      (cpct_isKeyPressed(Key_CursorRight) && (*x) <  80 - SPR_W) { 
      player->pe.de.npscreen = cpct_getScreenPtr(INIT_VMEM,++(*x),*y);
   }
   else if (cpct_isKeyPressed(Key_CursorLeft)  && (*x) >   0        ) {
      player->pe.de.npscreen = cpct_getScreenPtr(INIT_VMEM,--(*x),*y);
   }
   if      (cpct_isKeyPressed(Key_CursorUp)    && *y >   0        ) { 
      *y = (*y)-3;
      player->pe.de.npscreen = cpct_getScreenPtr(INIT_VMEM, *x, *y); 
   }
   else if (cpct_isKeyPressed(Key_CursorDown)  && *y < 197 - SPR_H) { 
      *y = (*y)+3;
      player->pe.de.npscreen = cpct_getScreenPtr(INIT_VMEM, *x, *y); 
   }

}
void drawAll(){
   cpct_drawSolidBox(player->pe.de.e.pscreen, cpct_px2byteM1(1, 1, 1, 1), SPR_W, SPR_H);
   cpct_drawSpriteMasked(player->pe.de.e.sprite, player->pe.de.npscreen, SPR_W, SPR_H);
}

void game() {
   
   player = getPlayer();
   // character.lifes = 1;   
   // character.pe->de->e->c->x = 0;
   // character.pe->de->e->c->y = 0;
   // character.pe.de.e.sprite = g_character[0];
   
   pvideomem = INIT_VMEM; 

   initializeGameScreen();   // Set up Game Screen

   /////
   // Main Game Loop (while character is alive)
   /////
   while(player->lifes > 0) {      
      cpct_waitVSYNC();            
      //Limpiamos la posicion del personaje 
      updateUser();                
      drawAll();                   
   }
}
