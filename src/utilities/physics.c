#include "physics.h"
#include "../entities/entities.h"


///////////////////////////
/// PARTE "PRIVADA"
/////////////////////////

#ifndef SYMBOL

#define MID_HSCREEN 100
#define MID_VSCREEN 40 

const TCollider *BLstaticColliders[5];
const TCollider *BRstaticColliders[5];
const TCollider *TLstaticColliders[5];
const TCollider *TRstaticColliders[5];

u8 botLeftIndex = 0;
u8 topLeftIndex = 0;
u8 botRighttIndex = 0;
u8 topRightIndex = 0;

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

void addStaticCollider(TCollider *col)
{

	insertInCollisionArray(col, col->x, col->y);
	insertInCollisionArray(col, col->x+col->w, col->y);
	insertInCollisionArray(col, col->x, col->y+col->h);
	insertInCollisionArray(col, col->x+col->w, col->y+col->h);	
}






void resetIndex()
{
	botLeftIndex = 0;
	topLeftIndex = 0;
	botRighttIndex = 0;
	topRightIndex = 0;
}


//////////////////
/// PRIVATE 
////////////////

#endif
// TCollider createMapCollider(u8 x, u8 y, u8 width, u8 height)
// {

// }
