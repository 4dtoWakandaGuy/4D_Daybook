//%attributes = {}
If (False:C215)
	//Project Method Name:      ZVAT_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2009 17:12`Method: ZVAT_Mod
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

$_t_oldMethodName:=ERR_MethodTracker("ZVAT_Mod")
DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[TAX_CODES:35])))
ERR_MethodTrackerReturn("ZVAT_Mod"; $_t_oldMethodName)
