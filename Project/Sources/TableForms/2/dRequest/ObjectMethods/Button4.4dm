If (False:C215)
	//object Name: [COMPANIES]dRequest.Button4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(Gen_l_amount)
	C_REAL:C285(Gen_R_amount)
	C_TEXT:C284($_t_oldMethodName; Vt)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dRequest.Button4"; Form event code:C388)

If (Vt="") & (Gen_R_amount=0) & (Gen_l_amount=0)
	//Gen_Alert ("You may only continue by entering a value")
	ACCEPT:C269
	
Else 
	ACCEPT:C269
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dRequest.Button4"; $_t_oldMethodName)
