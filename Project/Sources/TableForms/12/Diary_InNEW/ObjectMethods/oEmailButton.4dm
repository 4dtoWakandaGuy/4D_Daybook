If (False:C215)
	//object Name: [DIARY]Diary_InNEW.oEmailButton
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
	C_BOOLEAN:C305(SD_bo_AddingDiaryRecord; EMAIL_bo_DonotChangeSubject)
	C_DATE:C307(SD_D_CurrentviewDate)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InNEW.oEmailButton"; Form event code:C388)
//EMAIL_bo_DonotChangeSubject:=True  `BSW 06/08/02
EMAIL_bo_DonotChangeSubject:=False:C215  //kmw 24/09/08 - changed to false...why was this ever true???? (it's not the only place that illogically sets it to true...daybook seems to set this true whereever user is MANUALLY generating an email (as opposed to print super report generated one)...its like it does the opposite from what you would expect......has the meaning of this var been REVERSED at some point??)
//TRACE
If (Not:C34(SD_bo_AddingDiaryRecord))
	If ([DIARY:12]Diary_Code:3#"")
		//READ WRITE([DIARY])`removed kmw 29/09/08 (this was legacy code from when this called via diary schedule that we no longer need or want (we KNOW the record is already loaded...and loading it again gets rid of any changes the user may have made)
		//LOAD RECORD([DIARY])`removed kmw 29/09/08 (this was legacy code from when this called via diary schedule that we no longer need or want (we KNOW the record is already loaded...and loading it again gets rid of any changes the user may have made)
		
		[DIARY:12]Done:14:=False:C215
		SD_SetVisible(True:C214)
		SD_SetFieldsTrue
	Else 
		SD_AutoAddRec(""; SD_D_CurrentviewDate; ?00:00:00?)
	End if 
	
End if 

Case of 
	: ([DIARY:12]Document_Code:15="SMS")  // 12/6/02 pb
		//   ALERT("This Diary Item is an SMS message, not an Email.")
		Gen_Alert("This Diary Item is an SMS message, not an Email.")
		
	: ([DIARY:12]Document_Code:15#"")
		Diary_LetSee
	Else 
		SET TIMER:C645(0)
		Diary_EmailNew
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InNEW.oEmailButton"; $_t_oldMethodName)
