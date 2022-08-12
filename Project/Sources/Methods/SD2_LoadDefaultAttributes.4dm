//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_LoadDefaultAttributes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_Data; 0)
	//ARRAY LONGINT(SD2_al_ActionREALFieldNum;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMA;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldNum;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldType;0)
	//ARRAY LONGINT(SD2_al_ActionVirtualFieldDataST;0)
	//ARRAY LONGINT(SD2_al_EventIDs;0)
	//ARRAY REAL(SD2_ar_ActionVirtFieldDataREAL;0)
	ARRAY TEXT:C222($_at_Data; 0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataMA;0;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataMANY;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	C_BOOLEAN:C305($_bo_ChargableAction; $_bo_Continue; $_bo_DefaultAviodnonWorkingDays; $_bo_DefaultSetReminder; $_bo_DocumentAction; $_bo_ExcludeFromAdder; $_bo_IgnroreDiaryScripts; $_bo_IsThreaed; $_bo_RecordDoneAction; $_bo_RecordJobActivity; $_bo_UseJobStageRates)
	C_BOOLEAN:C305($_bo_UserDiaryActionMacros; SD2_bo_FieldNamesLoaded)
	C_LONGINT:C283($_l_ActionClass; $_l_AddToDiaryID; $_l_AmountOfTime; $_l_AmountofTimeType; $_l_ArraySize; $_l_DefaultDayofWeekEnd; $_l_DefaultDayofWeekStart; $_l_DefaultReminderTime; $_l_DefaultReminderTimeType; $_l_DefaultTimeUnits; $_l_Index)
	C_LONGINT:C283($_l_Index2; $_l_offset; $_l_OverdueAutoAction; $_l_Ref; $_l_TaskDefaultColur; $_l_TimeUnitsValue; $_l_TreadOption; $_l_VirtualFieldNum)
	C_OBJECT:C1216($_obj_Attributes; $_obj_DiaryAttObject; $0)
	C_POINTER:C301($_ptr_DiaryAttObject; $_Ptr_FieldPointer; $1)
	C_TEXT:C284($_t_ActionCode; $_t_ActionName; $_t_AssociatedJobStageType; $_t_AutoResultScript; $_t_ChargeCalculationSript; $_t_DefaultDescription; $_t_DefaultResultCode; $_t_DocumentCode; $_t_Locations; $_t_oldMethodName; $_t_Priority)
	C_TEXT:C284($_t_UseEntryForm)
	C_TIME:C306($_ti_DefaultEndTime; $_ti_DefaultStartTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_LoadDefaultAttributes")
//This method will load all the fields of a SINGLE diary action  to arrays
$_t_ActionCode:=[ACTIONS:13]Action_Code:1
$_t_ActionName:=[ACTIONS:13]Action_Name:2
$_bo_ChargableAction:=[ACTIONS:13]ActionIsChargable:30
$_bo_RecordDoneAction:=[ACTIONS:13]ActionRecordsCompletedEvent:37
$_l_AddToDiaryID:=[ACTIONS:13]ADD_toDiaryID:8
$_t_AutoResultScript:=[ACTIONS:13]AutoResultMacro:29
$_t_ChargeCalculationSript:=[ACTIONS:13]ChargingMacroCode:33
$_l_ActionClass:=[ACTIONS:13]ClassofAction:16
$_l_AmountOfTime:=[ACTIONS:13]Default_Amount_of_Time:17
$_l_AmountofTimeType:=[ACTIONS:13]Default_Amount_of_TimeType:18
$_t_AssociatedJobStageType:=[ACTIONS:13]Default_AssociatedJobStageType:40
$_bo_DefaultAviodnonWorkingDays:=[ACTIONS:13]Default_AvoidnonWorkingDays:26
$_l_DefaultDayofWeekEnd:=[ACTIONS:13]Default_DayofWeekEnd:22
$_l_DefaultDayofWeekStart:=[ACTIONS:13]Default_DayofWeekStart:21
$_t_DefaultDescription:=[ACTIONS:13]Default_Description:6
$_ti_DefaultEndTime:=[ACTIONS:13]Default_EndTime:20
$_l_DefaultReminderTime:=[ACTIONS:13]Default_ReminderTime:24
$_l_DefaultReminderTimeType:=[ACTIONS:13]Default_ReminderTimeType:25
$_t_DefaultResultCode:=[ACTIONS:13]Default_ResultCode:28
$_bo_DefaultSetReminder:=[ACTIONS:13]Default_SetReminder:23
$_ti_DefaultStartTime:=[ACTIONS:13]Default_StartTime:19
$_l_DefaultTimeUnits:=[ACTIONS:13]Default_TimeUnits:31
$_t_DocumentCode:=[ACTIONS:13]Document_Code:4
$_bo_DocumentAction:=[ACTIONS:13]DocumentManager_Action:7
$_bo_ExcludeFromAdder:=[ACTIONS:13]Exclude_fromAdder:9

$_bo_IgnroreDiaryScripts:=[ACTIONS:13]ignoreDefaultDiaryMacros:36
$_bo_IsThreaed:=[ACTIONS:13]IsThreaded:14
$_l_OverdueAutoAction:=[ACTIONS:13]OverdueAutomatedAction:27
$_t_Priority:=[ACTIONS:13]Priority:5
$_bo_RecordJobActivity:=[ACTIONS:13]RecordActiivityInJobStage:39
$_l_TaskDefaultColur:=[ACTIONS:13]TaskDefaultColour:34
$_l_TreadOption:=[ACTIONS:13]ThreadOption:15
$_l_TimeUnitsValue:=[ACTIONS:13]TimeUnitsValue:32
$_bo_UserDiaryActionMacros:=[ACTIONS:13]UseActionSpecificDiaryMacros:35
$_t_UseEntryForm:=[ACTIONS:13]UseDateEntryForm:41
$_bo_UseJobStageRates:=[ACTIONS:13]UseJobStageRates:38
$_t_Locations:=[ACTIONS:13]xLocations:13

If (Count parameters:C259>=1)
	$_ptr_DiaryAttObject:=$1
Else 
	$_ptr_DiaryAttObject:=->$_obj_Attributes
End if 
ARRAY LONGINT:C221(SD2_al_ActionVirtFieldDataLong; 0)
ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataTXT; 0)
ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataTXT; 0)
ARRAY REAL:C219(SD2_ar_ActionVirtFieldDataREAL; 0)
ARRAY LONGINT:C221(SD2_al_ActionVirtFieldDataMANY; 0; 0)
ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataMA; 0; 0)

