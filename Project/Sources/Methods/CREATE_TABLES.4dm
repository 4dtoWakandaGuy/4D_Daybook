//%attributes = {}
If (False:C215)
	//Project Method Name:      CREATE_TABLES
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/03/2013 10:51
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

$_t_oldMethodName:=ERR_MethodTracker("CREATE_TABLES")
ERR_MethodTrackerReturn("CREATE_TABLES"; $_t_oldMethodName)