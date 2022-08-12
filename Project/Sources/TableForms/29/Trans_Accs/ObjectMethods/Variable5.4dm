If (False:C215)
	//object Name: [TRANSACTIONS]Trans_Accs.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vAccName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS].Trans_Accs.Variable5"; Form event code:C388)
RELATE ONE:C42([TRANSACTIONS:29]Account_Code:3)
vAccName:=[ACCOUNTS:32]Account_Name:3
ERR_MethodTrackerReturn("OBJ [TRANSACTIONS].Trans_Accs.Variable5"; $_t_oldMethodName)