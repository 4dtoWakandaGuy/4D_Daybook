//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ItemsLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/04/2012 11:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(STK_al_ModifiedLineIDS;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; STK_bo_LineTrackerActive)
	C_LONGINT:C283($_l_ModifiedLineRow)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ItemsLPA")
DB_bo_RecordModified:=True:C214
If (STK_bo_LineTrackerActive)
	$_l_ModifiedLineRow:=Find in array:C230(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
	If ($_l_ModifiedLineRow<0)
		APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
	End if 
End if 
ERR_MethodTrackerReturn("Gen_ItemsLPA"; $_t_oldMethodName)