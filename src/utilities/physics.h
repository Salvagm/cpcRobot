#ifndef _PHYSICS_H_
#define _PHYSICS_H_

#include <types.h>
#include "../entities/entities.h"


void addStaticCollider(TCollider*);

/**
 * Funcion para comprobar la colision entre entidad y mundo estatico
 * [Param]	- {TCollider} - Collider del objeto dinamico que esta colisionando con el mundo
 * [return] - Devuelve el objeto con el que esta colisionando
 * 
 */
TCollider* checkWorldCollision(TCollider*);

// TCollider createMapCollider(u8 x, u8 y, u8 width, u8 height);
//u8 checkCollision(Tentity*);


#endif