//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ResetCalledOff
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/05/2012 10:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(STK_al_Reset;0)
	C_BOOLEAN:C305(<>HoldQuit; $1; STK_bo_RestReady; STK_bo_RestReadytoreceive)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ResetCalledOff")

STK_bo_RestReady:=False:C215
STK_bo_RestReadytoreceive:=$1
ARRAY LONGINT:C221(STK_al_Reset; 0)
STK_bo_RestReadytoreceive:=True:C214
While (STK_bo_RestReady=False:C215)
	DelayTicks(2)
End while 
While (<>holdQuit)
	DelayTicks(2)
End while 
<>holdQuit:=True:C214
DelayTicks(10*60)



For ($_l_Index; 1; Size of array:C274(STK_al_Reset))
	READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=STK_al_Reset{$_l_Index})
	//[stock items]xc
	DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
	DelayTicks(2)
	
End for 
<>holdQuit:=False:C215  //this is not a semaphore to prevent other methods doing the same thing at the same time-its to prevent quits while we are dong these things


UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
ERR_MethodTrackerReturn("STK_ResetCalledOff"; $_t_oldMethodName)
