If (False:C215)
	//object Name: [DIARY]Diary_InNEW.oLetterButton
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
	C_BOOLEAN:C305(SD_bo_AddingDiaryRecord)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InNEW.oLetterButton"; Form event code:C388)
If (Not:C34(SD_bo_AddingDiaryRecord))
	//READ WRITE([DIARY])`removed kmw 29/09/08 (this was legacy code from when this called via diary schedule that we no longer need or want (we KNOW the record is already loaded...and loading it again gets rid of any changes the user may have made)
	//LOAD RECORD([DIARY])`removed kmw 29/09/08 (this was legacy code from when this called via diary schedule that we no longer need or want (we KNOW the record is already loaded...and loading it again gets rid of any changes the user may have made)
	
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
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InNEW.oLetterButton"; $_t_oldMethodName)
