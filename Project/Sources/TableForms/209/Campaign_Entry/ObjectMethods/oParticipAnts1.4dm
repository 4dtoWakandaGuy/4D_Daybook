
If (False:C215)
	//Object Name:      [WORKFLOW_Campaign].Campaign_Entry.oParticipAnts1
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(WF_BO_MODIFIED)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [WORKFLOW_Campaign]Campaign_Entry.oParticipAnts1"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		WF_BO_MODIFIED:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ [WORKFLOW_Campaign]Campaign_Entry.oParticipAnts1"; $_t_oldMethodName)
