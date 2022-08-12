//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_InD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 12:32
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD_ai_ActionCodesOSW;0)
	//ARRAY LONGINT(SD_al_ActionCodesOST;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	C_BOOLEAN:C305(SD_bo_AddingDiaryRecord; SD_bo_RecordModified)
	C_LONGINT:C283(<>SD3_l_DiaryVersion; $_l_DiaryActionPosition; $_l_Index; CB_ActionDone)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_ConfirmMessage; $_t_oldMethodName; VSrchRequest)
	C_TIME:C306($_ti_TimeDoFrom; $_ti_TimeDoTo)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InD")

//Diary_InD
//SD_bo_AddingDiaryRecord:=True
Case of 
	: (Modified:C32([DIARY:12]Done:14))
		
		Diary_InLPX(->[DIARY:12]Done:14)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Company_Code:1))
		Diary_InLPX(->[DIARY:12]Company_Code:1)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Contact_Code:2))
		Diary_InLPX(->[DIARY:12]Contact_Code:2)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Date_Do_From:4))
		Diary_InLPX(->[DIARY:12]Date_Do_From:4)
		SD_SetReminder([DIARY:12]Alarm_Timeframe:48; [DIARY:12]Diary_Code:3)
		
		
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Date_Do_To:33))
		Diary_InLPX(->[DIARY:12]Date_Do_To:33)
		SD_SetReminder([DIARY:12]Alarm_Timeframe:48; [DIARY:12]Diary_Code:3)
		
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Date_Done_From:5))
		Diary_InLPX(->[DIARY:12]Date_Done_From:5)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Date_Done_To:34))
		Diary_InLPX(->[DIARY:12]Date_Done_To:34)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Time_Do_From:6))
		Diary_InLPX(->[DIARY:12]Time_Do_From:6)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Time_Do_To:35))
		Diary_InLPX(->[DIARY:12]Time_Do_To:35)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Time_Done_From:7))
		Diary_InLPX(->[DIARY:12]Time_Done_From:7)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Time_Done_To:36))
		Diary_InLPX(->[DIARY:12]Time_Done_To:36)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Priority:17))
		Diary_InLPX(->[DIARY:12]Priority:17)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Person:8))
		Diary_InLPX(->[DIARY:12]Person:8)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Originator:23))
		Diary_InLPX(->[DIARY:12]Originator:23)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Product_Code:13))
		Diary_InLPX(->[DIARY:12]Product_Code:13)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Job_Code:19))
		Diary_InLPX(->[DIARY:12]Job_Code:19)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Stage_Code:21))
		Diary_InLPX(->[DIARY:12]Stage_Code:21)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Script_Code:29))
		Diary_InLPX(->[DIARY:12]Script_Code:29)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Action_Code:9))
		
		Diary_InLPX(->[DIARY:12]Action_Code:9)
		
		If (<>SD3_l_DiaryVersion=1)
			$_l_DiaryActionPosition:=Find in array:C230(SD_at_ActionCodes; [DIARY:12]Action_Code:9)
			If ($_l_DiaryActionPosition>0)
				If (Size of array:C274(SD_al_ActionTime)<$_l_DiaryActionPosition)
					INSERT IN ARRAY:C227(SD_al_ActionTime; Size of array:C274(SD_al_ActionTime)+1; ($_l_DiaryActionPosition-Size of array:C274(SD_al_ActionTime)))
				End if 
				
				If (SD_al_ActionTime{$_l_DiaryActionPosition}>0)
					//there is a standard time for this
					//We are using the superdiary
					//check the time slot
					$_ti_TimeDoFrom:=[DIARY:12]Time_Do_From:6
					$_ti_TimeDoTo:=SD_GETAVAILABLETIMESLOT(<>PER_t_CurrentUserInitials; [DIARY:12]Date_Do_From:4; $_ti_TimeDoFrom; SD_al_ActionTime{$_l_DiaryActionPosition})
					$_ti_TimeDoFrom:=Time:C179(Time string:C180($_ti_TimeDoTo-(SD_al_ActionTime{$_l_DiaryActionPosition}*60)))
					If ($_ti_TimeDoFrom>[DIARY:12]Time_Do_From:6)
						$_t_ConfirmMessage:="This diary item should move from "
						$_t_ConfirmMessage:=$_t_ConfirmMessage+Time string:C180([DIARY:12]Time_Do_From:6*1)+"-"+Time string:C180([DIARY:12]Time_Do_To:35*1)
						$_t_ConfirmMessage:=$_t_ConfirmMessage+" to"+Time string:C180($_ti_TimeDoFrom*1)+"-"+Time string:C180($_ti_TimeDoTo*1)
						Gen_Confirm($_t_ConfirmMessage; "Change"; "Leave")
						If (Ok=1)
							[DIARY:12]Time_Do_From:6:=$_ti_TimeDoFrom
							[DIARY:12]Time_Do_To:35:=$_ti_TimeDoTo
						End if 
					End if 
					
				End if 
				If ([DIARY:12]Alarm_Timeframe:48=0)
					//check if there is a
					If (SD_ai_ActionCodesOSW{$_l_DiaryActionPosition}=1)
						[DIARY:12]Alarm_Timeframe:48:=SD_al_ActionCodesOST{$_l_DiaryActionPosition}
						SD_SetReminder([DIARY:12]Alarm_Timeframe:48; [DIARY:12]Diary_Code:3)
					End if 
					
				End if 
				
			End if 
		End if 
		
		
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Action_Details:10))
		Diary_InLPX(->[DIARY:12]Action_Details:10)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Result_Code:11))
		Diary_InLPX(->[DIARY:12]Result_Code:11)
		CB_ActionDone:=Num:C11([DIARY:12]Done:14)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Result_Description:12))
		Diary_InLPX(->[DIARY:12]Result_Description:12)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Document_Code:15))
		Diary_InLPX(->[DIARY:12]Document_Code:15)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Document_Heading:32))
		Diary_InLPX(->[DIARY:12]Document_Heading:32)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Charge_Rate:22))
		Diary_InLPX(->[DIARY:12]Charge_Rate:22)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Units:20))
		Diary_InLPX(->[DIARY:12]Units:20)
		SD_bo_RecordModified:=True:C214
		
	: (Modified:C32([DIARY:12]Order_Code:26))
		Diary_InLPX(->[DIARY:12]Order_Code:26)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Call_Code:25))
		Diary_InLPX(->[DIARY:12]Call_Code:25)
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Value:16))
		Diary_InLPX(->[DIARY:12]Value:16)
		
		SD_bo_RecordModified:=True:C214
	: (Modified:C32([DIARY:12]Status:30))
		Diary_InLPX(->[DIARY:12]Status:30)
		SD_bo_RecordModified:=True:C214
	Else 
		If (vSrchRequest="")
			For ($_l_Index; 1; Get last field number:C255(->[DIARY:12]))
				$_ptr_Field:=Field:C253(Table:C252(->[DIARY:12]); $_l_Index)
				If (Modified:C32($_ptr_Field->))
					
					SD_bo_RecordModified:=True:C214
					$_l_Index:=99999
				End if 
			End for 
			
			
		End if 
		
End case 
If (<>SD3_l_DiaryVersion>0)
	SD_SetSourceButtons
End if 
CB_ActionDone:=Num:C11([DIARY:12]Done:14)
ERR_MethodTrackerReturn("Diary_InD"; $_t_oldMethodName)