#include "entities.h"
#include "../sprites/sprites.h"

const TCharacter character ={
   // PhysicEntity
   {
      // DynamicEntity
      {
         // Entity
         {
            INIT_VMEM,
            g_character,
            //Collider
            {
               0,0, // x,y
               SPR_W,SPR_H // w,h
            }

         },
         INIT_VMEM,
         1,
         1

      },
      0, // vx
      0, // vy
      0, // ax
      0, //ay
   },
   1,
   3
};


TCharacter *getPlayer()
{
	return &character;
}