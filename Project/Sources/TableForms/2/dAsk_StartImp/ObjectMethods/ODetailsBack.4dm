If (False:C215)
	//object Name: [COMPANIES]dAsk_StartImp.ODetailsBack
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_StartImp.ODetailsBack"; Form event code:C388)
FORM GOTO PAGE:C247(FORM Get current page:C276-1)
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_StartImp.ODetailsBack"; $_t_oldMethodName)