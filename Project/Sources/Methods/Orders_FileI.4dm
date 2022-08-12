//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_FileI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2010 23:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(LBI_bo_RowDragged)
	C_TEXT:C284(WIN_t_CurrentInputForm; $_t_oldMethodName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_FileI")
//NG April 2004 removed reference to ◊screen
//NG April 2004 and removed reference to silver
//If (DB_GetModuleSetting(1)=5)

//Else
FORM SET INPUT:C55([ORDERS:24]; "Order_In")
WIN_t_CurrentInputForm:="Order_In"
LBI_bo_RowDragged:=False:C215
ERR_MethodTrackerReturn("Orders_FileI"; $_t_oldMethodName)
