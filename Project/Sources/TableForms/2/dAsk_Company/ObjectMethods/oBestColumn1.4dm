If (False:C215)
	//object Name: [COMPANIES]dAsk_Company.oBestColumn1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2013 17:20
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_Company.oBestColumn1"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_Company.oBestColumn1"; $_t_oldMethodName)