//The following record of fields is only held for convenience for programming

$_l_offset:=SD2_ActionFields
$_l_offset:=0
$_bo_Continue:=True:C214
$_l_ArraySize:=Size of array:C274(SD2_al_ActionVirtFieldNum)
ARRAY LONGINT:C221(SD2_al_ActionVirtFieldDataLong; $_l_ArraySize)
ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataTXT; $_l_ArraySize)
ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataTXT; $_l_ArraySize)
ARRAY REAL:C219(SD2_ar_ActionVirtFieldDataREAL; $_l_ArraySize)
ARRAY LONGINT:C221(SD2_al_ActionVirtFieldDataMANY; $_l_ArraySize; 0)
ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataMA; $_l_ArraySize; 0)

For ($_l_Index; 1; Size of array:C274(SD2_al_ActionVirtFieldNum))
	$_l_VirtualFieldNum:=SD2_al_ActionVirtFieldNum{$_l_Index}
	If (BLOB size:C605([ACTIONS:13]xActionAttributes:11)>$_l_offset) & ($_bo_Continue)
		Case of 
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFieldNum}=9)  // Longint one dimension
				BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; SD2_al_ActionVirtFieldDataLong{$_l_VirtualFieldNum}; $_l_offset)
				If ($_l_offset=0)
					$_bo_Continue:=False:C215
				End if 
				If (Size of array:C274(SD2_al_ActionVirtFieldDataLong)<$_l_VirtualFieldNum)
					ARRAY LONGINT:C221(SD2_al_ActionVirtFieldDataLong; $_l_VirtualFieldNum)
				End if 
				
				If (SD2_al_ActionVirtFieldDataLong{$_l_VirtualFieldNum}=0)
					If (SD2_al_ActionREALFieldNum{$_l_VirtualFieldNum}>0)
						//this is a field in the table anyway so get the data from there
						$_Ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFieldNum})
						Case of 
							: (Type:C295($_Ptr_FieldPointer->)=Is boolean:K8:9)
								SD2_al_ActionVirtFieldDataLong{$_l_VirtualFieldNum}:=Num:C11($_Ptr_FieldPointer->)
							: (Type:C295($_Ptr_FieldPointer->)=Is longint:K8:6)
								SD2_al_ActionVirtFieldDataLong{$_l_VirtualFieldNum}:=($_Ptr_FieldPointer->)
						End case 
					End if 
					
				End if 
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFieldNum}=21)  // String one dimension
				BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFieldNum}; $_l_offset)
				If ($_l_offset=0)
					$_bo_Continue:=False:C215
				End if 
				If (Size of array:C274(SD2_at_ActionVirtFieldDataTXT)<$_l_VirtualFieldNum)
					ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataTXT; $_l_VirtualFieldNum)
				End if 
				If (SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFieldNum}="")
					If (SD2_al_ActionREALFieldNum{$_l_VirtualFieldNum}>0)
						//this is a field in the table anyway so get the data from there
						$_Ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFieldNum})
						
						SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFieldNum}:=$_Ptr_FieldPointer->
						
					End if 
					
				End if 
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFieldNum}=2)  // TEXT one dimension
				BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFieldNum}; $_l_offset)
				If ($_l_offset=0)
					$_bo_Continue:=False:C215
				End if 
				If (Size of array:C274(SD2_at_ActionVirtFieldDataTXT)<$_l_VirtualFieldNum)
					ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataTXT; $_l_VirtualFieldNum)
				End if 
				If (SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFieldNum}="")
					If (SD2_al_ActionREALFieldNum{$_l_VirtualFieldNum}>0)
						//this is a field in the table anyway so get the data from there
						$_Ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFieldNum})
						
						SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFieldNum}:=$_Ptr_FieldPointer->
						
					End if 
					
				End if 
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFieldNum}=1)  // Real one dimension
				BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; SD2_ar_ActionVirtFieldDataREAL{$_l_VirtualFieldNum}; $_l_offset)
				If ($_l_offset=0)
					$_bo_Continue:=False:C215
				End if 
				If (Size of array:C274(SD2_ar_ActionVirtFieldDataREAL)<$_l_VirtualFieldNum)
					ARRAY REAL:C219(SD2_ar_ActionVirtFieldDataREAL; $_l_VirtualFieldNum)
				End if 
				If (SD2_ar_ActionVirtFieldDataREAL{$_l_VirtualFieldNum}=0)
					If (SD2_al_ActionREALFieldNum{$_l_VirtualFieldNum}>0)
						//this is a field in the table anyway so get the data from there
						$_Ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFieldNum})
						
						SD2_ar_ActionVirtFieldDataREAL{$_l_VirtualFieldNum}:=$_Ptr_FieldPointer->
						
					End if 
					
				End if 
				
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFieldNum}=116)  // Longint TWO dimension
				//These are all virtual
				ARRAY LONGINT:C221($_al_Data; 0)
				BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; $_al_Data; $_l_offset)
				If ($_l_offset=0)
					$_bo_Continue:=False:C215
				End if 
				If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY)<$_l_VirtualFieldNum)
					ARRAY LONGINT:C221(SD2_al_ActionVirtFieldDataMANY; $_l_VirtualFieldNum; 0)
				End if 
				INSERT IN ARRAY:C227(SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFieldNum}; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFieldNum})+1; Size of array:C274($_al_Data))
				
				For ($_l_Index2; 1; Size of array:C274($_al_Data))
					SD2_al_ActionVirtFieldDataMANY{$_l_VirtualFieldNum}{$_l_Index2}:=$_al_Data{$_l_Index2}
				End for 
				
			: (SD2_al_ActionVirtFieldType{$_l_VirtualFieldNum}=121)  // String TWO dimension
				//These are all virtual
				ARRAY TEXT:C222($_at_Data; 0)
				BLOB TO VARIABLE:C533([ACTIONS:13]xActionAttributes:11; $_at_Data; $_l_offset)
				If ($_l_offset=0)
					$_bo_Continue:=False:C215
				End if 
				If (Size of array:C274(SD2_at_ActionVirtFieldDataMA)<$_l_VirtualFieldNum)
					ARRAY TEXT:C222(SD2_at_ActionVirtFieldDataMA; $_l_VirtualFieldNum; 0)
				End if 
				INSERT IN ARRAY:C227(SD2_at_ActionVirtFieldDataMA{$_l_VirtualFieldNum}; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_VirtualFieldNum})+1; Size of array:C274($_at_Data))
				
				For ($_l_Index2; 1; Size of array:C274($_at_Data))
					SD2_at_ActionVirtFieldDataMA{$_l_VirtualFieldNum}{$_l_Index2}:=$_at_Data{$_l_Index2}
				End for 
				
				
		End case 
	Else 
		If (SD2_al_ActionREALFieldNum{$_l_VirtualFieldNum}>0)
			$_Ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFieldNum})
			Case of 
				: (SD2_al_ActionVirtFieldType{$_l_VirtualFieldNum}=9)
					$_Ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFieldNum})
					Case of 
						: (Type:C295($_Ptr_FieldPointer->)=Is boolean:K8:9)
							SD2_al_ActionVirtFieldDataLong{$_l_VirtualFieldNum}:=Num:C11($_Ptr_FieldPointer->)
						: (Type:C295($_Ptr_FieldPointer->)=Is longint:K8:6)
							SD2_al_ActionVirtFieldDataLong{$_l_VirtualFieldNum}:=($_Ptr_FieldPointer->)
						: (Type:C295($_Ptr_FieldPointer->)=Is time:K8:8)
							SD2_al_ActionVirtFieldDataLong{$_l_VirtualFieldNum}:=(($_Ptr_FieldPointer->)*1)
					End case 
					
				: (SD2_al_ActionVirtFieldType{$_l_VirtualFieldNum}=21)
					$_Ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFieldNum})
					SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFieldNum}:=$_Ptr_FieldPointer->
				: (SD2_al_ActionVirtFieldType{$_l_VirtualFieldNum}=2)
					$_Ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFieldNum})
					SD2_at_ActionVirtFieldDataTXT{$_l_VirtualFieldNum}:=$_Ptr_FieldPointer->
				: (SD2_al_ActionVirtFieldType{$_l_VirtualFieldNum}=1)
					$_Ptr_FieldPointer:=Field:C253(Table:C252(->[ACTIONS:13]); SD2_al_ActionREALFieldNum{$_l_VirtualFieldNum})
					SD2_ar_ActionVirtFieldDataREAL{$_l_VirtualFieldNum}:=$_Ptr_FieldPointer->
					
			End case 
			
			
		End if 
		
	End if 
	
	
