//%attributes = {}
If (False:C215)
	//Project Method Name:      ZJobPers_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2010 05:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($3)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZJobPers_Mod")
DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[JOB PERSONNEL:48])))
ERR_MethodTrackerReturn("ZJobPers_Mod"; $_t_oldMethodName)