//%attributes = {}
If (False:C215)
	//Project Method Name:      ZTransB_Rev
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/11/2010 15:06
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

$_t_oldMethodName:=ERR_MethodTracker("ZTransB_Rev")
DBI_MenuDisplayRecords("Trans inREVERSE")
ERR_MethodTrackerReturn("ZTransB_Rev"; $_t_oldMethodName)