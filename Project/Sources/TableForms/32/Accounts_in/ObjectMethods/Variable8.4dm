If (False:C215)
	//object Name: [ACCOUNTS]Accounts_in.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/10/2012 20:08
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



$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNTS].Accounts_in.Variable8"; Form event code:C388)
ACC_DelSubEntityAnalyses("Listbox")
ERR_MethodTrackerReturn("OBJ [ACCOUNTS].Accounts_in.Variable8"; $_t_oldMethodName)