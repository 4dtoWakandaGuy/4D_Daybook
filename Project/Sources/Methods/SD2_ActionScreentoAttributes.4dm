//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_ActionScreentoAttributes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2010 09:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	ARRAY LONGINT:C221($_al_LocationRefs; 0)
	//ARRAY LONGINT(SD2_al_ActionDisplayColour;0)
	//ARRAY LONGINT(SD2_al_ActionDIsplayStatusID;0)
	//ARRAY LONGINT(SD2_al_ActionDisplaytime;0)
	//ARRAY LONGINT(SD2_al_ActionDisplayTimeType;0)
	//ARRAY LONGINT(SD2_al_ActionREALFieldNum;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldType;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY LONGINT(SD2_al_FieldNum;0)
	//ARRAY LONGINT(SD2_al_mIgnore;0)
	//ARRAY LONGINT(SD2_al_mWhen;0)
	//ARRAY LONGINT(SD2_al_rTableNUMs;0)
	//ARRAY LONGINT(SD2_al_WhoseDiary;0)
	//ARRAY REAL(SD2_ar_ActionVirtFieldDataREAL;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataMA;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_RecordCode;0)
	//ARRAY TEXT(SD2_at_ResultCodes;0)
	//ARRAY TEXT(SD2_at_ScriptCodes;0)
	//ARRAY TEXT(SD2_at_ScriptNames;0)
	//ARRAY TEXT(SD2_at_TimeType;0)
	//ARRAY TEXT(SD2_at_TimeType2;0)
	C_LONGINT:C283($_l_ActionIndex; $_l_BuildIndex; $_l_CurrentRow; $_l_Delete; $_l_Insert; $_l_ItemPosition; $_l_ItemPosition2; $_l_ItemPosition3; $_l_ItemPosition4; $_l_SizeofArray; CB_l_ExcludeNonWorking)
	C_LONGINT:C283(CB_l_FieldLevelMacros; CB_l_GetTimeValues; CB_l_IgnoreStdMacros; CB_l_RecordTime; CB_l_SetReminder; CB_l_WPDescription; SD_l_DayEnd; SD_l_DayStart; SD2_l_ActionCLassID; SD2_l_ActionTypeID; SD2_l_autoActionCode)
	C_LONGINT:C283(SD2_l_CBPostAction; SD2_l_CBThreaded; SD2_l_ReminderTime; SD2_l_TimeAmount; sRB_l_Original)
	C_POINTER:C301($_ptr_Field)
	C_REAL:C285(SD2_R_TimeUnits; SD2_R_TimeValue)
	C_TEXT:C284($_t_JobStageCode; $_t_oldMethodName; SD2_t_AutoResult; SD2_t_EntryForm; SD2_t_TUMacroCode)
	C_TIME:C306(SD2_ti_TimeEnd; SD2_ti_TimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_ActionScreentoAttributes")
For ($_l_ActionIndex; 1; Get last field number:C255(Table:C252(->[ACTIONS:13])))
	$_l_ItemPosition:=Find in array:C230(SD2_al_ActionREALFieldNum; $_l_ActionIndex)
	If ($_l_ItemPosition>0)
		$_ptr_Field:=Field:C253(Table:C252(->[ACTIONS:13]); $_l_ActionIndex)
		Case of 
			: (SD2_al_ActionVirtFieldType{$_l_ItemPosition}=9)
				
				Case of 
					: (Type:C295($_ptr_Field->)=Is boolean:K8:9)
						SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=Num:C11($_ptr_Field->)
					: (Type:C295($_ptr_Field->)=Is longint:K8:6)
						SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=($_ptr_Field->)
				End case 
				
			: (SD2_al_ActionVirtFieldType{$_l_ItemPosition}=21)
				
				SD2_at_ActionVirtFieldDataTXT{$_l_ItemPosition}:=$_ptr_Field->
			: (SD2_al_ActionVirtFieldType{$_l_ItemPosition}=2)
				
				SD2_at_ActionVirtFieldDataTXT{$_l_ItemPosition}:=$_ptr_Field->
			: (SD2_al_ActionVirtFieldType{$_l_ItemPosition}=1)
				SD2_ar_ActionVirtFieldDataREAL{$_l_ItemPosition}:=$_ptr_Field->
				
		End case 
		
	End if 
	
	
End for 

//Now deal with the virtual fields
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Type ID")
If ($_l_ItemPosition>0)  //It should be
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=SD2_l_ActionTypeID
	//And look up the string
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Done Action")
If ($_l_ItemPosition>0)  //It should be
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=SD2_l_CBPostAction
	
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
If ($_l_ItemPosition>0)
	ARRAY LONGINT:C221($_al_LocationRefs; Size of array:C274(SD2_aI_DiaryLocationsSEL))
	$_l_CurrentRow:=0
	For ($_l_BuildIndex; 1; Size of array:C274(SD2_aI_DiaryLocationsSEL))
		If (SD2_aI_DiaryLocationsSEL{$_l_BuildIndex}=1)
			$_l_CurrentRow:=$_l_CurrentRow+1
			$_al_LocationRefs{$_l_CurrentRow}:=SD2_al_DiaryLocations{$_l_BuildIndex}
		End if 
	End for 
	ARRAY LONGINT:C221($_al_LocationRefs; $_l_CurrentRow)
	
	If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})<Size of array:C274($_al_LocationRefs))
		$_l_SizeofArray:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})
		$_l_Insert:=(Size of array:C274($_al_LocationRefs))-(Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}))
		INSERT IN ARRAY:C227(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Insert)
	Else 
		If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})>Size of array:C274($_al_LocationRefs))
			$_l_SizeofArray:=Size of array:C274($_al_LocationRefs)
			$_l_Delete:=(Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}))-(Size of array:C274($_al_LocationRefs))
			DELETE FROM ARRAY:C228(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Delete)
		End if 
		
	End if 
	For ($_l_ActionIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}))
		SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}{$_l_ActionIndex}:=$_al_LocationRefs{$_l_ActionIndex}
	End for 
	
