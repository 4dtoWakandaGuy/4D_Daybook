//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_PVProjectionSetSort
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("SP_PVProjectionSetSort")

// todo: I'm not sure if all this sorting is necesssary - should be handled automatically by the listbox. Maybe when the forsm is first loaded ... pb

SP_PVProjectionSetEntry
ERR_MethodTrackerReturn("SP_PVProjectionSetSort"; $_t_oldMethodName)