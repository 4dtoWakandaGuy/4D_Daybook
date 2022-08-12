If (False:C215)
	//object Name: [DIARY]Diary_In.Field56
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_In.Field56"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Getting Focus:K2:7)
		If (FORM Get current page:C276#2)
			//FORM GOTO PAGE(2)
			GOTO OBJECT:C206([DIARY:12]Result_Description:12)
			//DIARY_in_SetObjectPositions (2)
		End if 
		DIARY_in_SetObjectPositions(1; "Result")
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_In.Field56"; $_t_oldMethodName)
