If (False:C215)
	//object Name: [ACTIONS]Action_In.Variable51
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_DiaryEntryForm;0)
	C_TEXT:C284($_t_oldMethodName; SD2_t_EntryForm)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Variable51"; Form event code:C388)
If (SD2_at_DiaryEntryForm>0)
	SD2_t_EntryForm:=SD2_at_DiaryEntryForm{SD2_at_DiaryEntryForm}
	
	
End if 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Variable51"; $_t_oldMethodName)
