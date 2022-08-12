//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_4DWriteError
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/12/2009 11:29`Method: DB_4DWriteError
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>EditDocument)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_4DWriteError")
Case of 
	: (error=-1)
		<>EditDocument:=True:C214
End case 
ERR_MethodTrackerReturn("DB_4DWriteError"; $_t_oldMethodName)