Else 
	
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded")
If ($_l_ItemPosition>0)
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=SD2_l_CBThreaded
End if 

$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded View Option")
If ($_l_ItemPosition>0)
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=sRB_l_Original
End if 


$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Class ID")
If ($_l_ItemPosition>0)
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=SD2_l_ActionCLassID
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Amount of Time")
If ($_l_ItemPosition>0)
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=SD2_l_TimeAmount
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Amount of Time Type")
If ($_l_ItemPosition>0)
	Case of 
		: (SD2_at_TimeType=3)
			SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=2
		: (SD2_at_TimeType=2)
			SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=1
		: (SD2_at_TimeType=1)
			SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=0
		Else 
			SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=1
	End case 
	
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Start Time")
If ($_l_ItemPosition>0)
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=SD2_ti_TimeStart*1
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "End Time")
If ($_l_ItemPosition>0)
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=SD2_ti_TimeEnd*1
	
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Start Day")
If ($_l_ItemPosition>0)
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=SD_l_DayStart
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "End Day")
If ($_l_ItemPosition>0)
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=SD_l_DayEnd
	
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Reminder")
If ($_l_ItemPosition>0)
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=CB_l_SetReminder
End if 

$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Reminder TIme")
If ($_l_ItemPosition>0)
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=SD2_l_ReminderTime
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Reminder TIme Type")
If ($_l_ItemPosition>0)
	Case of 
		: (SD2_at_TimeType=3)
			SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=2
			
		: (SD2_at_TimeType2=2)
			SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=1
		: (SD2_at_TimeType2=1)
			SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=0
		Else 
			SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=0
	End case 
	
End if 


