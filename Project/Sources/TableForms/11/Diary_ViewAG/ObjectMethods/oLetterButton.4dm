If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.oLetterButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SD_bo_AddingDiaryRecord)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.oLetterButton"; Form event code:C388)
If (Not:C34(SD_bo_AddingDiaryRecord))
	READ WRITE:C146([DIARY:12])
	LOAD RECORD:C52([DIARY:12])
	[DIARY:12]Done:14:=False:C215
	SD_SetVisible(True:C214)
	SD_SetFieldsTrue
End if 

Case of 
	: ([DIARY:12]Document_Code:15="SMS")  // 12/6/02 pb
		//   ALERT("This Diary Item is an SMS message, not an Email.")
		Gen_Alert("This Diary Item is an SMS message, not an Email.")
		
	: ([DIARY:12]Document_Code:15#"")
		Diary_LetSee
	Else 
		//  If ([DIARY]Diary Code="")  ` 29/05/02 pb
		//   ALERT("Please select or create a Diary entry first.")
		// Else
		// Moved it to Diary_LetNew PB
		Diary_LetNew
		
		// End if
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.oLetterButton"; $_t_oldMethodName)
