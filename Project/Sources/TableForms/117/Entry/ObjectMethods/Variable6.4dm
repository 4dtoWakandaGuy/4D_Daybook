If (False:C215)
	//object Name: [EW_ExportProjects]Entry.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.Variable6"; Form event code:C388)
CONFIRM:C162("Has the cause of the error been rectified?"; "Yes"; "No")
If (OK=1)
	[EW_ExportProjects:117]ErrorMessage:17:=""
	[EW_ExportProjects:117]FatalError:26:=False:C215
	//  ALERT("Please check the next scheduled run date and time.")
	Gen_Alert("Please check the next scheduled run date and time.")
End if 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.Variable6"; $_t_oldMethodName)