$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Exclude NON working Days")
If ($_l_ItemPosition>0)
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=CB_l_ExcludeNonWorking
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Whose Diaries")
If ($_l_ItemPosition>0)
	If ((Size of array:C274(SD2_al_WhoseDiary))>(Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})))
		$_l_SizeofArray:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})
		$_l_Insert:=Size of array:C274(SD2_al_WhoseDiary)-(Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}))
		INSERT IN ARRAY:C227(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Insert)
	End if 
	If (Size of array:C274(SD2_al_WhoseDiary)<Size of array:C274(SD2_al_ActionVirtFieldDataMany{$_l_ItemPosition}))
		$_l_SizeofArray:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})
		$_l_Delete:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})-Size of array:C274(SD2_al_WhoseDiary)
		DELETE FROM ARRAY:C228(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Delete)
	End if 
	For ($_l_ActionIndex; 1; Size of array:C274(SD2_al_WhoseDiary))
		SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}{$_l_ActionIndex}:=SD2_al_WhoseDiary{$_l_ActionIndex}
	End for 
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Use WP for action Description")
If ($_l_ItemPosition>0)
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=CB_l_WPDescription
End if 

$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Static Record Fields")
$_l_ItemPosition2:=Find in array:C230(SD2_at_ActionVirtFieldName; "Static Record Codes")
If ($_l_ItemPosition>0)
	If ((Size of array:C274(SD2_al_FieldNum))>(Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition})))
		$_l_SizeofArray:=Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition})
		$_l_Insert:=Size of array:C274(SD2_al_FieldNum)-(Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition}))
		INSERT IN ARRAY:C227(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Insert)
		INSERT IN ARRAY:C227(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition2}; $_l_SizeofArray+1; $_l_Insert)
	Else 
		If ((Size of array:C274(SD2_al_FieldNum))>(Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition2})))
			$_l_SizeofArray:=Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition2})
			$_l_Insert:=Size of array:C274(SD2_al_FieldNum)-(Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition2}))
			INSERT IN ARRAY:C227(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition2}; $_l_SizeofArray+1; $_l_Insert)
		End if 
	End if 
	If (Size of array:C274(SD2_al_FieldNum)<Size of array:C274(SD2_al_ActionVirtFieldDataMany{$_l_ItemPosition}))
		$_l_SizeofArray:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})
		$_l_Delete:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})-Size of array:C274(SD2_al_FieldNum)
		DELETE FROM ARRAY:C228(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Delete)
		DELETE FROM ARRAY:C228(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Delete)
	Else 
		
	End if 
	
	For ($_l_ActionIndex; 1; Size of array:C274(SD2_al_FieldNum))
		SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}{$_l_ActionIndex}:=SD2_al_FieldNum{$_l_ActionIndex}
		SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition2}{$_l_ActionIndex}:=SD2_at_RecordCode{$_l_ActionIndex}
	End for 
	
	
	
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Time Units")
If ($_l_ItemPosition>0)
	SD2_ar_ActionVirtFieldDataREAL{$_l_ItemPosition}:=SD2_R_TimeUnits
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Time Units Value")
If ($_l_ItemPosition>0)
	SD2_ar_ActionVirtFieldDataREAL{$_l_ItemPosition}:=SD2_R_TimeValue
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Time Units Macro Code")
If ($_l_ItemPosition>0)
	SD2_at_ActionVirtFieldDataTXT{$_l_ItemPosition}:=SD2_t_TUMacroCode
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Use Job Stage Rates")
If ($_l_ItemPosition>0)
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=CB_l_GetTimeValues
	
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Record Time_In Job Stage")
If ($_l_ItemPosition>0)
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=CB_l_RecordTime
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=CB_l_RecordTime
	If (CB_l_RecordTime=1)
		$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Associated Job Stage Type")
		If ($_l_ItemPosition>0)
			SD2_at_ActionVirtFieldDataTXT{$_l_ItemPosition}:=$_t_JobStageCode
			
		End if 
	Else 
		//Time Recording off for this action so make sure no job stage type either
		$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Associated Job Stage Type")
		If ($_l_ItemPosition>0)
			SD2_at_ActionVirtFieldDataTXT{$_l_ItemPosition}:=""
			
		End if 
	End if 
	
End if 

