//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_Dedup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/11/2010 09:39
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

$_t_oldMethodName:=ERR_MethodTracker("Comp_Dedup")

//Replaced by

DBI_MenuDisplayRecords("CompaniesDedup")
ERR_MethodTrackerReturn("Comp_Dedup"; $_t_oldMethodName)