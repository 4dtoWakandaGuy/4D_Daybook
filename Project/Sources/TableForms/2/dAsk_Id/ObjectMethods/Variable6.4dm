If (False:C215)
	//object Name: [COMPANIES]dAsk_Id.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(GEN_bo_NoVerifyUser)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_Id.Variable6"; Form event code:C388)
If (GEN_bo_NoVerifyUser)
	ACCEPT:C269
Else 
	Ask_PersonOK
End if 
ERR_MethodTrackerReturn("OBJ:dAsk_Id,xOK"; $_t_oldMethodName)
