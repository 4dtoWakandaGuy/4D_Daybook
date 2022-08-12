If (False:C215)
	//object Name: [DIARY]Diary_In.Field50
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_In.Field50"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Getting Focus:K2:7)
		If (FORM Get current page:C276#1)
			//FORM GOTO PAGE(1)
			GOTO OBJECT:C206([DIARY:12]Action_Details:10)
			
		End if 
		DIARY_in_SetObjectPositions(1; "Action")
		
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_In.Field50"; $_t_oldMethodName)
