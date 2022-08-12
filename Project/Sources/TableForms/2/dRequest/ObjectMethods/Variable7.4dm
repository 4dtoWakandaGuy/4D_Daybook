If (False:C215)
	//object Name: [COMPANIES]dRequest.Variable7
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
	C_REAL:C285(GEN_R_Amount)
	C_TEXT:C284($_t_oldMethodName; VT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dRequest.Variable7"; Form event code:C388)

VT:=""
GEN_R_Amount:=0
GEN_R_Amount:=0
ERR_MethodTrackerReturn("OBJ [COMPANIES].dRequest.Variable7"; $_t_oldMethodName)