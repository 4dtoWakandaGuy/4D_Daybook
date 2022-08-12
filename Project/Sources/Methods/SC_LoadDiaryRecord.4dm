//%attributes = {}
If (False:C215)
	//Project Method Name:      SC_LoadDiaryRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 13:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PersonelID; 0)
	//ARRAY LONGINT(SD_al_DactionerID;0)
	//ARRAY LONGINT(SD_al_DownerID;0)
	//ARRAY TEXT(SC_at_DactionerrInitials;0)
	//ARRAY TEXT(SC_at_DiaryActioners;0)
	//ARRAY TEXT(SC_at_DiaryOwners;0)
	//ARRAY TEXT(SC_at_DownerInitials;0)
	//ARRAY TEXT(SC_at_TimeFrame;0)
	//ARRAY TEXT(SD_at_DefaultTimeSettings;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	//ARRAY TEXT(SD_at_ResultNames;0)
	C_BOOLEAN:C305($_bo_HideTimes; SC_bo_CBAlarmed; SD_bo_CBAlarmed)
	C_LONGINT:C283($_l_AbsTimeFrame; $_l_Days; $_l_Hours; $_l_objectbottom; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectBottom4; $_l_ObjectHeight; $_l_ObjectHeight2; $_l_objectLeft; $_l_ObjectLeft2)
	C_LONGINT:C283($_l_ObjectLeft3; $_l_ObjectLeft4; $_l_objectRight; $_l_ObjectRight2; $_l_ObjectRight3; $_l_ObjectRight4; $_l_objectTop; $_l_ObjectTop2; $_l_ObjectTop3; $_l_ObjectTop4; $_l_Remainder)
	C_LONGINT:C283($_l_SOlHeight; $_l_SOlHeight2; $_l_SOlHeight3; $_l_TotalHeight; SC_but_DiaryComplete; SC_l_TimeFrame)
	C_TEXT:C284($_t_oldMethodName; $1; SC_t_Diaryactioner; SC_t_DiaryActionerName; SC_t_DiaryActionName; SC_t_DiaryOwner; SC_t_DiaryOwnerName; SC_t_DiaryResultName; SC_t_TimeFrame; SC_t_TimeSetting; SC_t_Unassigned)
	C_TEXT:C284(SC_t_UnassignedAction; SC_t_UnassignedOwner)
	C_TIME:C306(SD_ti_AfternoonEnd; SD_ti_AfternoonStart; SD_ti_EveningEnd; SD_ti_EveningStart; SD_ti_MorningEnd; SD_ti_MorningStart; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SC_LoadDiaryRecord")
ARRAY TEXT:C222(SD_at_DefaultTimeSettings; 8)
SD_at_DefaultTimeSettings{1}:="No Time"  //start=00:00:00 finish=00:00:00`default for tasks
SD_at_DefaultTimeSettings{2}:="All Day"  //start =day start time`end =end day time default for events
SD_at_DefaultTimeSettings{3}:="-"
SD_at_DefaultTimeSettings{4}:="All Morning"
SD_at_DefaultTimeSettings{5}:="All Afternoon"
SD_at_DefaultTimeSettings{6}:="All Evening"
SD_at_DefaultTimeSettings{7}:="-"
SD_at_DefaultTimeSettings{8}:="Set Time"

If (Count parameters:C259>=1)
	If ([DIARY:12]Diary_Code:3#$1)
		QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$1)
	End if 
	If ([DIARY:12]Action_Code:9#"")
		QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
		SC_t_DiaryActionName:=[ACTIONS:13]Action_Name:2
		OBJECT SET VISIBLE:C603(SD_at_DiaryActionNames; False:C215)
	Else 
		OBJECT SET VISIBLE:C603(SD_at_DiaryActionNames; True:C214)
		SC_t_DiaryActionName:=""
		SC_t_UnassignedAction:="Unassigned"
	End if 
	$_bo_HideTimes:=False:C215
	Case of 
		: ([DIARY:12]Display_Time_From:53=?00:00:00?) & ([DIARY:12]Display_Time_To:54=?00:00:00?)
			SC_t_TimeSetting:=SD_at_DefaultTimeSettings{1}
			$_bo_HideTimes:=True:C214
		: ([DIARY:12]Display_Time_From:53<=SD_ti_SettingsTimeStart) & ([DIARY:12]Display_Time_To:54>=SD_ti_SettingsTimeEnd)
			//its an all day event
			$_bo_HideTimes:=True:C214
			SC_t_TimeSetting:=SD_at_DefaultTimeSettings{2}
		: ([DIARY:12]Display_Time_From:53=SD_ti_MorningStart) & ([DIARY:12]Display_Time_To:54=SD_ti_MorningEnd)
			//all morning
			$_bo_HideTimes:=True:C214
			SC_t_TimeSetting:=SD_at_DefaultTimeSettings{4}
		: ([DIARY:12]Display_Time_From:53=SD_ti_AfternoonStart) & ([DIARY:12]Display_Time_To:54=SD_ti_AfternoonEnd)
			// all afternoon
			SC_t_TimeSetting:=SD_at_DefaultTimeSettings{5}
			$_bo_HideTimes:=True:C214
		: ([DIARY:12]Display_Time_From:53<=SD_ti_EveningStart) & ([DIARY:12]Display_Time_To:54=SD_ti_EveningEnd)
			SC_t_TimeSetting:=SD_at_DefaultTimeSettings{6}
			//all evening
			$_bo_HideTimes:=True:C214
			
		: ([DIARY:12]Display_Time_From:53>=?00:00:00?) & ([DIARY:12]Display_Time_To:54>=?00:00:00?)
			$_bo_HideTimes:=False:C215
	End case 
	If ($_bo_HideTimes)
		OBJECT SET VISIBLE:C603(*; "oDiarytimetolabel"; False:C215)
		OBJECT SET VISIBLE:C603([DIARY:12]Display_Time_From:53; False:C215)
		OBJECT SET VISIBLE:C603([DIARY:12]Display_Time_To:54; False:C215)
		OBJECT SET VISIBLE:C603(SC_t_TimeSetting; True:C214)
		If ([DIARY:12]Done:14=False:C215)
			OBJECT SET VISIBLE:C603(SD_at_DefaultTimeSettings; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(SD_at_DefaultTimeSettings; False:C215)
		End if 
	Else 
		OBJECT SET VISIBLE:C603(*; "oDiarytimetolabel"; True:C214)
		OBJECT SET VISIBLE:C603([DIARY:12]Display_Time_From:53; True:C214)
		OBJECT SET VISIBLE:C603([DIARY:12]Display_Time_To:54; True:C214)
		OBJECT SET VISIBLE:C603(SC_t_TimeSetting; False:C215)
		OBJECT SET VISIBLE:C603(SD_at_DefaultTimeSettings; False:C215)
	End if 
	If ([DIARY:12]Done:14=False:C215)
		
		OBJECT SET VISIBLE:C603(SC_bo_CBAlarmed; True:C214)
		OBJECT SET VISIBLE:C603(SC_l_TimeFrame; True:C214)
		OBJECT SET VISIBLE:C603(SC_t_TimeFrame; True:C214)
		OBJECT SET VISIBLE:C603(SC_at_TimeFrame; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(SC_bo_CBAlarmed; False:C215)
		OBJECT SET VISIBLE:C603(SC_l_TimeFrame; False:C215)
		OBJECT SET VISIBLE:C603(SC_t_TimeFrame; False:C215)
		OBJECT SET VISIBLE:C603(SC_at_TimeFrame; False:C215)
	End if 
	If ([DIARY:12]Alarm_Timeframe:48#0)
		$_l_AbsTimeFrame:=Abs:C99([DIARY:12]Alarm_Timeframe:48)
		SD_bo_CBAlarmed:=True:C214
		
		Case of 
			: ($_l_AbsTimeFrame>(60*24))  //DAYS/Hours/mins
				$_l_Days:=$_l_AbsTimeFrame/(60*24)
				$_l_Remainder:=$_l_AbsTimeFrame-($_l_Days*(60*24))
				If ($_l_Remainder>0)
					$_l_Hours:=$_l_Remainder/60
					$_l_Remainder:=$_l_Remainder-($_l_Hours*(60))
					If ($_l_Remainder>0)
						SC_l_TimeFrame:=$_l_AbsTimeFrame
						SC_t_TimeFrame:="Minutes"
					Else 
						SC_l_TimeFrame:=$_l_Hours+($_l_Days*24)
						SC_t_TimeFrame:="Hours"
					End if 
				Else 
					SC_l_TimeFrame:=$_l_Days
					SC_t_TimeFrame:="Days"
				End if 
				If ([DIARY:12]Alarm_Timeframe:48<0)
					SC_l_TimeFrame:=-SC_l_TimeFrame
				End if 
			: ($_l_AbsTimeFrame>60)  //hours
				
				
				$_l_Hours:=$_l_AbsTimeFrame/60
				$_l_Remainder:=$_l_AbsTimeFrame-($_l_Hours*(60))
				If ($_l_Remainder>0)
					SC_l_TimeFrame:=$_l_AbsTimeFrame
					SC_t_TimeFrame:="Minutes"
				Else 
					SC_l_TimeFrame:=$_l_Hours
					SC_t_TimeFrame:="Hours"
				End if 
				If ([DIARY:12]Alarm_Timeframe:48<0)
					SC_l_TimeFrame:=-SC_l_TimeFrame
				End if 
			Else 
				//   Minutes
				SC_l_TimeFrame:=[DIARY:12]Alarm_Timeframe:48
				SC_t_TimeFrame:="Minutes"
				//time frame already set so calc mins/hours/etc
		End case 
	Else 
		SC_l_TimeFrame:=0
		SC_t_TimeFrame:=""
		SD_bo_CBAlarmed:=False:C215
	End if 
	
	If ([DIARY:12]Person:8#"")
		SC_t_UnassignedOwner:=""
		OBJECT SET VISIBLE:C603(SC_t_UnassignedOwner; False:C215)
		SC_t_DiaryOwner:=[DIARY:12]Person:8
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SC_t_DiaryOwner)
		SC_t_DiaryOwnerName:=[PERSONNEL:11]Name:2
		OBJECT SET VISIBLE:C603(SC_t_DiaryOwnerName; True:C214)
		If ([DIARY:12]Done:14) | ([DIARY:12]Result_Code:11#"")
			
			OBJECT SET VISIBLE:C603(SC_at_DiaryOwners; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(SC_at_DiaryOwners; True:C214)
		End if 
	Else 
		OBJECT SET VISIBLE:C603(SC_t_UnassignedOwner; True:C214)
		SC_t_UnassignedOwner:="Unassigned"
	End if 
	QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]DIARY_CODE:1=[DIARY:12]Diary_Code:3; *)
	QUERY:C277([DIARY_ITEMOWNERS:106];  & ; [DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3#2)
	SELECTION TO ARRAY:C260([DIARY_ITEMOWNERS:106]PERSONNEL_ID:2; $_al_PersonelID)
	QUERY WITH ARRAY:C644([PERSONNEL:11]Personnel_ID:48; $_al_PersonelID)
	SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; SC_at_DiaryOwners; [PERSONNEL:11]Initials:1; SC_at_DownerInitials; [PERSONNEL:11]Personnel_ID:48; SD_al_DownerID)
	If ([DIARY:12]Done:14=False:C215)
		APPEND TO ARRAY:C911(SC_at_DiaryOwners; "-")
		APPEND TO ARRAY:C911(SC_at_DiaryOwners; "Edit Diary Owners")
	End if 
	If (Size of array:C274(SC_at_DiaryOwners)>1)
		OBJECT SET VISIBLE:C603(SC_at_DiaryOwners; False:C215)
	End if 
	
	QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]DIARY_CODE:1=[DIARY:12]Diary_Code:3; *)
	QUERY:C277([DIARY_ITEMOWNERS:106];  & ; [DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3=2)
	SELECTION TO ARRAY:C260([DIARY_ITEMOWNERS:106]PERSONNEL_ID:2; $_al_PersonelID)
	QUERY WITH ARRAY:C644([PERSONNEL:11]Personnel_ID:48; $_al_PersonelID)
	SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; SC_at_DiaryActioners; [PERSONNEL:11]Initials:1; SC_at_DactionerrInitials; [PERSONNEL:11]Personnel_ID:48; SD_al_DactionerID)
	If ([DIARY:12]Done:14=False:C215)
		APPEND TO ARRAY:C911(SC_at_DiaryOwners; "-")
		APPEND TO ARRAY:C911(SC_at_DiaryOwners; "Edit Diary actioner")
	End if 
	If (Size of array:C274(SC_at_DiaryActioners)>0)
		SC_t_Diaryactioner:=SC_at_DactionerrInitials{1}
		SC_t_DiaryActionerName:=SC_at_DiaryActioners{1}
		SC_t_Unassigned:=""
		OBJECT SET VISIBLE:C603(SC_t_Unassigned; False:C215)
		If ([DIARY:12]Done:14) | ([DIARY:12]Result_Code:11#"")
			OBJECT SET VISIBLE:C603(SC_at_DiaryActioners; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(SC_at_DiaryActioners; True:C214)
		End if 
		
	Else 
		SC_t_Diaryactioner:=""
		SC_t_DiaryActionerName:=""
		SC_t_Unassigned:="Unassigned"
		OBJECT SET VISIBLE:C603(SC_t_Unassigned; True:C214)
		If ([DIARY:12]Done:14) | ([DIARY:12]Result_Code:11#"")
			SC_t_Unassigned:="Unknown"
			OBJECT SET VISIBLE:C603(SC_at_DiaryActioners; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(SC_at_DiaryActioners; True:C214)
		End if 
		
	End if 
	If ([DIARY:12]Result_Code:11#"")
		QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Code:1=[DIARY:12]Result_Code:11)
		SC_t_DiaryResultName:=[RESULTS:14]Result_Name:2
	Else 
		SC_t_DiaryResultName:=""
	End if 
	If ([DIARY:12]Done:14) | ([DIARY:12]Result_Code:11#"")
		OBJECT SET VISIBLE:C603(SC_but_DiaryComplete; False:C215)
		//``
		OBJECT SET VISIBLE:C603(SD_at_ResultNames; False:C215)
		If (False:C215)
			OBJECT GET COORDINATES:C663([SERVICE_CALLS:20]Elapsed_Time:19; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectbottom)
			OBJECT GET COORDINATES:C663([DIARY:12]Result_Description:12; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			OBJECT GET COORDINATES:C663([DIARY:12]Action_Details:10; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
			OBJECT GET COORDINATES:C663(SD_at_ResultNames; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
			$_l_SOlHeight:=$_l_ObjectBottom4-$_l_ObjectTop4
			$_l_TotalHeight:=($_l_objectTop-5)-$_l_ObjectTop3
			$_l_ObjectHeight:=$_l_TotalHeight/2-($_l_SOlHeight+10)
			$_l_ObjectHeight2:=$_l_ObjectBottom2-$_l_ObjectTop2
			
			OBJECT MOVE:C664([DIARY:12]Action_Details:10; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectTop3+$_l_ObjectHeight; *)
			
			OBJECT MOVE:C664(SD_at_ResultNames; $_l_ObjectLeft4; $_l_ObjectTop3+$_l_ObjectHeight+5; $_l_ObjectRight4; $_l_ObjectTop3+$_l_ObjectHeight+5+$_l_SOlHeight; *)
			
			OBJECT GET COORDINATES:C663([DIARY:12]Result_Code:11; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
			$_l_SOlHeight2:=$_l_ObjectBottom4-$_l_ObjectTop4
			OBJECT MOVE:C664([DIARY:12]Result_Code:11; $_l_ObjectLeft4; $_l_ObjectTop3+$_l_ObjectHeight+7; $_l_ObjectRight4; $_l_ObjectTop3+$_l_ObjectHeight+7+$_l_SOlHeight2; *)
			
			OBJECT GET COORDINATES:C663(*; "oDiaryResultCodeLabel"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
			$_l_SOlHeight2:=$_l_ObjectBottom4-$_l_ObjectTop4
			OBJECT MOVE:C664(*; "oDiaryResultCodeLabel"; $_l_ObjectLeft4; $_l_ObjectTop3+$_l_ObjectHeight+7; $_l_ObjectRight4; $_l_ObjectTop3+$_l_ObjectHeight+7+$_l_SOlHeight2; *)
			
			OBJECT GET COORDINATES:C663(*; "oDiaryResultName"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
			$_l_SOlHeight3:=$_l_ObjectBottom4-$_l_ObjectTop4
			OBJECT MOVE:C664(*; "oDiaryResultName"; $_l_ObjectLeft4; $_l_ObjectTop3+$_l_ObjectHeight+7+$_l_SOlHeight2+5; $_l_ObjectRight4; $_l_ObjectTop3+$_l_ObjectHeight+7+$_l_SOlHeight2+5+$_l_SOlHeight3; *)
			
			//oSolutionDescription
			OBJECT MOVE:C664([DIARY:12]Result_Description:12; $_l_ObjectLeft2; $_l_objectTop-(10+$_l_ObjectHeight)+5+$_l_SOlHeight+5; $_l_ObjectRight2; $_l_objectTop-5; *)
			
		End if   //`
	Else 
		OBJECT SET VISIBLE:C603(SC_but_DiaryComplete; True:C214)
		OBJECT SET VISIBLE:C603(*; "oDiaryResultCodeLabel"; False:C215)
		OBJECT SET VISIBLE:C603([DIARY:12]Result_Code:11; False:C215)
		OBJECT SET VISIBLE:C603(SD_at_ResultNames; False:C215)
		OBJECT SET VISIBLE:C603(SC_t_DiaryResultName; False:C215)
		
		//``
		OBJECT GET COORDINATES:C663([SERVICE_CALLS:20]Elapsed_Time:19; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectbottom)
		OBJECT GET COORDINATES:C663(SC_but_DiaryComplete; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
		$_l_ObjectHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
		OBJECT MOVE:C664(SC_but_DiaryComplete; $_l_ObjectLeft2; $_l_objectTop-(10+$_l_ObjectHeight); $_l_ObjectRight2; $_l_objectTop-5; *)
		OBJECT GET COORDINATES:C663([DIARY:12]Action_Details:10; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
		OBJECT MOVE:C664([DIARY:12]Action_Details:10; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_objectTop-(10+$_l_ObjectHeight)-1; *)
	End if 
Else 
	OBJECT SET VISIBLE:C603(SD_at_ResultNames; True:C214)
	OBJECT SET VISIBLE:C603(SC_but_DiaryComplete; True:C214)
End if 
ERR_MethodTrackerReturn("SC_LoadDiaryRecord"; $_t_oldMethodName)