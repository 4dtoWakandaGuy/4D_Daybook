//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ReIndexSubtable
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 13:54:01If (False)// ----------------------------------------------------
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

$_t_oldMethodName:=ERR_MethodTracker("DB_ReIndexSubtable")
ERR_MethodTrackerReturn("DB_ReIndexSubtable"; $_t_oldMethodName)