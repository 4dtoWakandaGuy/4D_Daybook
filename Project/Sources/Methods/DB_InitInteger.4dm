//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_InitInteger
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/10/2009 23:01
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

$_t_oldMethodName:=ERR_MethodTracker("DB_InitInteger")
ERR_MethodTrackerReturn("DB_InitInteger"; $_t_oldMethodName)