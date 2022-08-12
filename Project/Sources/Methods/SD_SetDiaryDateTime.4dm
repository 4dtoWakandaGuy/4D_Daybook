//%attributes = {}

If (False:C215)
	//Database Method Name:      SD_SetDiaryDateTime
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  02/12/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	ARRAY TEXT:C222($_at_AttributeNames; 0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_TimeType;0)
	C_BOOLEAN:C305($_bo_IsScheduleTask; $_bo_RecordDoneTimeDate)
	C_DATE:C307($_d_CurrentDate; $_d_EndDate; $_d_StartDate)
	C_LONGINT:C283($_l_AmountofTime; $_l_AmountofTimeType; $_l_DayNumber; $_l_EndDateFIeld; $_l_Index; $_l_NumberOfMinutes; $_l_NumberofSeconds; $_l_Ref; $_l_SD2TimeAmount; $_l_StartDateOffset; $_l_TESTimEnd)
	C_LONGINT:C283($_l_TimeAmountType; $_l_TimeEnd; $_l_TimeStart; $_l_TSTimeStart)
	C_POINTER:C301($_ptr_attributes; $1)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_DayStartsAtTime; $_ti_EndTimeTime; $_ti_StartTime; $_ti_TimeEnd; $_ti_TimeStart; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD_SetDiaryDateTime")
$_ptr_attributes:=$1



