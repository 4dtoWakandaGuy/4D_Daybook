//%attributes = {}
If (False:C215)
	//Project Method Name:      TransB_Nom
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/11/2010 14:59
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

$_t_oldMethodName:=ERR_MethodTracker("TransB_Nom")

DBI_MenuDisplayRecords("TRANS INPOST")
ERR_MethodTrackerReturn("TransB_Nom"; $_t_oldMethodName)