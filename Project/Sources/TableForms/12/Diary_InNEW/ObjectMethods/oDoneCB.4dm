If (False:C215)
	//object Name: [DIARY]Diary_InNEW.oDoneCB
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
	//ARRAY TEXT(SD_at_DefaultTimeSettings;0)
	//ARRAY TEXT(SD3_at_TimeFrame;0)
	C_LONGINT:C283($_l_CountFields; $_l_DateSpan; $_l_DiaryTable; $_l_event; $_l_Index; $_l_TimeSpan; Baddrelation; CB_ActionDone; SD_Do_DOWN; SD_Do_DOWN2; SD_Do_Up)
	C_LONGINT:C283(SD_Do_Up2; SD_HL_l_Hours; SD_HL_l_Hours2; SD_l_EditingDiaryRecord; vSD_SelCalendar2; vSD_SelCalendar3)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InNEW.oDoneCB"; Form event code:C388)
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
			OBJECT SET ENABLED:C1123(vSD_SelCalendar2; True:C214)
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
		If ([DIARY:12]Done:14)
			OBJECT SET VISIBLE:C603(vSD_SelCalendar2; False:C215)
			OBJECT SET VISIBLE:C603(SD_Do_DOWN; False:C215)
			OBJECT SET VISIBLE:C603(SD_Do_Up; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDiaryDateFromPicture"; False:C215)
			//```
			OBJECT SET VISIBLE:C603(vSD_SelCalendar3; False:C215)
			OBJECT SET VISIBLE:C603(SD_Do_DOWN2; False:C215)
			OBJECT SET VISIBLE:C603(SD_Do_Up2; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDiaryDateToPicture"; False:C215)
			OBJECT SET VISIBLE:C603(SD_HL_l_Hours2; False:C215)
			OBJECT SET VISIBLE:C603(*; "oHoursPicture"; False:C215)
			OBJECT SET VISIBLE:C603(SD_HL_l_Hours; False:C215)
			OBJECT SET VISIBLE:C603(*; "oHoursPicture"; False:C215)
			OBJECT SET VISIBLE:C603(SD_at_DefaultTimeSettings; False:C215)
			OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; False:C215)
			OBJECT SET VISIBLE:C603(Baddrelation; False:C215)
			$_l_CountFields:=Get last field number:C255(Table:C252(->[DIARY:12]))
			$_l_DiaryTable:=Table:C252(->[DIARY:12])
			For ($_l_Index; 1; $_l_CountFields)
				$_ptr_Field:=Field:C253($_l_DiaryTable; $_l_Index)
				OBJECT SET ENTERABLE:C238($_ptr_Field->; False:C215)
			End for 
			
			SD_AllowEditDiaryOwnersOption(False:C215)  //17/10/08 v621b120a, kmw (borrowed from SD_LoadOtherPerson factored out expanded. Edit option in dropdown list of diary item owners should be available or not available depending on if Diary is DONE or not....this seemed easiest way of resetting it)
			
		Else 
			
			OBJECT SET VISIBLE:C603(vSD_SelCalendar2; True:C214)
			OBJECT SET VISIBLE:C603(SD_Do_DOWN; True:C214)
			OBJECT SET VISIBLE:C603(SD_Do_Up; True:C214)
			OBJECT SET VISIBLE:C603(*; "oDiaryDateFromPicture"; True:C214)
			//```
			OBJECT SET VISIBLE:C603(vSD_SelCalendar3; True:C214)
			OBJECT SET VISIBLE:C603(SD_Do_DOWN2; True:C214)
			OBJECT SET VISIBLE:C603(SD_Do_Up2; True:C214)
			OBJECT SET VISIBLE:C603(*; "oDiaryDateToPicture"; True:C214)
			
			SD_AllowEditDiaryOwnersOption(True:C214)  //17/10/08 v621b120a, kmw (borrowed from SD_loadDiary factored out expanded. Edit option in dropdown list of diary item owners should be available or not available depending on if Diary is DONE or not....this seemed easiest way of resetting it)
		End if 
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InNEW.oDoneCB"; $_t_oldMethodName)