If ([DIARY:12]Action_Code:9#"")
	//so if the start day is a monday then its next monday..so we start at the current date and move forward to the next monday(cannot be more than 7 days)
	SD2_GetAttributeValue($_ptr_attributes; "Start Day"; ->$_l_StartDateOffset)
	
	If ($_l_StartDateOffset>0)
		For ($_l_Index; 1; 8)
			$_d_CurrentDate:=Current date:C33(*)+($_l_Index-1)
			$_l_DayNumber:=Day number:C114($_d_CurrentDate)
			If ($_l_DayNumber=$_l_StartDateOffset)
				$_d_StartDate:=$_d_CurrentDate
				$_l_Index:=9
			End if 
		End for 
		
	Else 
		$_d_StartDate:=Current date:C33(*)
	End if   // we now have a potential start date
Else 
	$_d_StartDate:=Current date:C33(*)
End if 

Case of 
	: ([DIARY:12]Date_Do_From:4=!00-00-00!)
		[DIARY:12]Date_Do_From:4:=$_d_StartDate
		If ($_bo_RecordDoneTimeDate)
			[DIARY:12]Date_Done_From:5:=$_d_StartDate
		End if 
	: ([DIARY:12]Date_Done_From:5=!00-00-00!) & ($_bo_RecordDoneTimeDate)
		[DIARY:12]Date_Done_From:5:=$_d_StartDate
	Else 
		$_d_StartDate:=[DIARY:12]Date_Do_From:4
End case 
If ([DIARY:12]Action_Code:9#"")
	$_l_EndDateFIeld:=Find in array:C230(SD2_at_ActionVirtFieldName; "End Day")
	If ($_l_EndDateFIeld>0)
		$_l_StartDateOffset:=SD2_al_ActionVirtFieldDataLong{$_l_EndDateFIeld}
		If ($_l_StartDateOffset=0)
			$_d_EndDate:=$_d_StartDate
		Else 
			$_d_StartDate:=[DIARY:12]Date_Do_From:4
			For ($_l_Index; 1; 8)
				$_d_CurrentDate:=$_d_StartDate+($_l_Index-1)
				$_l_DayNumber:=Day number:C114($_d_CurrentDate)
				If ($_l_DayNumber=$_l_StartDateOffset)
					$_d_EndDate:=$_d_CurrentDate
					$_l_Index:=9
				End if 
			End for 
		End if 
	Else 
		$_d_EndDate:=$_d_StartDate
	End if 
Else 
	$_d_EndDate:=$_d_StartDate
End if 

Case of 
	: ([DIARY:12]Date_Do_To:33=!00-00-00!)
		[DIARY:12]Date_Do_To:33:=$_d_EndDate
		If ($_bo_RecordDoneTimeDate) & ([DIARY:12]Date_Done_To:34=!00-00-00!)
			[DIARY:12]Date_Done_To:34:=$_d_StartDate
		End if 
	: ([DIARY:12]Date_Done_To:34=!00-00-00!) & ($_bo_RecordDoneTimeDate)
		[DIARY:12]Date_Done_To:34:=$_d_StartDate
End case 
////////
If ([DIARY:12]Action_Code:9#"")
	SD2_GetAttributeValue($_ptr_attributes; "Start time"; ->$_l_TimeStart)
	
	
	If ($_l_TimeStart>0)
		$_ti_TimeStart:=Time:C179(Time string:C180($_l_TimeStart))
	Else 
		$_ti_TimeStart:=?00:00:00?
	End if 
Else 
	$_ti_TimeStart:=?00:00:00?
End if 

Case of 
	: ([DIARY:12]Time_Do_From:6#?00:00:00?)
		//a do from time was passed to the method
		If ($_bo_RecordDoneTimeDate) & ([DIARY:12]Time_Done_From:7=?00:00:00?)
			[DIARY:12]Time_Done_From:7:=[DIARY:12]Time_Do_From:6
			
		Else 
			//[DIARY]Time_Do_From:=$_ti_TimeStart
			//If ($_bo_RecordDoneTimeDate)
			//[DIARY]Time_Done_From:=[DIARY]Time_Do_From
			//End if 
		End if 
	: ([DIARY:12]Time_Do_From:6=?00:00:00?)
		[DIARY:12]Time_Do_From:6:=$_ti_TimeStart
		If ($_bo_RecordDoneTimeDate) & ([DIARY:12]Time_Done_From:7=?00:00:00?)
			[DIARY:12]Time_Done_From:7:=[DIARY:12]Time_Do_From:6
		End if 
End case 
If ([DIARY:12]Action_Code:9#"")
	SD2_GetAttributeValue($_ptr_attributes; "End time"; ->$_l_TimeEnd)
	
	
	If ($_l_TimeEnd>0)
		$_ti_TimeEnd:=Time:C179(Time string:C180($_l_TimeEnd))
	Else 
		$_ti_TimeEnd:=?00:00:00?
	End if 
Else 
	$_ti_TimeEnd:=?00:00:00?
End if 
If ([DIARY:12]Time_Do_To:35#?00:00:00?)
	//a do to  time was passed to the method
	If ($_bo_RecordDoneTimeDate) & ([DIARY:12]Time_Done_To:36=?00:00:00?)
		If ([DIARY:12]Time_Done_From:7<$_ti_TimeEnd)
			[DIARY:12]Time_Done_To:36:=$_ti_TimeEnd
		Else 
			[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Done_From:7
		End if 
	End if 
Else 
	[DIARY:12]Time_Do_To:35:=$_ti_TimeEnd  //this may be †00:00:00†
	If ($_bo_RecordDoneTimeDate) & ([DIARY:12]Time_Done_To:36=?00:00:00?)
		[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Do_To:35
	End if 
	
End if 
If ([DIARY:12]Time_Do_To:35=?00:00:00?) & ([DIARY:12]Time_Do_From:6#?00:00:00?)
	//no end time was set
	
	SD2_GetAttributeValue($_ptr_attributes; "Amount of Time"; ->$_l_SD2TimeAmount)
	If ($_l_SD2TimeAmount>0)
		//calculate the amount of time
		SD2_GetAttributeValue($_ptr_attributes; "Amount of Time Type"; ->$_l_TimeAmountType)
		
		Case of 
			: ($_l_TimeAmountType=2)
				[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6
				//End time=start time then!
			: ($_l_TimeAmountType=1)
				SD2_at_TimeType:=2  //hours
				$_l_NumberofSeconds:=(60*60)*$_l_SD2TimeAmount
				$_l_TSTimeStart:=[DIARY:12]Time_Do_From:6*1
				$_l_TESTimEnd:=$_l_TSTimeStart+$_l_NumberofSeconds
				[DIARY:12]Time_Do_To:35:=Time:C179(Time string:C180($_l_TESTimEnd))
				If ($_bo_RecordDoneTimeDate)
					[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Do_To:35
				End if 
				
			Else 
				SD2_at_TimeType:=1  //minutes
				$_l_NumberofSeconds:=60*$_l_SD2TimeAmount
				$_l_TSTimeStart:=[DIARY:12]Time_Do_From:6*1
				$_l_TESTimEnd:=$_l_TSTimeStart+$_l_NumberofSeconds
				[DIARY:12]Time_Do_To:35:=Time:C179(Time string:C180($_l_TESTimEnd))
				If ($_bo_RecordDoneTimeDate)
					[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Do_To:35
				End if 
		End case 
		
		
	End if 
End if 

If ([DIARY:12]Time_Do_From:6=?00:00:00?)
	$_bo_IsScheduleTask:=[DIARY:12]xDiaryClass:65 ?? 1
	
	If ($_bo_IsScheduleTask) | ([DIARY:12]xDiaryClass:65=0)  //this is going into the schedule. find a time slot on the date
		
		SD2_GetAttributeValue($_ptr_attributes; "Amount of Time"; ->$_l_SD2TimeAmount)
		SD2_GetAttributeValue($_ptr_attributes; "Amount of Time Type"; ->$_l_TimeAmountType)
		Case of 
			: ($_l_TimeAmountType=2)
				$_l_NumberOfMinutes:=(60*24)
				//End time=start time then!
			: ($_l_TimeAmountType=1)
				SD2_at_TimeType:=2  //hours
				$_l_NumberOfMinutes:=(60)*$_l_SD2TimeAmount
			Else 
				SD2_at_TimeType:=1  //minutes
				$_l_NumberOfMinutes:=$_l_SD2TimeAmount
				
		End case 
		
		If ([DIARY:12]Date_Do_From:4=Current date:C33(*))
			$_ti_TimeStart:=SD_GETAVAILABLETIMESLOT([DIARY:12]Person:8; [DIARY:12]Date_Do_From:4; Current time:C178(*); $_l_NumberOfMinutes)
		Else 
			$_ti_DayStartsAtTime:=?09:00:00?  //or SD_ti_SettingsTimeStart<--think you need to get the day start properly
			$_ti_TimeStart:=SD_GETAVAILABLETIMESLOT([DIARY:12]Person:8; [DIARY:12]Date_Do_From:4; $_ti_DayStartsAtTime; $_l_NumberOfMinutes)
		End if 
		//NOTE THIS DOES NOT SET THE END TIME-the amount of time was only being used above to find a long enough slot to default to
		[DIARY:12]Time_Do_From:6:=$_ti_TimeStart
		If ($_bo_RecordDoneTimeDate)
			[DIARY:12]Time_Done_From:7:=[DIARY:12]Time_Do_To:35
		End if 
	Else 
		[DIARY:12]Time_Do_From:6:=Current time:C178(*)
	End if 
End if 

If (False:C215)
	//From revised code combine with above
	$_l_Ref:=Find in array:C230($_at_AttributeNames; "Amount of Time Type")
	If ($_l_Ref>0)  //
		$_l_AmountofTimeType:=OB Get:C1224([DIARY:12]Attributes:79; "Amount of Time Type")
	End if 
	$_l_Ref:=Find in array:C230($_at_AttributeNames; "Amount of Time")
	If ($_l_Ref>0)  //
		$_l_AmountofTime:=OB Get:C1224([DIARY:12]Attributes:79; "Amount of TimeType")
	End if 
	$_l_Ref:=Find in array:C230($_at_AttributeNames; "Start Time")
	If ($_l_Ref>0)  //
		$_ti_StartTime:=OB Get:C1224([DIARY:12]Attributes:79; "Start Time")
	End if 
	$_l_Ref:=Find in array:C230($_at_AttributeNames; "End Time")
	If ($_l_Ref>0)  //
		$_ti_EndTimeTime:=OB Get:C1224([DIARY:12]Attributes:79; "End Time")
	End if 
	If ([DIARY:12]Date_Do_From:4=!00-00-00!) & ([DIARY:12]Date_Do_To:33=!00-00-00!) & ([DIARY:12]Time_Do_From:6=?00:00:00?) & ([DIARY:12]Time_Do_To:35=?00:00:00?) & ([DIARY:12]Date_Do_From:4=!00-00-00!) & ([DIARY:12]Date_Do_To:33=!00-00-00!) & ([DIARY:12]Time_Do_From:6=?00:00:00?) & ([DIARY:12]Time_Do_To:35=?00:00:00?)
		
		
		
		
		If ($_l_AmountofTime>0)
			
			Case of 
				: ($_l_AmountofTimeType=2)  //Days
					[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4+$_l_AmountofTime
					If ($_ti_StartTime#?00:00:00?)
						[DIARY:12]Time_Do_From:6:=$_ti_StartTime
					Else 
						//day start time
						SD_LoadPrefs([DIARY:12]PersonID:56)
						[DIARY:12]Time_Do_From:6:=SD_ti_SettingsTimeStart
						
						//$_l_REF:=FIND IN ARRAY(SD_at_ActionCodes;[DIARY]Action_Code)
						//$TimeDoTo:=SD_GETAVAILABLETIMESLOT ([DIARY]Person;[DIARY]Date_Do_From;[DIARY]Time_Do_From;SD_al_ActionTime{$_l_REF})
						
						
						
						
					End if 
					If ($_ti_EndTimeTime#?00:00:00?)
						[DIARY:12]Time_Do_To:35:=$_ti_EndTimeTime
					Else 
						SD_LoadPrefs([DIARY:12]PersonID:56)
						[DIARY:12]Time_Do_To:35:=SD_ti_SettingsTimeEnd
					End if 
					
				: ($_l_AmountofTimeType=1)  //minutes
					If ($_ti_StartTime#?00:00:00?)
						
					Else 
						SD_LoadPrefs([DIARY:12]PersonID:56)
						[DIARY:12]Time_Do_From:6:=SD_ti_SettingsTimeStart
						
						//$_l_REF:=FIND IN ARRAY(SD_at_ActionCodes;[DIARY]Action_Code)
						//$TimeDoTo:=SD_GETAVAILABLETIMESLOT ([DIARY]Person;[DIARY]Date_Do_From;[DIARY]Time_Do_From;SD_al_ActionTime{$_l_REF})
						
					End if 
					If ($_ti_EndTimeTime=?00:00:00?)
						
						
					Else 
						
					End if 
					
				: ($_l_AmountofTimeType=0)
					
				Else 
					//Minutes
					
			End case 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("SD_SetDiaryDateTime"; $_t_oldMethodName)
