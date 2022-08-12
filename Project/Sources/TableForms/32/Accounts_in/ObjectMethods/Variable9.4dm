If (False:C215)
	//object Name: [ACCOUNTS]Accounts_in.Variable9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/10/2012 19:46
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNTS].Accounts_in.Variable9"; Form event code:C388)

ACC_AddSubEntityLayers("Listbox")
ERR_MethodTrackerReturn("OBJ [ACCOUNTS].Accounts_in.Variable9"; $_t_oldMethodName)