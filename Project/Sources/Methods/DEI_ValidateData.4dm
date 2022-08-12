//%attributes = {}
If (False:C215)
	//Project Method Name:      DEI_ValidateData
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
	C_POINTER:C301($_ptr_Table; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DEI_ValidateData")

If (Count parameters:C259>0) & (Not:C34(Is nil pointer:C315($1)))
	
	$_ptr_Table:=$1
	
	DEI_ReportConflict4Table($_ptr_Table; 1)
	
End if 
ERR_MethodTrackerReturn("DEI_ValidateData"; $_t_oldMethodName)