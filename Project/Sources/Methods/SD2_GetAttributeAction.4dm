//%attributes = {}

If (False:C215)
	//Database Method Name:      SD2_GetAttributeAction
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  24/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ObjectPropertyType; 0)
	ARRAY LONGINT:C221($_al_PersonIDS; 0)
	ARRAY LONGINT:C221($_al_PrefsDataTypes; 0)
	//ARRAY LONGINT(SD2_al_ActionREALFieldNum;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldType;0)
	//ARRAY REAL(SD2_ar_ActionVirtFieldDataREAL;0)
	ARRAY TEXT:C222($_at_ObjectProperties; 0)
	ARRAY TEXT:C222($_at_PrefsProperties; 0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_WorkFriday; $_bo_WorkMonday; $_bo_WorkSaturday; $_bo_WorkSUnday; $_bo_WorkThursday; $_bo_WorkTuesday; $_bo_WorkWednesday; $_bo_WorSunday)
	C_LONGINT:C283($_l_Days; $_l_Index; $_l_offset; $_l_RecordsCount; $_l_Ref; $_l_TableNumber; $_l_TakeOutDays; $_l_TimeTaken)
	C_OBJECT:C1216($_obj_DiaryPreferences)
	C_POINTER:C301($_ptr_FieldPointer; $_ptr_ObjectPointer; $_ptr_ReturnValue; $3)
	C_TEXT:C284($_t_actionCode; $_t_AttributeFieldName; $_t_oldMethodName; $1; $2)
	C_TIME:C306($_ti_TimeEnd; $_ti_TimePerDay; $_ti_TimeStart)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD2_GetAttributeAction")
//note that when we create a diary record we copy the attributes so within a diary we can get the attributes for an action as they existed at the time the record was existed
//if $1 is empty then we will get the data from the CURRENT record in the diary rather than the action
$_t_actionCode:=$1
$_t_AttributeFieldName:=$2
$_ptr_ReturnValue:=$3  //this has to be a pointer as it may be a single value or multiple values.
$_l_TableNumber:=Table:C252(->[DIARY:12])
If ($_t_actionCode="")
	$_bo_Continue:=True:C214
	$_ptr_ObjectPointer:=->[DIARY:12]Attributes:79
	
Else 
	$_bo_Continue:=False:C215
	If ([ACTIONS:13]Action_Code:1#$_t_actionCode)
		QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_t_actionCode)
		If (Records in selection:C76([ACTIONS:13])=0)
			If ([DIARY:12]Diary_Code:3#$_t_actionCode)
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_RecordsCount)
				QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_actionCode)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_RecordsCount>0)
					QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_actionCode)
					$_ptr_ObjectPointer:=->[DIARY:12]Attributes:79
					$_bo_Continue:=True:C214
				Else 
					Gen_Alert("No Matching action or Diary Record")  //this should never happen
				End if 
			Else 
				$_ptr_ObjectPointer:=->[DIARY:12]Attributes:79
				$_bo_Continue:=True:C214
			End if 
		Else 
			$_ptr_ObjectPointer:=->[ACTIONS:13]AttributesObject:42
			$_bo_Continue:=True:C214
			$_l_TableNumber:=Table:C252(->[ACTIONS:13])
		End if 
	Else 
		$_ptr_ObjectPointer:=->[ACTIONS:13]AttributesObject:42
		$_bo_Continue:=True:C214
		$_l_TableNumber:=Table:C252(->[ACTIONS:13])
	End if 
