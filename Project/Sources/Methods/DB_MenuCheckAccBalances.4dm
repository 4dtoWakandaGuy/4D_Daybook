//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MenuCheckAccBalances
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/06/2011 16:47 v8.0.0/1
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

$_t_oldMethodName:=ERR_MethodTracker("DB_MenuCheckAccBalances")
ERR_MethodTrackerReturn("DB_MenuCheckAccBalances"; $_t_oldMethodName)