#include <cpctelera.h>
#include "sprites/sprites.h"
#include "game.h"


void init(){
   // Deshabilitamos el firmware para no colisionar con ciertas rutinas de la cpcTelera  
   cpct_disableFirmware();
   // Establecemos la paleta y el borde
   cpct_fw2hw     (g_palette, 4);
   cpct_setPalette(g_palette, 4);
   cpct_setBorder (g_palette[3]);
   // Usamos el modo de video 1
   cpct_setVideoMode(1);
}

void main(void) {

   init();         

   while (1){
      game();
   }
}