End if 
If ($_bo_Continue)
	OB GET PROPERTY NAMES:C1232($_ptr_ObjectPointer->; $_at_ObjectProperties; $_al_ObjectPropertyType)
	$_l_Ref:=Find in array:C230($_at_ObjectProperties; $_t_AttributeFieldName)
	If ($_l_ref>0)
		//note that in V17 we can do even better and store the group of arrays or an attribute in a collections
		Case of 
			: ($_al_ObjectPropertyType{$_l_ref}=Is longint:K8:6)
				If (Type:C295($_ptr_ReturnValue->)=Is longint:K8:6)
					$_ptr_ReturnValue->:=OB Get:C1224($_ptr_ObjectPointer->; $_t_AttributeFieldName)
				End if 
			: ($_al_ObjectPropertyType{$_l_ref}=Is text:K8:3)
				If (Type:C295($_ptr_ReturnValue->)=Is text:K8:3)
					$_ptr_ReturnValue->:=OB Get:C1224($_ptr_ObjectPointer->; $_t_AttributeFieldName)
				End if 
			: ($_al_ObjectPropertyType{$_l_ref}=Is real:K8:4)
				If (Type:C295($_ptr_ReturnValue->)=Is real:K8:4)
					$_ptr_ReturnValue->:=OB Get:C1224($_ptr_ObjectPointer->; $_t_AttributeFieldName)
				End if 
			: ($_al_ObjectPropertyType{$_l_ref}=LongInt array:K8:19)
				If (Type:C295($_ptr_ReturnValue->)=LongInt array:K8:19)
					OB GET ARRAY:C1229($_ptr_ObjectPointer->; $_t_AttributeFieldName; $_ptr_ReturnValue->)
				End if 
			: ($_al_ObjectPropertyType{$_l_ref}=Real array:K8:17)
				If (Type:C295($_ptr_ReturnValue->)=Real array:K8:17)
					OB GET ARRAY:C1229($_ptr_ObjectPointer->; $_t_AttributeFieldName; $_ptr_ReturnValue->)
				End if 
			: ($_al_ObjectPropertyType{$_l_ref}=Text array:K8:16)
				If (Type:C295($_ptr_ReturnValue->)=Text array:K8:16)
					OB GET ARRAY:C1229($_ptr_ObjectPointer->; $_t_AttributeFieldName; $_ptr_ReturnValue->)
				End if 
		End case 
		
	Else 
		//we might be able to get this from a field IF this is an action
		If ($_l_TableNumber=Table:C252(->[ACTIONS:13]))
			$_l_offset:=SD2_ActionFields
			$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; $_t_AttributeFieldName)
			If ($_l_Ref>0)
				If (SD2_al_ActionREALFieldNum{$_l_Ref}>0)  //its a real field
					$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Ref})
					Case of 
						: (SD2_al_ActionVirtFieldType{$_l_Ref}=9)
							$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Ref})
							Case of 
								: (Type:C295($_ptr_FieldPointer->)=Is boolean:K8:9)
									SD2_al_ActionVirtFieldDataLong{$_l_Ref}:=Num:C11($_ptr_FieldPointer->)
								: (Type:C295($_ptr_FieldPointer->)=Is longint:K8:6)
									SD2_al_ActionVirtFieldDataLong{$_l_Ref}:=($_ptr_FieldPointer->)
							End case 
							
						: (SD2_al_ActionVirtFieldType{$_l_Ref}=21) | (SD2_al_ActionVirtFieldType{$_l_Ref}=2)
							$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Ref})
							SD2_at_ActionVirtFieldDataTXT{$_l_Ref}:=$_ptr_FieldPointer->
							
						: (SD2_al_ActionVirtFieldType{$_l_Ref}=1)
							$_ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_Ref})
							SD2_ar_ActionVirtFieldDataREAL{$_l_Ref}:=$_ptr_FieldPointer->
							
					End case 
					
					
					
					
					
				End if 
			End if 
		Else 
			//we are. looking at the diary-so we can get the diary value of some of these fields
			
			
			Case of 
				: ($_t_AttributeFieldName="Action Code")
					$_ptr_FieldPointer->:=[DIARY:12]Action_Code:9
				: ($_t_AttributeFieldName="Action Name")
					///have to get from action
					If ([ACTIONS:13]Action_Code:1#[DIARY:12]Action_Code:9)
						QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
					End if 
					$_ptr_FieldPointer->:=[ACTIONS:13]Action_Name:2
				: ($_t_AttributeFieldName="Document Code")
					$_ptr_FieldPointer->:=[DIARY:12]Document_Code:15
				: ($_t_AttributeFieldName="Priority")
					$_ptr_FieldPointer->:=[DIARY:12]Priority:17
				: ($_t_AttributeFieldName="Default Description")  //or do we want the current description???
					If ([DIARY:12]Action_Details:10="")
						If ([ACTIONS:13]Action_Code:1#[DIARY:12]Action_Code:9)
							QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
						End if 
						$_ptr_FieldPointer->:=[ACTIONS:13]Default_Description:6
					Else 
						$_ptr_FieldPointer->:=[DIARY:12]Action_Details:10
					End if 
				: ($_t_AttributeFieldName="WP Action")  //if the action is a WP action this means the action is to send a letter-at one point there was an action code on the prefs and that was the letter action code-this was not used with the 4D write wp actions
					If ([ACTIONS:13]Action_Code:1#[DIARY:12]Action_Code:9)
						QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
					End if 
					$_ptr_FieldPointer->:=[ACTIONS:13]DocumentManager_Action:7
				: ($_t_AttributeFieldName="Exclude from Adder")
					If ([ACTIONS:13]Action_Code:1#[DIARY:12]Action_Code:9)
						QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
					End if 
					If (Type:C295($_ptr_FieldPointer->)=Is boolean:K8:9)
						$_ptr_FieldPointer->:=[ACTIONS:13]DocumentManager_Action:7
					Else 
						$_ptr_FieldPointer->:=Num:C11([ACTIONS:13]DocumentManager_Action:7)
					End if 
				: ($_t_AttributeFieldName="Action Type ID")
					//see SD2_LoadDiaryTypes and SD2_LoadDiaryActionClasses  by default there are Sheduled Items, workflow items, notes items these can be extended though
					//do not confuse the diary type(workflow etc) with the Diary Locations.-diary locations is a string its a virtual field on the actions-it means that we can have a workflow action appear not in the workflow etc
					$_ptr_FieldPointer->:=[DIARY:12]xDiaryClass:65
					
				: ($_t_AttributeFieldName="Action Locations")  //if the action is a WP action this means the action is to send a letter-at one point there was an action code on the prefs and that was the letter action code-this was not used with the 4D write wp actions
					//see SD2_LoadDiaryLocations
					$_ptr_FieldPointer->:=[DIARY:12]xDiaryLocations:81  //this is a binary construction allowing up to 32 diary types
				: ($_t_AttributeFieldName="Threaded")
					$_ptr_FieldPointer->:=([DIARY:12]x_Is_Thread:68) | ([DIARY:12]ThreadID:64#0)  //THIS DIARY IS THE THREAD ITEM OR IT IS PART OF A THREAD
				: ($_t_AttributeFieldName="Threaded View Option")
					$_ptr_FieldPointer->:=([DIARY:12]XShowRelatedTable:82>0)
					If (Type:C295($_ptr_FieldPointer->)=Is boolean:K8:9)
						$_ptr_FieldPointer->:=([DIARY:12]XShowRelatedTable:82>0)
					Else 
						$_ptr_FieldPointer->:=Num:C11([DIARY:12]XShowRelatedTable:82>0)
						
					End if 
				: ($_t_AttributeFieldName="Action Class ID")
					//class of action-the class of action only exists if the action gets its settings from a template action-in which all the fields will be locked
					//so by definition it does not exist on the diary-note that when a template is changed all the actions that have that template class must update
				: ($_t_AttributeFieldName="Amount of Time")
					$_obj_DiaryPreferences:=SD_LoadPrefs([DIARY:12]PersonID:56)
					OB GET PROPERTY NAMES:C1232($_obj_DiaryPreferences; $_at_PrefsProperties; $_al_PrefsDataTypes)
					$_bo_WorkSaturday:=True:C214
					$_bo_WorkSUnday:=True:C214
					$_bo_WorkMonday:=True:C214
					$_bo_WorkTuesday:=True:C214
					$_bo_WorkWednesday:=True:C214
					$_bo_WorkThursday:=True:C214
					$_bo_WorkFriday:=True:C214
					If (Find in array:C230($_at_PrefsProperties; "WorkSaturday")>0)
						$_bo_WorkSaturday:=OB Get:C1224($_obj_DiaryPreferences; "WorkSaturday")
					End if 
					If (Find in array:C230($_at_PrefsProperties; "WorkSunday")>0)
						$_bo_WorkSunday:=OB Get:C1224($_obj_DiaryPreferences; "WorkSunday")
					End if 
					If (Find in array:C230($_at_PrefsProperties; "WorkMonday")>0)
						$_bo_WorkMonday:=OB Get:C1224($_obj_DiaryPreferences; "WorkMonday")
					End if 
					If (Find in array:C230($_at_PrefsProperties; "WorkTuesday")>0)
						$_bo_WorkTuesday:=OB Get:C1224($_obj_DiaryPreferences; "WorkTuesday")
					End if 
					If (Find in array:C230($_at_PrefsProperties; "WorkWednesday")>0)
						$_bo_WorkWednesday:=OB Get:C1224($_obj_DiaryPreferences; "WorkWednesday")
					End if 
					If (Find in array:C230($_at_PrefsProperties; "WorkThursday")>0)
						$_bo_WorkThursday:=OB Get:C1224($_obj_DiaryPreferences; "WorkThursday")
					End if 
					//if the diary is 'done' then this is the amount of time it took if it is not done it is the amount of time it is planned to take
					If ([DIARY:12]Done:14)
						If ([DIARY:12]Date_Done_To:34>[DIARY:12]Date_Done_From:5)
							$_l_Days:=[DIARY:12]Date_Done_To:34-[DIARY:12]Date_Done_From:5
							$_l_TakeOutDays:=0
							For ($_l_Index; 1; $_l_Days)
								Case of 
									: (Day number:C114([DIARY:12]Date_Done_From:5+$_l_Index)=Saturday:K10:18) & (Not:C34($_bo_WorkSaturday))
										$_l_TakeOutDays:=$_l_TakeOutDays+1
									: (Day number:C114([DIARY:12]Date_Done_From:5+$_l_Index)=Friday:K10:17) & (Not:C34($_bo_WorkFriday))
										$_l_TakeOutDays:=$_l_TakeOutDays+1
									: (Day number:C114([DIARY:12]Date_Done_From:5+$_l_Index)=Thursday:K10:16) & (Not:C34($_bo_WorkThursday))
										$_l_TakeOutDays:=$_l_TakeOutDays+1
									: (Day number:C114([DIARY:12]Date_Done_From:5+$_l_Index)=Wednesday:K10:15) & (Not:C34($_bo_WorkWednesday))
										$_l_TakeOutDays:=$_l_TakeOutDays+1
									: (Day number:C114([DIARY:12]Date_Done_From:5+$_l_Index)=Tuesday:K10:14) & (Not:C34($_bo_WorkTuesday))
										$_l_TakeOutDays:=$_l_TakeOutDays+1
									: (Day number:C114([DIARY:12]Date_Done_From:5+$_l_Index)=Monday:K10:13) & (Not:C34($_bo_WorkMonday))
										$_l_TakeOutDays:=$_l_TakeOutDays+1
									: (Day number:C114([DIARY:12]Date_Done_From:5+$_l_Index)=Sunday:K10:19) & (Not:C34($_bo_WorSunday))
										$_l_TakeOutDays:=$_l_TakeOutDays+1
								End case 
								
							End for 
							$_l_Days:=$_l_Days-$_l_TakeOutDays
							//when an diary is multi day the amount of time might be one hour per day or might be all day.
							If (Not:C34([DIARY:12]DoneAllDay:84))
								$_ti_TimePerDay:=([DIARY:12]Time_Done_To:36-[DIARY:12]Time_Done_From:7)
								$_l_TimeTaken:=$_ti_TimePerDay*$_l_Days
							Else 
								If (Find in array:C230($_at_PrefsProperties; "Day_Start")>0)
									$_ti_TimeStart:=OB Get:C1224($_obj_DiaryPreferences; "Day_Start")
								End if 
								If (Find in array:C230($_at_PrefsProperties; "Day_End")>0)
									$_ti_TimeEnd:=OB Get:C1224($_obj_DiaryPreferences; "Day_End")
								End if 
								$_ti_TimePerDay:=$_ti_TimeEnd-$_ti_TimeStart
								$_l_TimeTaken:=$_ti_TimePerDay*$_l_Days
								
							End if 
							$_ptr_FieldPointer->:=Time:C179($_l_TimeTaken)
							
							
							//$_ti_TimePerDay:=SD2_Setting
							
						Else 
							//its a single day
							$_l_TimeTaken:=([DIARY:12]Time_Done_To:36-[DIARY:12]Time_Done_From:7)*1
							
							$_ptr_FieldPointer->:=Time:C179($_l_TimeTaken)
						End if 
					Else 
						If ([DIARY:12]Date_Do_To:33>[DIARY:12]Date_Do_From:4)
							$_l_Days:=[DIARY:12]Date_Do_To:33-[DIARY:12]Date_Do_From:4
							$_l_TakeOutDays:=0
							For ($_l_Index; 1; $_l_Days)
								Case of 
									: (Day number:C114([DIARY:12]Date_Do_From:4+$_l_Index)=Saturday:K10:18) & (Not:C34($_bo_WorkSaturday))
										$_l_TakeOutDays:=$_l_TakeOutDays+1
									: (Day number:C114([DIARY:12]Date_Do_From:4+$_l_Index)=Friday:K10:17) & (Not:C34($_bo_WorkFriday))
										$_l_TakeOutDays:=$_l_TakeOutDays+1
									: (Day number:C114([DIARY:12]Date_Do_From:4+$_l_Index)=Thursday:K10:16) & (Not:C34($_bo_WorkThursday))
										$_l_TakeOutDays:=$_l_TakeOutDays+1
									: (Day number:C114([DIARY:12]Date_Do_From:4+$_l_Index)=Wednesday:K10:15) & (Not:C34($_bo_WorkWednesday))
										$_l_TakeOutDays:=$_l_TakeOutDays+1
									: (Day number:C114([DIARY:12]Date_Do_From:4+$_l_Index)=Tuesday:K10:14) & (Not:C34($_bo_WorkTuesday))
										$_l_TakeOutDays:=$_l_TakeOutDays+1
									: (Day number:C114([DIARY:12]Date_Do_From:4+$_l_Index)=Monday:K10:13) & (Not:C34($_bo_WorkMonday))
										$_l_TakeOutDays:=$_l_TakeOutDays+1
									: (Day number:C114([DIARY:12]Date_Do_From:4+$_l_Index)=Sunday:K10:19) & (Not:C34($_bo_WorSunday))
										$_l_TakeOutDays:=$_l_TakeOutDays+1
								End case 
								
							End for 
							$_l_Days:=$_l_Days-$_l_TakeOutDays
							//when an diary is multi day the amount of time might be one hour per day or might be all day.
							If (Not:C34([DIARY:12]DoAllDay:83))
								$_ti_TimePerDay:=([DIARY:12]Time_Do_To:35-[DIARY:12]Time_Do_From:6)
								$_l_TimeTaken:=$_ti_TimePerDay*$_l_Days
							Else 
								If (Find in array:C230($_at_PrefsProperties; "Day_Start")>0)
									$_ti_TimeStart:=OB Get:C1224($_obj_DiaryPreferences; "Day_Start")
								End if 
								If (Find in array:C230($_at_PrefsProperties; "Day_End")>0)
									$_ti_TimeEnd:=OB Get:C1224($_obj_DiaryPreferences; "Day_End")
								End if 
								$_ti_TimePerDay:=$_ti_TimeEnd-$_ti_TimeStart
								$_l_TimeTaken:=$_ti_TimePerDay*$_l_Days
								
							End if 
							$_ptr_FieldPointer->:=Time:C179($_l_TimeTaken)
							
							
							//$_ti_TimePerDay:=SD2_Setting
							
						Else 
							//its a single day
							$_l_TimeTaken:=(([DIARY:12]Time_Do_To:35-[DIARY:12]Time_Do_From:6)*1)
							$_ptr_FieldPointer->:=Time:C179($_l_TimeTaken)
						End if 
						
					End if 
				: ($_t_AttributeFieldName="Start Time")
					If ([DIARY:12]Done:14)
						$_ptr_FieldPointer->:=[DIARY:12]Time_Done_From:7
					Else 
						$_ptr_FieldPointer->:=[DIARY:12]Time_Do_From:6
					End if 
				: ($_t_AttributeFieldName="End Time")
					If ([DIARY:12]Done:14)
						$_ptr_FieldPointer->:=[DIARY:12]Time_Done_To:36
					Else 
						$_ptr_FieldPointer->:=[DIARY:12]Time_Do_To:35
					End if 
				: ($_t_AttributeFieldName="Start Day")
					If ([DIARY:12]Done:14)
						$_ptr_FieldPointer->:=Day number:C114([DIARY:12]Date_Done_From:5)
					Else 
						$_ptr_FieldPointer->:=Day number:C114([DIARY:12]Date_Do_From:4)
					End if 
				: ($_t_AttributeFieldName="End Day")
					If ([DIARY:12]Done:14)
						$_ptr_FieldPointer->:=Day number:C114([DIARY:12]Date_Done_To:34)
					Else 
						$_ptr_FieldPointer->:=Day number:C114([DIARY:12]Date_Do_To:33)
					End if 
					
				: ($_t_AttributeFieldName="Reminder")
					If (Type:C295($_ptr_FieldPointer->)=Is boolean:K8:9)
						$_ptr_FieldPointer->:=([DIARY:12]Alarm_Timeframe:48>0)
					Else 
						$_ptr_FieldPointer->:=(Num:C11([DIARY:12]Alarm_Timeframe:48)>0)
					End if 
					
				: ($_t_AttributeFieldName="Reminder Time")
					//Note this is alway in minutes
					$_ptr_FieldPointer->:=[DIARY:12]Alarm_Timeframe:48
				: ($_t_AttributeFieldName="Reminder Time Type")
					$_ptr_FieldPointer->:=1
				: ($_t_AttributeFieldName="Whose Diaries")
					QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]DIARY_CODE:1=[DIARY:12]Diary_Code:3)
					SELECTION TO ARRAY:C260([DIARY_ITEMOWNERS:106]PERSONNEL_ID:2; $_al_PersonIDS)
					//Query with array([PERSONNEL]Personnel_ID;$_al_PersonIDS)
					COPY ARRAY:C226($_al_PersonIDS; $_ptr_FieldPointer->)
					//note that this returns an array of record ids
				: ($_t_AttributeFieldName="Data Entry Form")
					$_ptr_FieldPointer->:=[DIARY:12]xDiaryForm:66
				: ($_t_AttributeFieldName="Use WP for action Description")
					$_ptr_FieldPointer->:=[DIARY:12]WPDataEntry:85
				: ($_t_AttributeFieldName="Time Units")
					$_ptr_FieldPointer->:=[DIARY:12]Units:20
				: ($_t_AttributeFieldName="Time Units Value")
					$_ptr_FieldPointer->:=[DIARY:12]Value:16
				: ($_t_AttributeFieldName="Done Action")
					If (Type:C295($_ptr_FieldPointer->)=Is boolean:K8:9)
						$_ptr_FieldPointer->:=([DIARY:12]Done:14)
						
					Else 
						$_ptr_FieldPointer->:=(Num:C11([DIARY:12]Done:14))
						
					End if 
			End case 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("SD2_GetAttributeAction"; $_t_oldMethodName)