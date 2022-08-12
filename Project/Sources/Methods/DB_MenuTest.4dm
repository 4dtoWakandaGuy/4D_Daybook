//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MenuTest
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2013 15:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_Parameter; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_MenuTest")

If (Count parameters:C259>=1)
	
	$_t_Parameter:=$1
	ALERT:C41($_t_Parameter)
End if 
ERR_MethodTrackerReturn("DB_MenuTest"; $_t_oldMethodName)