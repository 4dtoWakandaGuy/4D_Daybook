If (False:C215)
	//object Name: [CURRENT_STOCK]CurrentStock_In.Column1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/07/2011 16:09
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CURRENT_STOCK].CurrentStock_In.Column1"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [CURRENT_STOCK].CurrentStock_In.Column1"; $_t_oldMethodName)