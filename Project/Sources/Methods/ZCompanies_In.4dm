//%attributes = {}
If (False:C215)
	//Project Method Name:      ZCompanies_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/11/2010 21:49
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

$_t_oldMethodName:=ERR_MethodTracker("ZCompanies_In")

DB_MenuNewRecord("companies")
//ZProc ("Companies_In";◊K6;"Enter Companies")
//Copied to Functions Palette
ERR_MethodTrackerReturn("ZCompanies_In"; $_t_oldMethodName)