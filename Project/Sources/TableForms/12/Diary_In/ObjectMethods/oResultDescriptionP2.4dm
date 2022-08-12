
If (False:C215)
	//Object Name:      [DIARY].Diary_In.oResultDescriptionP2
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/01/2020
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
$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY]Diary_In.oResultDescriptionP2"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		DIARY_in_SetObjectPositions(2; "Result")
End case 
ERR_MethodTrackerReturn("OBJ [DIARY]Diary_In.oResultDescriptionP2"; $_t_oldMethodName)
