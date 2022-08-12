//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_GPDi
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 10:08
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

$_t_oldMethodName:=ERR_MethodTracker("Letters_GPDi")
Menu_Record("Letters_GPDi"; "Add Product Items")
Letters_GP
ERR_MethodTrackerReturn("Letters_GPDi"; $_t_oldMethodName)