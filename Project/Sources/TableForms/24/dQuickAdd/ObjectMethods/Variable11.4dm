If (False:C215)
	//object Name: [ORDERS]dQuickAdd.Variable11
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:29
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dQuickAdd.Variable11"; Form event code:C388)
QuickAdd_UpLine
ERR_MethodTrackerReturn("OBJ [ORDERS].dQuickAdd.Variable11"; $_t_oldMethodName)
