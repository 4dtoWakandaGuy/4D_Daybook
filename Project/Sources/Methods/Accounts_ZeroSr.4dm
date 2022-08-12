//%attributes = {}
If (False:C215)
	//Project Method Name:      Accounts_ZeroSr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ch5)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Accounts_ZeroSr")
If (ch5=1)
	QUERY SELECTION BY FORMULA:C207([ACCOUNTS:32]; Accounts_ZeroS2)
End if 
ERR_MethodTrackerReturn("Accounts_ZeroSr"; $_t_oldMethodName)
