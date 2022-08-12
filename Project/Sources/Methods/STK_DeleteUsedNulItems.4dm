//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_DeleteUsedNulItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/04/2012 15:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(STK_al_DeleteItems;0)
	C_BOOLEAN:C305($1; STK_bo_RestReady; STK_bo_RestReadytoreceive)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_DeleteUsedNulItems")

STK_bo_RestReady:=False:C215
STK_bo_RestReadytoreceive:=$1
ARRAY LONGINT:C221(STK_al_DeleteItems; 0)
STK_bo_RestReadytoreceive:=True:C214
While (STK_bo_RestReady=False:C215)
	DelayTicks(2)
End while 
DelayTicks(30*60)

//TRACE
READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]x_ID:16; STK_al_DeleteItems)
DELETE SELECTION:C66([STOCK_MOVEMENT_ITEMS:27])

UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
ERR_MethodTrackerReturn("STK_DeleteUsedNulItems"; $_t_oldMethodName)
