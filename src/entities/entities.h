#ifndef _ENTITIES_H_
#define _ENTITIES_H_

#include <types.h>


//
// Rectangulo para colisiones
//
typedef struct Collider {
	u8    x, y;    // Screen coordinates of the top-left square of the collision
	u8    w, h;    // Width and height in bytes   
} TCollider;

//
// Entidad de juego, toda entidad de juego tiene un rectangulo de colision
//
typedef struct Entity {   

	u8		 *pscreen;  // Pointer to Screen Video memory location where entity will be drawn     
	//TODO pasar a animaciones
	u8		  *sprite;
	TCollider	   *c;

} TEntity;

//
// Entidad capaz de moverse
//
typedef struct DynamicEntity {   

	TEntity 	    *e;
	u8       *npscreen;  // Pointer the next Screen Video memory location where entity will be drawn   
	u8          nx, ny;  // Next X, Y coordinates of entity in the screen (in bytes)         

} TDynEntity;

// Entidad con propiedades fisicas (velocidad, rozamiento...)

typedef struct PhysicEntity {
	TDynEntity		*de;
	i8  		 vx, vy;    // Velocidad en y e y
	u8 	   		 ax, ay;		// Aceleracion en x e y

} TPhyEntity;

// Personaje principal

typedef struct Character {
	
	TPhyEntity 	 *pe;
	u8 		   lifes;
	u8		 bullets;

} TCharacter;

#endif