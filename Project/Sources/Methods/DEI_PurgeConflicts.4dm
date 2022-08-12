//%attributes = {}
If (False:C215)
	//Project Method Name:      DEI_PurgeConflicts
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
	C_LONGINT:C283($_l_Process)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DEI_PurgeConflicts")
CONFIRM:C162("Purging duplicate values from unique fields can take a long time."+" Are you sure you want to continue?")
If (OK=1)
	CONFIRM:C162("Have you backed up the data file?"; "Yes"; "No")
	If (OK=1)
		If (False:C215)
			
			$_l_Process:=New process:C317("DEI_ReportConflicts"; 64*1024; "Report-Purge-Unique-Conflicts"; 1; *)  //set to 64 26/03/08, kmw
			
		Else 
			DEI_ReportConflicts(1)
		End if 
	Else 
		ALERT:C41("Please back up the data file.")
	End if 
End if 
ERR_MethodTrackerReturn("DEI_PurgeConflicts"; $_t_oldMethodName)