
If (False:C215)
	//Object Name:      [ACTIONS].Action_In.Variable47
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  04/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS]Action_In.oUseActionLevelFieldStriptsCB"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS]Action_In.oUseActionLevelFieldStriptsCB"; $_t_oldMethodName)
