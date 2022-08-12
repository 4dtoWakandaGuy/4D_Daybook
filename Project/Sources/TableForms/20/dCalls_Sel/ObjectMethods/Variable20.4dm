If (False:C215)
	//object Name: [SERVICE_CALLS]dCalls_Sel.Variable20
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
	C_TEXT:C284($_t_oldMethodName; vCompCode)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].dCalls_Sel.Variable20"; Form event code:C388)
Sel_LPCompCode(->vCompCode; ->[SERVICE_CALLS:20])
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].dCalls_Sel.Variable20"; $_t_oldMethodName)