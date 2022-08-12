
If (False:C215)
	//Object Name:      [WORKFLOW_Campaign].Campaign_Entry.oActiveDays5
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
	C_BOOLEAN:C305(WF_bo_ActiveFriday)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [WORKFLOW_Campaign]Campaign_Entry.oActiveDays5"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		If (Length:C16([WORKFLOW_Campaign:209]DaysActive:8)<7)
			[WORKFLOW_Campaign:209]DaysActive:8:=[WORKFLOW_Campaign:209]DaysActive:8+(" "*(7-Length:C16([WORKFLOW_Campaign:209]DaysActive:8)))
		End if 
		[WORKFLOW_Campaign:209]DaysActive:8[[5]]:=String:C10(Num:C11(WF_bo_ActiveFriday))
End case 
ERR_MethodTrackerReturn("OBJ [WORKFLOW_Campaign]Campaign_Entry.oActiveDays5"; $_t_oldMethodName)
