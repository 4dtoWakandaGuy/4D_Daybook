If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.oDoneCB
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
	C_LONGINT:C283($_l_DateSpan; $_l_event; $_l_TimeSpan; CB_ActionDone; SD_l_EditingDiaryRecord; vSD_SelCalendar2; vSD_SelCalendar3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.oDoneCB"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		If (Read only state:C362([DIARY:12]))
			READ WRITE:C146([DIARY:12])
			LOAD RECORD:C52([DIARY:12])
			[DIARY:12]Done:14:=False:C215
			SD_SetVisible(True:C214)
			SD_SetFieldsTrue
			SD_l_EditingDiaryRecord:=1
		End if 
		[DIARY:12]Done:14:=(CB_ActionDone=1)
		If ([DIARY:12]Done:14=True:C214)
			If ([DIARY:12]Date_Done_From:5=!00-00-00!)
				If ([DIARY:12]Date_Do_To:33>[DIARY:12]Date_Do_From:4)
					$_l_DateSpan:=[DIARY:12]Date_Do_To:33-[DIARY:12]Date_Do_From:4
					[DIARY:12]Date_Done_From:5:=Current date:C33(*)-$_l_DateSpan
				Else 
					[DIARY:12]Date_Done_From:5:=Current date:C33(*)
				End if 
				
				[DIARY:12]Date_Done_To:34:=Current date:C33(*)
				
				$_l_TimeSpan:=[DIARY:12]Time_Do_To:35-[DIARY:12]Time_Do_From:6
				[DIARY:12]Time_Done_From:7:=Time:C179(Time string:C180((Current time:C178(*)*1)-$_l_TimeSpan))
				[DIARY:12]Time_Done_To:36:=Current time:C178(*)
			End if 
			
			Diary_InD
			SD_SetVisible(True:C214)
			SD_SetFieldsTrue
			//_O_ENABLE BUTTON(vSD_SelCalendar2)
			OBJECT SET ENABLED:C1123(vSD_SelCalendar2; True:C214)
			//_O_ENABLE BUTTON(vSD_SelCalendar3)
			OBJECT SET ENABLED:C1123(vSD_SelCalendar3; True:C214)
		Else 
			
			If ([DIARY:12]Diary_Code:3#"")
				If (Read only state:C362([DIARY:12]))
					READ WRITE:C146([DIARY:12])
					LOAD RECORD:C52([DIARY:12])
				End if 
				[DIARY:12]Done:14:=False:C215
				SD_SetVisible(True:C214)
				SD_SetFieldsTrue
				SD_l_EditingDiaryRecord:=1
				
			End if 
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.oDoneCB"; $_t_oldMethodName)
