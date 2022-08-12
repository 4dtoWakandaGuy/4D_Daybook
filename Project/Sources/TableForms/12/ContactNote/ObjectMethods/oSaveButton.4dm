If (False:C215)
	//object Name: [DIARY]ContactNote.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/11/2012 16:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; SD2_t_NoteDetails)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].ContactNote.Variable4"; Form event code:C388)
If ([DIARY:12]Action_Code:9#"")
	If (SD2_t_NoteDetails#"")
		If ([DIARY:12]Result_Code:11="")
			ALERT:C41("You must set the result code for this Diary note")
		Else 
			[DIARY:12]Done:14:=True:C214
			[DIARY:12]Result_Description:12:=SD2_t_NoteDetails
			ACCEPT:C269
		End if 
	Else 
		CANCEL:C270
		
	End if 
Else 
	Gen_Alert("Sorry you must set a note type to save this record")
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].ContactNote.Variable4"; $_t_oldMethodName)
