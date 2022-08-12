//%attributes = {}
If (False:C215)
	//Project Method Name:      DEI_DeleteConflicts
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DEI_DeleteConflicts")
CONFIRM:C162("Deleting duplicating values from unique fields can take a long time."+" Are you sure you want to continue?")
If (OK=1)
	CONFIRM:C162("Have you backed up the data file?"; "Yes"; "No")
	If (OK=1)
		DEI_ReportConflicts(2)
	Else 
		ALERT:C41("Please back up the data file.")
	End if 
End if 
ERR_MethodTrackerReturn("DEI_DeleteConflicts"; $_t_oldMethodName)