$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Restrict Table")
If ($_l_ItemPosition>0)
	If ((Size of array:C274(SD2_al_rTableNUMs)))>(Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}))
		$_l_SizeofArray:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})
		$_l_Insert:=Size of array:C274(SD2_al_rTableNUMs)-(Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}))
		INSERT IN ARRAY:C227(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Insert)
	End if 
	If (Size of array:C274(SD2_al_rTableNUMs)<Size of array:C274(SD2_al_ActionVirtFieldDataMany{$_l_ItemPosition}))
		$_l_SizeofArray:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})
		$_l_Delete:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})-Size of array:C274(SD2_al_rTableNUMs)
		DELETE FROM ARRAY:C228(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Delete)
	End if 
	For ($_l_ActionIndex; 1; Size of array:C274(SD2_al_rTableNUMs))
		SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}{$_l_ActionIndex}:=SD2_al_rTableNUMs{$_l_ActionIndex}
	End for 
	
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Codes")
$_l_ItemPosition2:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Names")
$_l_ItemPosition3:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Event")
$_l_ItemPosition4:=Find in array:C230(SD2_at_ActionVirtFieldName; "Ignore Other Macros")
If ($_l_ItemPosition>0)
	If ((Size of array:C274(SD2_at_ScriptCodes))>(Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition})))
		$_l_SizeofArray:=Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition})
		$_l_Insert:=Size of array:C274(SD2_at_ScriptCodes)-(Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition}))
		INSERT IN ARRAY:C227(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Insert)
		INSERT IN ARRAY:C227(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition2}; $_l_SizeofArray+1; $_l_Insert)
		INSERT IN ARRAY:C227(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition3}; $_l_SizeofArray+1; $_l_Insert)
		INSERT IN ARRAY:C227(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition4}; $_l_SizeofArray+1; $_l_Insert)
	End if 
	If (Size of array:C274(SD2_at_ScriptCodes)<Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition}))
		$_l_SizeofArray:=Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition})
		$_l_Delete:=Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition})-Size of array:C274(SD2_at_ScriptCodes)
		DELETE FROM ARRAY:C228(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Delete)
		DELETE FROM ARRAY:C228(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition2}; $_l_SizeofArray+1; $_l_Delete)
		DELETE FROM ARRAY:C228(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition3}; $_l_SizeofArray+1; $_l_Delete)
		DELETE FROM ARRAY:C228(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition4}; $_l_SizeofArray+1; $_l_Delete)
	End if 
	
	For ($_l_ActionIndex; 1; Size of array:C274(SD2_at_ScriptCodes))
		SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition}{$_l_ActionIndex}:=SD2_at_ScriptCodes{$_l_ActionIndex}
		SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition2}{$_l_ActionIndex}:=SD2_at_ScriptNames{$_l_ActionIndex}
		SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition3}{$_l_ActionIndex}:=SD2_al_mWhen{$_l_ActionIndex}
		SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition4}{$_l_ActionIndex}:=SD2_al_mIgnore{$_l_ActionIndex}
		
	End for 
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Level Field Macros")
If ($_l_ItemPosition>0)
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=CB_l_FieldLevelMacros
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Ignore Other Macros")
If ($_l_ItemPosition>0)
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=CB_l_IgnoreStdMacros
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Result Codes")
If ($_l_ItemPosition>0)
	If ((Size of array:C274(SD2_at_ResultCodes))>(Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition})))
		$_l_SizeofArray:=Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition})
		$_l_Insert:=Size of array:C274(SD2_at_ResultCodes)-(Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition}))
		INSERT IN ARRAY:C227(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Insert)
	End if 
	If (Size of array:C274(SD2_at_ResultCodes)<Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition}))
		$_l_SizeofArray:=Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition})
		$_l_Delete:=Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition})-Size of array:C274(SD2_at_ResultCodes)
		DELETE FROM ARRAY:C228(SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Delete)
	End if 
	For ($_l_ActionIndex; 1; Size of array:C274(SD2_at_ResultCodes))
		SD2_at_ActionVirtFieldDataMA{$_l_ItemPosition}{$_l_ActionIndex}:=SD2_at_ResultCodes{$_l_ActionIndex}
	End for 
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Post Time processing Action")
If ($_l_ItemPosition>0)
	SD2_al_ActionVirtFieldDataLong{$_l_ItemPosition}:=SD2_l_autoActionCode
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Auto Result Code")
If ($_l_ItemPosition>0)
	SD2_at_ActionVirtFieldDataTXT{$_l_ItemPosition}:=SD2_t_AutoResult
