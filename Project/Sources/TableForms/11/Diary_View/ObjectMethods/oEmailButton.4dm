If (False:C215)
	//object Name: [PERSONNEL]Diary_View.oEmailButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(EMAIL_bo_DonotChangeSubject; SD_bo_AddingDiaryRecord)
	C_DATE:C307(SD_D_CurrentviewDate)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.oEmailButton"; Form event code:C388)
EMAIL_bo_DonotChangeSubject:=True:C214  //BSW 06/08/02
If (Not:C34(SD_bo_AddingDiaryRecord))
	If ([DIARY:12]Diary_Code:3#"")
		READ WRITE:C146([DIARY:12])
		LOAD RECORD:C52([DIARY:12])
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
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.oEmailButton"; $_t_oldMethodName)