End for 



//So we are going to move the results to an object now that we have them(above code is effectively dead before it was alive)
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Code")  //²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Action_Code"; SD2_at_ActionVirtFieldDataTXT{$_l_Ref})
Else 
	OB SET:C1220($_obj_DiaryAttObject; "Action_Code"; $_t_ActionCode)
	
End if 
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Name")  //²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Action_Name"; SD2_at_ActionVirtFieldDataTXT{$_l_Ref})
Else 
	OB SET:C1220($_obj_DiaryAttObject; "Action_Name"; $_t_ActionName)
End if 
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Export")  //²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Action_Export"; SD2_at_ActionVirtFieldDataTXT{$_l_Ref})
End if 
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Document Code")  //²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Document_Code"; SD2_at_ActionVirtFieldDataTXT{$_l_Ref})
End if 
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "WP action")  //²
If ($_l_Ref>0)  //note that we use 0 1 for booleans
	OB SET:C1220($_obj_DiaryAttObject; "WP_action"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if 
//if the diary action is a WP action this will instead of opening the Diary_In a normal context open to auto create an email or letter
//that would depend on the document type in the document code. the document has an document type that matches the action code. so is associated with the action
///this would be a template document-so this is a way of using the diary action  to create a document
//the document code DOES NOT refer to that template action but instead to a DOCUMENT that the diary will be related to.
//from the diary this would normally be a way of linking a document sent(so the resulting document created by the wp action for example).
//however when a document is specificed on an action this would something like a T&Cs which you want connected with the event
//the plan here is to use the 'use document for description' option to display the WP document rather than the text description
//when that option is used the associated WP document is different context this would be a Template itself and we make a copy of that template entering the text into a 'form' type wp document-so we might be capuring specific data
//this would be in a survey type context. an associated macro would need to extract that data from the WP document to do whatever is required.
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Use WP for action Description")  ///²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "WPEntry"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if 


$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Priority")  //²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Priority"; SD2_at_ActionVirtFieldDataTXT{$_l_Ref})
End if 
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Default Description")  //²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Default_Description"; SD2_at_ActionVirtFieldDataTXT{$_l_Ref})
End if 

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Type ID")  //²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Action_type_ID"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if 
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action ID")  ///²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Action_ID"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if 
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")  //²
If ($_l_Ref>0)  //action locations means where does the action appear(workflow/etc etc)
	//this is a type 116- this is an array of type longint
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "Action_Locations"; SD2_al_ActionVirtFieldDataMANY{$_l_Ref})
End if 

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded")  //²
If ($_l_Ref>0)  //threaded is a challenge-because we need to show the thread(so a special view)
	OB SET:C1220($_obj_DiaryAttObject; "Threaded"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if 

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded View Option")  //²
If ($_l_Ref>0)  //threaded is a challenge-because we need to show the thread(so a special view)
	OB SET:C1220($_obj_DiaryAttObject; "Threaded_View_Option"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if   //1=View Original Item 0=View Diary item
//action class only refers to the action table -this is so we can set templates for tasks-we could have other classes for example we might want some system created tasks that cant be altered by users.

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Class ID")  //²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Action_Class_ID"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if 
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Amount of Time")  //²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Amount_of_Time"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if   //note that on the action we have hour minute and day fields but we translate them into a single entity of a number and type

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Amount of Time Type")  //²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Amount_of_Time_Type"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if   //0= minutes 1=hours 2=days

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Start Time")  ///²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Start_Time"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if   //note this is time as a number

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "End Time")  ///²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "End time"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if   //note this is time as a number
//Note  that start and end time are specifics
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Start Day")  ///²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Start_Day"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if   //note this is a day  number

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "End Day")  //²
If ($_l_Ref>0)  //threaded is a challenge-because we need to show the thread(so a special view)
	OB SET:C1220($_obj_DiaryAttObject; "End_Day"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if   //note this is a day  number

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Reminder")  //²
If ($_l_Ref>0)  //threaded is a challenge-because we need to show the thread(so a special view)
	OB SET:C1220($_obj_DiaryAttObject; "Reminder"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if   //note this is a 0/1

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Reminder Time")  //²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Reminder_time"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if   //note this is an amount of time before the START time that you want the reminder(always minutes)

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Reminder Time Type")  //²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Reminder_time_type"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if   //note this is an amount of time type  //0= minutes 1=hours 2=days

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Exclude Non Working Days")  //²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Exclude_NW_Days"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if   //0 or 1..this is used when calculating the start day time


$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Whose Diaries")  //²
If ($_l_Ref>0)  //action locations means where does the action appear(workflow/etc etc)
	//this is a type 116- this is an array of type longint
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "Whose Diaries"; SD2_al_ActionVirtFieldDataMANY{$_l_Ref})
End if   //IDs of personnel(or could be groups at some point) whose diary this should go in
//See virtual field 8(real field 9) for exclude from adder
//by default this automatically goes in the diary of the adder
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Exclude from Adder")  //²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Exclude_from_Adder"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if 

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Restrict Table")  //²
If ($_l_Ref>0)  //action locations means where does the action appear(workflow/etc etc)
	//this is a type 116- this is an array of type longint
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "Restrict_Table"; SD2_al_ActionVirtFieldDataMANY{$_l_Ref})
End if 
// /tables this diary action is used with(only restricts usage in ADDING a record from tabs)

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Codes")  //²
If ($_l_Ref>0)
	//this is a type 121- this is an array of type text. 
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "Macro_Codes"; SD2_at_ActionVirtFieldDataMA{$_l_Ref})
End if 
//these macro codes (if they exist) are associated with events.
//by default this macro would run after an 'on load' or on save macro-but you can get it to run instead of
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Names")  //²
If ($_l_Ref>0)  //
	//this is a type 121- this is an array of type text. 
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "Macro_Names"; SD2_at_ActionVirtFieldDataMA{$_l_Ref})
End if 
//strictly speaking i dont need these here as the codes are enought but it will save work if i want to display them
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Events")  ///²
If ($_l_Ref>0)  //
	//this is a type 116- this is an array of type longint-see below for key. 
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "Events"; SD2_al_ActionVirtFieldDataMANY{$_l_Ref})
End if 
//1=on saving new
//2=on saving existing
//3=on opening
//4=on Setting a result code
//5=on setting to Done

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Level Field Macros")  ///²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Field_Macros"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if 
//if we are using field level macros they work like this.
//Normally in an LPX we call Macro_AccTypePt. and this runs a macro like below
//Macro_AccType ("Modified "+$file+"/"+String(Field($1))) so it looks for a macro with the Code Modified 3/1 for example
//this provides an extension to that concept (and can override) so we can have a script that only applies to this action
//this will look for a script with the code modified 3/1 COAD for example as an action code is max 5 and the macro code is max 31 this would allow 15 digits for the 3/1 so thats up to more than 990000/990000 which is probably more tables and fields than i can imagine-(even if i changed the action code length to 7
//this requires the Diary_InLPX method to change to have 2 more paramters parameter 2 being the action code and parameter 3 to tell it if still runs any standard field macro.
//note this only affect the diary
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Ignore Other Macros")  ///²
If ($_l_Ref>0)
	OB SET:C1220($_obj_DiaryAttObject; "Ignore_Diary_Macros"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if 

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Result Codes")  //²
If ($_l_Ref>0)
	//this is a type 121- this is an array of type text. 
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "Result_Codes"; SD2_at_ActionVirtFieldDataMA{$_l_Ref})
End if 
//the above restricts the result codes the user can set-the only thing i need to take extrac care with-what if there is a result code on a workflow that is not available on the action(make sure on workflow the only outcomes you can track are for set), and if you modify an action check you have not taken away a result that is on a workflow using the action.

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Post Time processing Action")  //²
If ($_l_Ref>0)
	//this is a type 121- this is an array of type text. 
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "Post_Action"; SD2_al_ActionVirtFieldDataMANY{$_l_Ref})
End if 
//0=No action
//1=Nag User
//2=Put in to do list
//3 Auto Complete
//4 force user to complete

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Auto Result Code")  //²
If ($_l_Ref>0)
	//this is a type 121- this is an array of type text. 
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "Auto_Result_Code"; SD2_at_ActionVirtFieldDataMA{$_l_Ref})
End if 

