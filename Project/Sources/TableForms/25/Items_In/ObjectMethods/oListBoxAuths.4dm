If (False:C215)
	//object Name: [ORDER_ITEMS]Items_in.oListBoxAuths
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/12/2013 16:38
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
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS]Items_in.oListBoxAuths"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ Items_in.oListBoxAuths"; $_t_oldMethodName)