End if 


$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
If ($_l_ItemPosition>0)
	SD2_at_ActionVirtFieldDataTXT{$_l_ItemPosition}:=SD2_t_EntryForm
End if 
//``
//``
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Status")
If ($_l_ItemPosition>0)
	If ((Size of array:C274(SD2_al_ActionDIsplayStatusID))>(Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})))
		$_l_SizeofArray:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})
		$_l_Insert:=Size of array:C274(SD2_al_ActionDIsplayStatusID)-(Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}))
		INSERT IN ARRAY:C227(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Insert)
	End if 
	If (Size of array:C274(SD2_al_ActionDIsplayStatusID)<Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}))
		$_l_SizeofArray:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})
		$_l_Delete:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})-Size of array:C274(SD2_al_ActionDIsplayStatusID)
		DELETE FROM ARRAY:C228(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Delete)
	End if 
	For ($_l_ActionIndex; 1; Size of array:C274(SD2_al_ActionDIsplayStatusID))
		SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}{$_l_ActionIndex}:=SD2_al_ActionDIsplayStatusID{$_l_ActionIndex}
	End for 
End if 
$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Status Colour")
If ($_l_ItemPosition>0)
	If ((Size of array:C274(SD2_al_ActionDisplayColour))>(Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})))
		$_l_SizeofArray:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})
		$_l_Insert:=Size of array:C274(SD2_al_ActionDisplayColour)-(Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}))
		INSERT IN ARRAY:C227(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Insert)
	End if 
	If (Size of array:C274(SD2_al_ActionDisplayColour)<Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}))
		$_l_SizeofArray:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})
		$_l_Delete:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})-Size of array:C274(SD2_al_ActionDisplayColour)
		DELETE FROM ARRAY:C228(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Delete)
	End if 
	For ($_l_ActionIndex; 1; Size of array:C274(SD2_al_ActionDisplayColour))
		SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}{$_l_ActionIndex}:=SD2_al_ActionDisplayColour{$_l_ActionIndex}
	End for 
End if 

$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Status Timing Type")
If ($_l_ItemPosition>0)
	If ((Size of array:C274(SD2_al_ActionDisplayTimeType))>(Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})))
		$_l_SizeofArray:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})
		$_l_Insert:=Size of array:C274(SD2_al_ActionDisplayTimeType)-(Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}))
		INSERT IN ARRAY:C227(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Insert)
	End if 
	If (Size of array:C274(SD2_al_ActionDisplayTimeType)<Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}))
		$_l_SizeofArray:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})
		$_l_Delete:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})-Size of array:C274(SD2_al_ActionDisplayTimeType)
		DELETE FROM ARRAY:C228(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Delete)
	End if 
	For ($_l_ActionIndex; 1; Size of array:C274(SD2_al_ActionDisplayTimeType))
		SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}{$_l_ActionIndex}:=SD2_al_ActionDisplayTimeType{$_l_ActionIndex}
	End for 
End if 

$_l_ItemPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Status Timing")
If ($_l_ItemPosition>0)
	If ((Size of array:C274(SD2_al_ActionDisplaytime))>(Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})))
		$_l_SizeofArray:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})
		$_l_Insert:=Size of array:C274(SD2_al_ActionDisplaytime)-(Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}))
		INSERT IN ARRAY:C227(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Insert)
	End if 
	If (Size of array:C274(SD2_al_ActionDisplaytime)<Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}))
		$_l_SizeofArray:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})
		$_l_Delete:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition})-Size of array:C274(SD2_al_ActionDisplaytime)
		DELETE FROM ARRAY:C228(SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}; $_l_SizeofArray+1; $_l_Delete)
	End if 
	For ($_l_ActionIndex; 1; Size of array:C274(SD2_al_ActionDisplaytime))
		SD2_al_ActionVirtFieldDataMANY{$_l_ItemPosition}{$_l_ActionIndex}:=SD2_al_ActionDisplaytime{$_l_ActionIndex}
	End for 
End if 
//Now turn that into an object





//``
ERR_MethodTrackerReturn("SD2_ActionScreentoAttributes"; $_t_oldMethodName)
