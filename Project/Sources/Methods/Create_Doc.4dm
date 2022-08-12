//%attributes = {}
If (False:C215)
	//Project Method Name:      Create_Doc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
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

$_t_oldMethodName:=ERR_MethodTracker("Create_Doc")
//Create_Doc
SET CHANNEL:C77(12; "")
ERR_MethodTrackerReturn("Create_Doc"; $_t_oldMethodName)