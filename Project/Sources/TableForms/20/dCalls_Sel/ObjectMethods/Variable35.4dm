If (False:C215)
	//object Name: [SERVICE_CALLS]dCalls_Sel.Variable35
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vProdCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].dCalls_Sel.Variable35"; Form event code:C388)
If (cNAL=0)
	Check_ProductNC(->vProdCode; "")
End if 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].dCalls_Sel.Variable35"; $_t_oldMethodName)
