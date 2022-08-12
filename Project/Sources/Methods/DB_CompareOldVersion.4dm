//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_CompareOldVersion
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/05/2012 15:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_CompareOldVersion")
$0:=""
ERR_MethodTrackerReturn("DB_CompareOldVersion"; $_t_oldMethodName)