//Only used if post time processing action is 3(Auto Complete)
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")  //²
If ($_l_Ref>0)
	//this is a type 121- this is an array of type text. 
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "Data_Entry_Form"; SD2_at_ActionVirtFieldDataMA{$_l_Ref})
Else 
	
End if 
//the names of forms here are hard coded-some of these are 'soft' e.g there is no form it just a context that controls what we display
//some are actual forms

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Static Record Fields")  //²
If ($_l_Ref>0)
	//this is a type 116- this is an array of type longint
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "Static_Record _Fields"; SD2_al_ActionVirtFieldDataMANY{$_l_Ref})
End if 
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Static Record Fields")
If ($_l_Ref>0)
	//this is a type 121- this is an array of type text
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "Static_Record _Codes"; SD2_at_ActionVirtFieldDataMA{$_l_Ref})  //²
End if 
//static record codes let us assign a generic record code to all actions of a given type
//lets say we had an action for a project and we wanted to link all the diary actions to the project we might want the JOB code assigned to all the records-the job code does not change 
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Time Units")  //²
If ($_l_Ref>0)
	
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "Time_Units"; SD2_ar_ActionVirtFieldDataREAL{$_l_Ref})  //²
End if 
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Time Units Value")
If ($_l_Ref>0)
	
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "Time_Units_Value"; SD2_ar_ActionVirtFieldDataREAL{$_l_Ref})
End if 
//we can get the units from Job Stages.
//JobPers_InLP
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Get Rate From Job Stage")  //²
If ($_l_Ref>0)
	//this is a type 116- this is an array of type longint
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "Stages_Rates"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if 
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Record Time_In Job Stage")  //²
If ($_l_Ref>0)  //²
	//
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "RecordStages"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if 

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Job Stage Type")  //²
If ($_l_Ref>0)
	//
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "Job_Stage_Type"; SD2_at_ActionVirtFieldDataTXT{$_l_Ref})
End if 
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Time Units Macro Code")  //²
If ($_l_Ref>0)
	//
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "Time_Units_Macro_Code"; SD2_at_ActionVirtFieldDataTXT{$_l_Ref})
End if 
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Agenda Colours Fill")  //²
If ($_l_Ref>0)
	//
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "FillColours"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if 
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Agenda Colours Accent")  //²
If ($_l_Ref>0)
	//
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "AccentColours"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if 
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Done Action")  //²
If ($_l_Ref>0)
	//
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "DoneAction"; SD2_al_ActionVirtFieldDataLong{$_l_Ref})
End if 

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Relation Type")  //²
If ($_l_Ref>0)
	//
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "RelationType"; SD2_al_ActionVirtFieldDataMANY{$_l_Ref})
End if 

$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Relation Table")  //²
If ($_l_Ref>0)
	//
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "RelationTable"; SD2_al_ActionVirtFieldDataMANY{$_l_Ref})
End if 
$_l_Ref:=Find in array:C230(SD2_at_ActionVirtFieldName; "Relation Restriction")  //²
If ($_l_Ref>0)
	//
	OB SET ARRAY:C1227($_obj_DiaryAttObject; "RelationRestriction"; SD2_al_ActionVirtFieldDataMANY{$_l_Ref})
End if 
If (Count parameters:C259>=1)
	
	$_ptr_DiaryAttObject->:=$_obj_DiaryAttObject
End if 






//we can record the Time_In 

//$0:=$_ptr_DiaryAttObject
ERR_MethodTrackerReturn("SD2_LoadDefaultAttributes"; $_t_oldMethodName)
