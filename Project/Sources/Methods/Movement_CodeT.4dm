//%attributes = {}
If (False:C215)
	//Project Method Name:      Movement_CodeT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/04/2010 13:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(STK_bo_TempCodeinited)
	C_LONGINT:C283(GEN_l_TempCode)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movement_CodeT")
If (Not:C34(STK_bo_TempCodeinited))
	GEN_l_TempCode:=0
	GEN_l_TempCode:=AA_GetNextID(->GEN_l_TempCode)
Else 
	GEN_l_TempCode:=GEN_l_TempCode+100
End if 
[STOCK_MOVEMENTS:40]Movement_Code:1:="*T"+String:C10(GEN_l_TempCode)
ERR_MethodTrackerReturn("Movement_CodeT"; $_t_oldMethodName)
