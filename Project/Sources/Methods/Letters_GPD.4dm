//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_GPD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 04:45
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

$_t_oldMethodName:=ERR_MethodTracker("Letters_GPD")
Menu_Record("Letters_GPD"; "Add Product Items")
Letters_GP

CREATE SET:C116([DOCUMENTS:7]; "Master")
ERR_MethodTrackerReturn("Letters_GPD"; $_t_oldMethodName)