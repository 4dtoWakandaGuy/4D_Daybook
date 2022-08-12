If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.Variable14
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
	//ARRAY LONGINT(SD_al_aAddAction;0)
	//ARRAY TEXT(SD_at_AddAction;0)
	//ARRAY TEXT(SD_at_DefaultTimeSettings;0)
	//ARRAY TEXT(SD3_at_TimeFrame;0)
	C_BOOLEAN:C305($_bo_Proceed; EMAIL_bo_DonotChangeSubject; MSG_bo_NewMessage; MSG_bo_QuickMessage; SD_bo_AddingDiaryRecord; SD_bo_CBAlarmed)
	C_DATE:C307(SD_D_CurrentviewDate)
	C_LONGINT:C283(SD_HL_l_Hours; SD_HL_l_Hours2; SD_l_TimeFrame)
	C_TEXT:C284($_t_oldMethodName; $_t_Telephone; MSG_t_MessageFrom; SD_at_TimeFrame; SD_t_TimeSetting; tMessage)
	C_TIME:C306(SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.Variable14"; Form event code:C388)

Case of 
	: (SD_al_aAddAction{SD_at_AddAction}=9)
		DB_MenuNewRecord("DiaryTime")
		
	: (SD_al_aAddAction{SD_at_AddAction}=1)
		//Add event
		SD_AutoAddRec("EVENT"; SD_D_CurrentviewDate; ?00:00:00?; False:C215; True:C214)
		OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; False:C215)
		OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; False:C215)
		OBJECT SET VISIBLE:C603(*; "oTimeDoFromLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oTimeDoneFromLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oHoursPicture"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oHoursPicture"; True:C214)
		OBJECT SET VISIBLE:C603(SD_HL_l_Hours; False:C215)
		OBJECT SET VISIBLE:C603(SD_HL_l_Hours2; False:C215)
		OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; False:C215)
		OBJECT SET VISIBLE:C603(SD_l_TimeFrame; False:C215)
		OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; False:C215)
		OBJECT SET VISIBLE:C603(SD_at_TimeFrame; False:C215)
		OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_TimeSetting; True:C214)
		OBJECT SET VISIBLE:C603(SD_at_DefaultTimeSettings; True:C214)
		SD_t_TimeSetting:=SD_at_DefaultTimeSettings{2}
		[DIARY:12]Time_Do_From:6:=SD_ti_SettingsTimeStart
		[DIARY:12]Time_Do_To:35:=SD_ti_SettingsTimeEnd
	: (SD_al_aAddAction{SD_at_AddAction}=2)
		SD_AutoAddRec(""; SD_D_CurrentviewDate; ?00:00:00?; False:C215; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_TimeSetting; False:C215)
		OBJECT SET VISIBLE:C603(SD_at_DefaultTimeSettings; False:C215)
		OBJECT SET VISIBLE:C603(SD_HL_l_Hours; False:C215)
		OBJECT SET VISIBLE:C603(SD_HL_l_Hours2; False:C215)
		
		
		//shedule
	: (SD_al_aAddAction{SD_at_AddAction}=3)
		//task
		SD_AutoAddRec("TASK"; SD_D_CurrentviewDate; ?00:00:00?; False:C215; True:C214)
		[DIARY:12]Time_Do_From:6:=?00:00:00?
		OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; False:C215)
		OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; False:C215)
		OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; False:C215)
		OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; False:C215)
		
		OBJECT SET VISIBLE:C603(*; "oTimeDoFromLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oTimeDoToLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oHoursPicture"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oHoursPicture"; True:C214)
		OBJECT SET VISIBLE:C603(SD_HL_l_Hours; False:C215)
		OBJECT SET VISIBLE:C603(SD_HL_l_Hours2; False:C215)
		OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; False:C215)
		OBJECT SET VISIBLE:C603(SD_l_TimeFrame; False:C215)
		OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; False:C215)
		OBJECT SET VISIBLE:C603(SD_at_TimeFrame; False:C215)
		OBJECT SET VISIBLE:C603(*; "oDiaryTimeRectangle"; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_TimeSetting; True:C214)
		OBJECT SET VISIBLE:C603(SD_at_DefaultTimeSettings; True:C214)
		SD_t_TimeSetting:=SD_at_DefaultTimeSettings{1}
		
	: (SD_al_aAddAction{SD_at_AddAction}=5)
		//new Letter
		If ([DIARY:12]Diary_Code:3#"")
			If (Not:C34(SD_bo_AddingDiaryRecord))
				READ WRITE:C146([DIARY:12])
				LOAD RECORD:C52([DIARY:12])
				[DIARY:12]Done:14:=False:C215
				SD_SetVisible(True:C214)
				SD_SetFieldsTrue
			End if 
			Case of 
				: ([DIARY:12]Document_Code:15="SMS")  // 12/6/02 pb
					Gen_Alert("This Diary Item is an SMS message, not a Letter.")
				: ([DIARY:12]Document_Code:15#"")
					Diary_LetSee
				Else 
					Diary_LetNew
			End case 
		Else 
			//not in a diary item
			DB_MenuNewRecord("DiaryLetter")
			//ZDiary_InL
		End if 
	: (SD_al_aAddAction{SD_at_AddAction}=6)
		//new Email
		If ([DIARY:12]Diary_Code:3#"")
			EMAIL_bo_DonotChangeSubject:=True:C214  //BSW 06/08/02
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
					SET TIMER:C645(0)
					Diary_EmailNew
			End case 
		Else 
			//not in a diary record
			zDiary_inEmail
		End if 
		
	: (SD_al_aAddAction{SD_at_AddAction}=7)
		
		//New SMS
		If ([DIARY:12]Diary_Code:3#"")
			$_bo_Proceed:=True:C214
			tMessage:=""
			MSG_bo_NewMessage:=True:C214
			Case of 
					//  : ([DIARY]Contact Code="")  ` 26/06/02 pb
				: (([DIARY:12]Contact_Code:2="") & ([DIARY:12]Document_Code:15=""))  // 26/06/02 pb
					//    ALERT("Please select a contact first!")
					Gen_Alert("Please select a contact first!")
					$_bo_Proceed:=False:C215
					
				: ([DIARY:12]Document_Code:15="SMS")
					//    CONFIRM("The SMS message has already been sent. Do you wish to re-send it?";
					//    If (OK=0)
					//    $_bo_Proceed:=False
					//   Else
					tMessage:=Replace string:C233([DIARY:12]Action_Details:10; "SMS: "; "")
					MSG_bo_NewMessage:=False:C215
					
					//  End if
				: ([DIARY:12]Document_Code:15#"")
					//    ALERT("An Email or letter has already been selected for this Diary item.")
					Gen_Alert("An Email or letter has already been selected for this Diary item.")
					$_bo_Proceed:=False:C215
				Else 
			End case 
			
			If ($_bo_Proceed)
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[DIARY:12]Contact_Code:2)  // 26/06/02 pb
				MSG_bo_QuickMessage:=False:C215
				SMS_SendOneMessage(->[CONTACTS:1]Mobile:12)
				If ((tMessage#"") & ([DIARY:12]Action_Details:10=""))  // Action desc will not be blank if the msg has already been sent
					[DIARY:12]Action_Details:10:="SMS: "+tMessage
					[DIARY:12]Email_Text:42:=tMessage
					[DIARY:12]Document_Code:15:="SMS"
					[DIARY:12]Email_From:38:=MSG_t_MessageFrom
					DB_SaveRecord(->[DIARY:12])
					AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
				End if 
			End if 
			
		Else 
			MSG_bo_QuickMessage:=True:C214
			$_t_Telephone:=Request:C163("Mobile number to send to:")
			If ($_t_Telephone#"") & (OK=1)
				tmessage:=""
				MSG_bo_NewMessage:=True:C214  // 19/08/03 pb
				SMS_SendOneMessage(->$_t_Telephone)
			End if 
		End if 
		
End case 
SD_at_AddAction:=0
ERR_MethodTrackerReturn("OBJ:Diary_ViewAG,SD_at_AddAction"; $_t_oldMethodName)
