//%attributes = {}
If (False:C215)
	//Project Method Name:      TransB_FileI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/09/2009 08:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(ACC_aptr_Transaction;0)
	//ARRAY POINTER(aTranIPtrs;0)
	C_BOOLEAN:C305(LBI_bo_RowDragged)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB_FileI")
If ((DB_GetModuleSettingByNUM(1))=5)
	FORM SET INPUT:C55([TRANSACTION_BATCHES:30]; "TransB_in")  //NG April 2004 Removed ◊Screen
	WIN_t_CurrentInputForm:="TransB_in"
Else 
	FORM SET INPUT:C55([TRANSACTION_BATCHES:30]; "TransB_in")  //NG April 2004 Removed ◊Screen
	WIN_t_CurrentInputForm:="TransB_in"
End if 
ARRAY POINTER:C280(ACC_aptr_Transaction; 0)
LBI_bo_RowDragged:=False:C215
ERR_MethodTrackerReturn("TransB_FileI"; $_t_oldMethodName)