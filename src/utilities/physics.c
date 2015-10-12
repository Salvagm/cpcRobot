#include "physics.h"
#include "../entities/entities.h"


///////////////////////////
/// PARTE "PRIVADA"
/////////////////////////

#ifndef SYMBOL

#define MID_HSCREEN 100
#define MID_VSCREEN 40 

const TCollider *BLstaticColliders[5] = {0,0,0,0,0};
const TCollider *BRstaticColliders[5] = {0,0,0,0,0};
const TCollider *TLstaticColliders[5] = {0,0,0,0,0};
const TCollider *TRstaticColliders[5] = {0,0,0,0,0};

u8 botLeftIndex = 0;
u8 topLeftIndex = 0;
u8 botRighttIndex = 0;
u8 topRightIndex = 0;

//////////////////
/// PRIVATE 
////////////////

TCollider* getCollisionedCollider(TCollider* vCollider[] , TCollider* entCollider, u8 vColliderSize)
{
	i8 	blockTopY,		// choque entre parte de arriba de la entidad y parte de abajo del bloque
		blockBotY,		// choque entre parte de abajo de la entidad y parte de arriba del bloque
		blockLeftX,		// choque entre parte izquierda de la entidad con parte derecha de bloque
		blockRightX;	// choque entre parte derecha de la entidad con parte izquierda de bloque
	u8 index = vColliderSize;
	u8 collisions = 0;
	i8 entTopY = entCollider->y;
	i8 entBotY = entCollider->y + entCollider->h;
	i8 entLefX = entCollider->x;
	i8 entRightX = entCollider->x + entCollider->w;
	TCollider* collisionedColliders[2] = {0,0};

	while(index)
	{
		blockLeftX = entRightX - vCollider[index]->x ; // X_1 + W_1 - X_2 > 0
		blockRightX = vCollider[index]->x - vCollider[index]->w - entLefX; // X_2 + W_2 - X_1 > 0
		blockBotY = vCollider[index]->y + vCollider[index]->h - entTopY; // Y_2 + H_2 - Y_1 > 0
		blockTopY = entBotY - vCollider[index]->y ; // Y_1 + H_1 - Y_2 > 0

		if(blockLeftX && blockRightX && blockBotY && blockTopY)
		{
			collisionedColliders[collisions] = vCollider[index];
			++collisions;
		}

		--index;
	}
	return collisionedColliders;
}


void insertInCollisionArray(TCollider *col, u8 pointX, u8 pointY)
{
	if(pointY < MID_HSCREEN)
	{
		if(pointX < MID_VSCREEN)
		{
			BLstaticColliders[botLeftIndex] = col;	
			++botLeftIndex;
		}
		else	
		{
			BRstaticColliders[botRighttIndex] = col;
			++botRighttIndex;
		}
	}
	else
	{
		if(pointX < MID_VSCREEN)
		{
			TLstaticColliders[topLeftIndex] = col;	
			++topLeftIndex;
		}
		else	
		{
			TRstaticColliders[topRightIndex] = col;	
			++topRightIndex;
		}
	}
}

//////////////////
/// PUBLIC
/////////////////

void addStaticCollider(TCollider* col)
{
	insertInCollisionArray(col, col->x, col->y);
	insertInCollisionArray(col, col->x+col->w, col->y);
	insertInCollisionArray(col, col->x, col->y+col->h);
	insertInCollisionArray(col, col->x+col->w, col->y+col->h);	
}

TCollider* checkWorldCollision(TCollider* entCollider)
{
	TCollider *collision = 0;
	
	getCollisionedCollider(TLstaticColliders,entCollider,topLeftIndex);
		

	return collision;
}

void resetIndex()
{
	botLeftIndex = 0;
	topLeftIndex = 0;
	botRighttIndex = 0;
	topRightIndex = 0;
}




#endif
