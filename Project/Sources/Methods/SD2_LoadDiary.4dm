//%attributes = {}

If (False:C215)
	//Database Method Name:      SD2_LoadDiary
	//------------------ Method Notes ------------------
	
	
	
	// ----------------------------------------------------
	// Creator: Nigel Greenlee
	//Date & time: 10/12/2009 15:26`Method: SD2_LoadDiary
	//Description
	
	//Parameters
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
	
	//------------------ Revision Control ----------------
	//Date Created:  28/09/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AttributeTypes; 0)
	ARRAY LONGINT:C221($_al_ClassID; 0)
	ARRAY LONGINT:C221($_al_ExcludeFromAdder; 0)
	ARRAY LONGINT:C221($_al_FieldReferences; 0)
	ARRAY LONGINT:C221($_al_PersonnelID; 0)
	ARRAY LONGINT:C221($_al_Status; 0)
	ARRAY LONGINT:C221($_al_WhoseDiaries; 0)
	ARRAY LONGINT:C221($_al_WhoseDiary; 0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY LONGINT(SD_al_DiaryGroupIDS;0)
	//ARRAY LONGINT(SD_al_DiaryGroupOwners;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_DiaryOwnerpersons;0)
	//ARRAY LONGINT(SD2_al_DiaryPersREL;0)
	//ARRAY LONGINT(SD2_al_InviteeClass;0)
	//ARRAY LONGINT(SD2_al_InviteeStatus;0)
	//ARRAY LONGINT(SD2_al_InviteStati;0)
	//ARRAY LONGINT(SD2_AL_MacroEvent;0)
	//ARRAY LONGINT(SD2_AL_MacroignoreStd;0)
	//ARRAY LONGINT(SD2_al_RecordID;0)
	//ARRAY LONGINT(SD2_al_RelatedCompanyIDs;0)
	//ARRAY LONGINT(SD2_al_relatedContactID;0)
	//ARRAY LONGINT(SD2_al_RelatedRecordID;0)
	//ARRAY LONGINT(SD2_al_RelatedRecordTableNum;0)
	//ARRAY LONGINT(SD2_al_RelatedtoDiaryfield;0)
	//ARRAY LONGINT(SD2_al_relationDiaryField;0)
	//ARRAY LONGINT(SD2_al_RelationRestS;0)
	//ARRAY LONGINT(SD2_al_RelationTable;0)
	//ARRAY LONGINT(SD2_al_RelationTablesS;0)
	//ARRAY LONGINT(SD2_al_RelationType;0)
	//ARRAY LONGINT(SD2_al_RelationTypesS;0)
	//ARRAY PICTURE(SD2_apic_InfoPic;0)
	//ARRAY REAL(SD2_ar_ActionVirtFieldDataREAL;0)
	ARRAY TEXT:C222($_at_AttributeNames; 0)
	ARRAY TEXT:C222($_at_ClassName; 0)
	ARRAY TEXT:C222($_at_DiaryAttributes; 0)
	ARRAY TEXT:C222($_at_EmailAddress; 0)
	ARRAY TEXT:C222($_at_FieldRecordCode; 0)
	ARRAY TEXT:C222($_at_ObjectAttributeNames; 0)
	//ARRAY TEXT(SD_at_DiaryGroupNames;0)
	//ARRAY TEXT(SD2_at_ActionCodes;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataMA;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_AllResultCodes;0)
	//ARRAY TEXT(SD2_at_AllresultNames;0)
	//ARRAY TEXT(SD2_at_DactionNames;0)
	//ARRAY TEXT(SD2_at_DiaryActionCodes;0)
	//ARRAY TEXT(SD2_at_DiaryOwnerPersonCD;0)
	//ARRAY TEXT(SD2_at_DiaryOwnerPersonNM;0)
	//ARRAY TEXT(SD2_at_DiaryPersREL;0)
	//ARRAY TEXT(SD2_at_inviteeClass;0)
	//ARRAY TEXT(SD2_at_InviteeComb;0)
	//ARRAY TEXT(SD2_at_InviteeEmailAddress;0)
	//ARRAY TEXT(SD2_at_Invitees;0)
	//ARRAY TEXT(SD2_at_InviteeStatus;0)
	//ARRAY TEXT(SD2_at_InviteStati;0)
	//ARRAY TEXT(SD2_at_RelatedCompanyCodes;0)
	//ARRAY TEXT(SD2_at_RelatedCompanyNames;0)
	//ARRAY TEXT(SD2_at_RelatedContactName;0)
	//ARRAY TEXT(SD2_at_RelatedContactsCodes;0)
	//ARRAY TEXT(SD2_at_RelatedRecordCode;0)
	//ARRAY TEXT(SD2_at_RelatedRecordName;0)
	//ARRAY TEXT(SD2_at_RelatedRecordType;0)
	//ARRAY TEXT(SD2_at_RelationNames;0)
	//ARRAY TEXT(SD2_at_RelationRest;0)
	//ARRAY TEXT(SD2_at_RelationTablesS;0)
	//ARRAY TEXT(SD2_at_RelationTypes;0)
	//ARRAY TEXT(SD2_at_RelationTypesS;0)
	//ARRAY TEXT(SD2_at_ReminderTimes;0)
	//ARRAY TEXT(SD2_at_ResultCodes;0)
	//ARRAY TEXT(SD2_at_ResultNames;0)
	//ARRAY TEXT(SD2_at_Scripts;0)
	//ARRAY TEXT(SD2_at_TabactionCodes;0)
	//ARRAY TEXT(SD2_at_TimeType;0)
	C_BOOLEAN:C305($_bo_4DWriteInstalled; $_bo_AppendToArray; $_bo_CheckRestrictions; $_bo_Exclude; $_bo_ExcludeFromAdder; $_bo_FirstPerson; $_bo_GroupsLoaded; $_bo_isRelationValid; $_bo_IsScheduleTask; $_bo_IsWPaction; $_bo_NoScript)
	C_BOOLEAN:C305($_bo_Owner; $_bo_RecordDoneTimeDate; $_bo_SetTimes; $_bo_ThreadViewOption; $_bo_Unload; $_bo_Unload2; $_bo_useJobStageRates; $_bo_UseJSRate; SD_bo_NewRecord; SD2_bo_ShowDetailsASWP; SD2_bo_UseMultipleActionCodes)
	C_DATE:C307($_d_CurrentDate; $_d_EndDate; $_d_StartDate)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_AbsTimeFrame; $_l_ActionField; $_l_ActionLocationFields; $_l_AmountofTime; $_l_AmountOfTimeField; $_l_AmountofTimeType; $_l_AmountOfTimeTypeFIeld; $_l_ArrayPosition; $_l_ArraySize; $_l_AttributeFind)
	C_LONGINT:C283($_l_CallCodePosition; $_l_CBPostAction; $_l_CBThreaded; $_l_CompanyFIeld; $_l_CompanyFieldPosition; $_l_ContactCodePosition; $_l_ContactFIeldNum; $_l_ContactFieldPosition; $_l_CreateOwners; $_l_DayNumber; $_l_Days)
	C_LONGINT:C283($_l_DiaryActionClass; $_l_DoneActionField; $_l_DonectionPosition; $_l_EndDateFIeld; $_l_EndTimePosition; $_l_ExcludeFromAdderField; $_l_FindInvitee; $_l_FindStatus; $_l_GetGroups; $_l_GroupID; $_l_Hours)
	C_LONGINT:C283($_l_IgnoreScriptsField; $_l_Index; $_l_Index2; $_l_IndexStart; $_l_Invitees; $_l_InviteesPosition; $_l_InvoiceCodeFIeld; $_l_InvoiceCodePosition; $_l_InvoiceTablePosition; $_l_JobField; $_l_JobFieldPosition)
	C_LONGINT:C283($_l_JobsTablePosition; $_l_JobStageField; $_l_JobStageFieldPosition; $_l_JobTablePosition; $_l_NumberOfMinutes; $_l_NumberofSeconds; $_l_OneDay; $_l_OneHour; $_l_PICodeFIeld; $_l_PICodePosition; $_l_PITablePosition)
	C_LONGINT:C283($_l_POCodeFIeld; $_l_POCodePosition; $_l_PostActionPosition; $_l_POTablePosition; $_l_ProductField; $_l_ProductFieldPosition; $_l_ProductTablePosition; $_l_RecordCodesPosition; $_l_RecordFieldsPosition; $_l_Ref; $_l_RelatedTablePosition)
	C_LONGINT:C283($_l_RelationElement; $_l_RelationFieldPosition; $_l_RelationPosition; $_l_RelationRestriction; $_l_RelationTableField; $_l_RelationTypeElement; $_l_RelationTypeFIeld; $_l_Remainder; $_l_ReminderTime; $_l_ReminderTimeType; $_l_ResultCodeField)
	C_LONGINT:C283($_l_ResultsCodePosition; $_l_ScriptCodeRow; $_l_ScriptEventRow; $_l_ScriptNametRow; $_l_SD2TimeAmount; $_l_ServiceCallCodeFIeld; $_l_ServiceTablePosition; $_l_SetReminder; $_l_SMCodeFIeld; $_l_SMCodePosition; $_l_SMTablePosition)
	C_LONGINT:C283($_l_StartDateOffset; $_l_StartTimeField; $_l_StartTimePosition; $_l_StaticFieldPosition; $_l_StaticRecordPosition; $_l_StatusPosition; $_l_TablePosition; $_l_TESTimEnd; $_l_ThreadedField; $_l_TimeAmount; $_l_TimeAmountType)
	C_LONGINT:C283($_l_TimeENd; $_l_TimeEndField; $_l_TimeStart; $_l_TimeUnitsCodeField; $_l_TImeUnitseld; $_l_TImeUnitsValueField; $_l_TSTimeStart; $_l_UseRatesField; $_l_WhoseDiary; $_l_WhoseDiaryField; i)
	C_LONGINT:C283(SD_l_DiaryDetailsWP; SD2_l_autoActionCode; SD2_l_CB_Alarmed; SD2_l_Completed; SD2_l_FieldLevelMacros; SD2_l_IgnoreStdMacros; SD2_l_TimeFrame)
	C_OBJECT:C1216($_obj_ActionAttributes; $_obj_DiaryGroups)
	C_PICTURE:C286($_pic_Picture)
	C_POINTER:C301($_ptr_attributes; $_ptr_FieldPointer)
	C_TEXT:C284($_t_CompanyCode; $_t_CompanyName; $_t_ContactCode; $_t_DateString; $_t_DocumentCode; $_t_EntryFormName; $_t_FieldReferenceName; $_t_InvoiceCode; $_t_JobCode; $_t_JobName; $_t_JobStageCode)
	C_TEXT:C284($_t_JobStageName; $_t_oldMethodName; $_t_OldPersonInits; $_t_PICode; $_t_POCode; $_t_ProblemCode; $_t_ProductCode; $_t_RecordReferenceName; $_t_ReferenceName; $_t_ServiceCallCode; $_t_SMCode)
	C_TEXT:C284($_t_StageCode; $_t_StatusString; $_t_TimeUnitsMacro; $1; SD2_T_DiaryDetailsTEXT; SD2_t_DiaryOwnerName; SD2_t_DocumentDisplayCode; SD2_t_SELActionName; SD2_t_SELInputFormName; SD2_t_TimeFrame; SD2_t_WhoseDiary)
	C_TIME:C306($_ti_CurrentTime; $_ti_DayStartsAtTime; $_ti_EndTimeTime; $_ti_StartTime; $_ti_TimeEnd; $_ti_TimeStart; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart; SD2_ti_TimeDoFrom; SD2_ti_TimeDoTo; SD2_ti_TimeEnd)
End if 
//Code Starts Here

//TRACE

$_t_oldMethodName:=ERR_MethodTracker("SD2_LoadDiary")
//this method will load the current diary action
//It will return a 'form name'-whcih will  tell us which page to use
$_t_EntryFormName:=$1  //this is the actuall form and might be different from SD2_t_SELInputFormName which is a 'virtual' name

ARRAY TEXT:C222(SD2_at_ReminderTimes; 3)
SD2_at_ReminderTimes{1}:="Mins"
SD2_at_ReminderTimes{2}:="Hrs"
SD2_at_ReminderTimes{3}:="Days"
SD2_t_DocumentDisplayCode:=""
//Note on the above. The form name referred to above is actually a reference to a specific form page. The form name will already have been used
//to determine
SD_bo_NewRecord:=False:C215
ARRAY TEXT:C222(SD2_at_DactionNames; 0)
ARRAY TEXT:C222(SD2_at_DiaryActionCodes; 0)
//`the following arrays hold the names of the diary 'owners'
ARRAY LONGINT:C221(SD2_al_DiaryOwnerpersons; 0)
ARRAY TEXT:C222(SD2_at_DiaryOwnerPersonNM; 0)
ARRAY TEXT:C222(SD2_at_DiaryOwnerPersonCD; 0)
ARRAY TEXT:C222(SD2_at_DiaryPersREL; 0)
ARRAY LONGINT:C221(SD2_al_DiaryPersREL; 0)
ARRAY TEXT:C222(SD2_at_ResultCodes; 0)
ARRAY TEXT:C222(SD2_at_ResultNames; 0)

//`The following are invite arrays
ARRAY TEXT:C222(SD2_at_InviteeComb; 0)
ARRAY TEXT:C222(SD2_at_Invitees; 0)
ARRAY LONGINT:C221(SD2_al_InviteeClass; 0)  //this will be internal/external 0/1
ARRAY TEXT:C222(SD2_at_InviteeEmailAddress; 0)
ARRAY TEXT:C222(SD2_at_inviteeClass; 0)
ARRAY TEXT:C222(SD2_at_InviteeStatus; 0)
ARRAY LONGINT:C221(SD2_al_InviteeStatus; 0)
ARRAY LONGINT:C221(SD2_al_RecordID; 0)
ARRAY PICTURE:C279(SD2_apic_InfoPic; 0)
//TRACE

//``
//Invitiations only apply to schedule items-meeting and so forth when you are creating them. the 
ARRAY TEXT:C222(SD2_at_InviteStati; 5)
ARRAY LONGINT:C221(SD2_al_InviteStati; 5)
SD2_al_InviteStati{1}:=0
SD2_at_InviteStati{1}:="Do not send"
SD2_al_InviteStati{2}:=1
SD2_at_InviteStati{2}:="Not Sent"

SD2_al_InviteStati{3}:=2
SD2_at_InviteStati{3}:="Sent-not responded"
SD2_al_InviteStati{4}:=3
SD2_at_InviteStati{4}:="Confirmed"
SD2_al_InviteStati{5}:=-1
SD2_at_InviteStati{5}:="Refused"
//`These above invite arrays are only displayed for a schedule type item
SD2_l_FieldLevelMacros:=0
SD2_l_Completed:=0
SD2_LoadDiaryFormNames
SD2_LoadDiaryTypes
SD_LoadPrefs(<>PER_l_CurrentUserID)
//TRACE
If ([DIARY:12]Diary_Code:3="")
	//New record
	SD_bo_NewRecord:=True:C214
	DiarySetCode  //set the diary code
	[DIARY:12]x_ID:50:=AA_GetNextID(->[DIARY:12]x_ID:50)
	$_t_OldPersonInits:=[DIARY:12]Person:8
	SD2_SetFieldValues  //Sets values passed to the record
End if 

//[DIARY]Action_Code²
//[DIARY]Action_Details²

//_.[DIARY]AGAccentColourBlue
///_[DIARY]AGAccentColourGreen
//_[DIARY]AGAccentColourRed
//__/[DIARY]AGFillColourBlue
//_[DIARY]AGFillColourGreen
//_[DIARY]AGFillColourRed
//[DIARY]Alarm_Timeframe
//[DIARY]Attributes
//[DIARY]Booking_Code see relations(well maybe)
//_[DIARY]Budget_Units
//_[DIARY]Call_Code
//_[DIARY]CampaignUUID
//_[DIARY]Charge_Rate
//_[DIARY]Company_Code
//_[DIARY]Contact_Code
//_[DIARY]Cost_Rate
//_[DIARY]Cost_Value
//_[DIARY]Data_Source_Table
//_[DIARY]Date_Do_From
//_[DIARY]Date_Do_To
//_[DIARY]Date_Done_From
//_[DIARY]Date_Done_To
//_[DIARY]Date_Stamp
//_[DIARY]Date_Time_Stamp
//_[DIARY]Deleted
//_[DIARY]Diary_Code
//_[DIARY]Display_Date_From
//_[DIARY]Display_Date_To
//_[DIARY]Display_Description
//_[DIARY]Display_Time_From
//_[DIARY]Display_Time_To
//_[DIARY]DoAllDay
//_[DIARY]Document_Code
//_[DIARY]Document_Heading
//_[DIARY]Done
//_[DIARY]DoneAllDay
//_[DIARY]Email_From
//_[DIARY]Email_ID
//_[DIARY]Email_Person
//_[DIARY]Email_Subject
//_[DIARY]Email_Text
//_[DIARY]Event_Code
//_[DIARY]Export
//_[DIARY]Job_Code
//_[DIARY]Order_Code
//_[DIARY]Original_Date_Time_Stamp
//_[DIARY]Originator
//_[DIARY]Person
//_[DIARY]Personal_Priority
//_[DIARY]PersonID
//_[DIARY]Picture_Code
//_[DIARY]Priority
//_[DIARY]Product_Code
//_[DIARY]Public
//_[DIARY]Result_Code
//_[DIARY]Result_Description
//_[DIARY]Script_Code
//_[DIARY]Sequence_Actioned
//_[DIARY]Stage_Code
//_[DIARY]Status
//[DIARY]Subject
//[DIARY]ThreadID
//[DIARY]Time_Checked
//[DIARY]Time_Do_From
//[DIARY]Time_Do_To
//[DIARY]Time_Done_From
//[DIARY]Time_Done_To
//[DIARY]Units²
//[DIARY]Value²
//_[DIARY]WPDataEntry
//_[DIARY]write_
//[DIARY]x_Close_Options
//[DIARY]x_ID²
//[DIARY]x_Is_Thread²
//->[DIARY]x_Open_Parent
//->[DIARY]x_Place_of_Action
//->[DIARY]X_REOCCOURANCE
//->[DIARY]x_Result_Description_Blob
//[DIARY]xDiaryClass²
//[DIARY]xDiaryForm²
//[DIARY]xDiaryLocations²
//[DIARY]XShowRelatedTable²


If ([DIARY:12]Action_Code:9="")  //No specific Action Code was passed to the form..but 'form name' was(probably)
	//so we need to load the action codes applicable.
	//these may have been passed in(See SD_SetFieldValues), or the we willl get get action codes that use this form.
	//if the 'list' of action codes is 1 then we can set the action code.
	//if no action code is setup then the user will be selecting the action from a drop down where we will call code to get the attributes.
	//if there is an action then the attributes of that action are copies to the [DIARY]Attributes
	//need to do something here as don't have the action code settings
	If (Size of array:C274(SD2_at_ActionCodes)=0)  //we were not passed a selection of action codes to the form(this would happen from the tabs on a form)-see in SD2_SetFieldValues
		//we might have been passed the action code(s) in a the object in which case they end up in SD_aS10TabActionCodes
		SD2_GetActionCodesbyForm(SD2_t_SELInputFormName; ->SD2_at_DiaryActionCodes; ->SD2_at_DactionNames)  //this method setups up range of action codes.
		If (Size of array:C274(SD2_at_DiaryActionCodes)=1)  //there is only one action code any way so
			[DIARY:12]Action_Code:9:=SD2_at_DiaryActionCodes{1}
			
		Else 
			
		End if 
	Else 
		If (Size of array:C274(SD2_at_ActionCodes)=1)
			QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SD2_at_ActionCodes{1})
			[DIARY:12]Action_Code:9:=[ACTIONS:13]Action_Code:1
			//SD2_LoadDefaultAttributes (->[DIARY]Attributes)
		Else 
			QUERY WITH ARRAY:C644([ACTIONS:13]Action_Code:1; SD2_at_ActionCodes)
			SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SD2_at_DiaryActionCodes; [ACTIONS:13]Action_Name:2; SD2_at_DactionNames)
			If (Size of array:C274(SD2_at_DiaryActionCodes)=1)  //if that range was one record
				//there is only one action code any way so
				[DIARY:12]Action_Code:9:=SD2_at_DiaryActionCodes{1}
			Else 
				//C_OBJECT($_obj_ActionAttributes)
				//SD2_LoadDefaultAttributes (->[DIARY]Attributes)
			End if 
		End if 
	End if 
End if 
$_l_DiaryActionClass:=0
$_bo_ExcludeFromAdder:=False:C215
SD2_t_SELActionName:=""
If ([DIARY:12]Action_Code:9#"")  // we now have an action code
	//we are going to check if the action attributes have been copied
	OB GET PROPERTY NAMES:C1232([DIARY:12]Attributes:79; $_at_DiaryAttributes; $_al_AttributeTypes)
	QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
	If ([ACTIONS:13]xActionTypeID:10<0)
		//The action is a default one-not user set this is used for actions that were hard coded previously
		//this is only gonna happen if it is not being displayed on screen
	End if 
	SD2_t_SELActionName:=[ACTIONS:13]Action_Name:2
	If (Records in selection:C76([ACTIONS:13])>0)
		
		If (Size of array:C274($_at_DiaryAttributes)=0)  //we dont have the attributes from the action yet
			
			OB GET PROPERTY NAMES:C1232([DIARY:12]Attributes:79; $_at_AttributeNames; $_al_AttributeTypes)
			If (Size of array:C274($_at_AttributeNames)=0)
				[DIARY:12]Attributes:79:=[ACTIONS:13]AttributesObject:42
				//SD2_ActionAttributesToArrays (->[DIARY]Attributes)
			End if 
		Else 
			//SD2_ActionAttributesToArrays (->[DIARY]Attributes)
			
		End if 
	Else 
		//need to do something here as don't have the action code settings
		
		//$_obj_ActionAttributes:=SD2_LoadDefaultAttributes 
	End if 
	
	//set the diary class this is a binary field containing numbers in from the ACTION locations
	
	//````````
	//Because the time settings may need to take into account who the diary is for
	
End if 
OB GET PROPERTY NAMES:C1232([DIARY:12]Attributes:79; $_at_AttributeNames; $_al_AttributeTypes)
If (Size of array:C274($_at_AttributeNames)>0)  // the attributes are in the diary
	$_ptr_attributes:=->[DIARY:12]Attributes:79
Else 
	If ([ACTIONS:13]Action_Code:1#[DIARY:12]Action_Code:9)
		QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
	End if 
	$_ptr_attributes:=->[ACTIONS:13]AttributesObject:42
End if 
///// Friday
If (SD_bo_NewRecord)
	If ([DIARY:12]Document_Code:15="")
		SD2_GetAttributeValue($_ptr_attributes; "Document Code"; ->[DIARY:12]Document_Code:15)
	End if 
	If ([DIARY:12]Priority:17="")
		SD2_GetAttributeValue($_ptr_attributes; "Priority"; ->[DIARY:12]Priority:17)
	End if 
	If ([DIARY:12]Action_Details:10="")
		SD2_GetAttributeValue($_ptr_attributes; "Default Description"; ->[DIARY:12]Action_Details:10)
	End if 
	SD2_GetAttributeValue($_ptr_attributes; "WP Action"; ->$_bo_IsWPaction)
	//if this is true then we change the display   //if this is a WP action we have to be editing a letter
	If ([DIARY:12]xDiaryClass:65=0)
		SD2_GetAttributeValue($_ptr_attributes; "Action Type ID"; ->[DIARY:12]xDiaryClass:65)
	End if 
	If ([DIARY:12]xDiaryLocations:81=0)  //
		SD2_GetAttributeValue($_ptr_attributes; "Action Locations"; ->[DIARY:12]xDiaryLocations:81)
	End if 
	If ([DIARY:12]ThreadID:64=0) & ([DIARY:12]x_Is_Thread:68=False:C215)  //
		SD2_GetAttributeValue($_ptr_attributes; "Threaded"; ->[DIARY:12]x_Is_Thread:68)
		[DIARY:12]ThreadID:64:=AA_GetNextID(->[DIARY:12]ThreadID:64)
		SD2_GetAttributeValue($_ptr_attributes; "Threaded View Option"; ->[DIARY:12]XShowRelatedTable:82)
		//note that [DIARY]x_Open_Parent is only used for ???
		
	End if 
	If ([DIARY:12]xDiaryForm:66="")
		SD2_GetAttributeValue($_ptr_attributes; "Data Entry Form"; ->[DIARY:12]xDiaryForm:66)
	End if 
	///
	If ([DIARY:12]Units:20=0) & ([DIARY:12]Charge_Rate:22=0)
		SD2_GetAttributeValue($_ptr_attributes; "Time Units Macro Code"; ->$_t_TimeUnitsMacro)
		
		If ($_t_TimeUnitsMacro#"")
			$_bo_NoScript:=False:C215
			Macro($_t_TimeUnitsMacro)
		Else 
			$_bo_NoScript:=True:C214
		End if 
		
		If ($_bo_NoScript)
			SD2_GetAttributeValue($_ptr_attributes; "Record Time_In Job Stage"; ->$_bo_useJobStageRates)
			If ($_bo_useJobStageRates)
				//this will get the CLIENT rate from the JS-note that we will be modifying the JS so it can use a personnel led rate or a Price table led rate or a default rate
				
			Else 
				SD2_GetAttributeValue($_ptr_attributes; "Time Units"; ->[DIARY:12]Units:20)
				SD2_GetAttributeValue($_ptr_attributes; "Time Units Value"; ->[DIARY:12]Charge_Rate:22)
				[DIARY:12]Value:16:=Round:C94(([DIARY:12]Charge_Rate:22*[DIARY:12]Units:20); 2)
			End if 
			
		End if 
	End if 
	If ([DIARY:12]x_Close_Options:71=0)
		SD2_GetAttributeValue($_ptr_attributes; "Post Time processing Action"; ->[DIARY:12]x_Close_Options:71)
		//The options here are
		//SD2_at_AutoActions{1}:="No automatic action"
		//SD2_at_AutoActions{2}:="Nag user"
		//SD2_at_AutoActions{3}:="Put in to-do list"
		//SD2_at_AutoActions{4}:="Auto complete"
		//SD2_at_AutoActions{5}:="Force user to complete"
		//SD2_al_AutoActionCodes{1}:=0
		//SD2_al_AutoActionCodes{2}:=1
		//SD2_al_AutoActionCodes{3}:=2
		//SD2_al_AutoActionCodes{4}:=3
		//SD2_al_AutoActionCodes{5}:=4
	End if 
	
	
	
Else 
	SD2_GetAttributeValue($_ptr_attributes; "WP Action"; ->$_bo_IsWPaction)
	
End if 










///we only do this

/////End Friday
If ([DIARY:12]Person:8#"")
	If ([PERSONNEL:11]Initials:1#[DIARY:12]Person:8)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[DIARY:12]Person:8)
	End if 
	SD2_t_DiaryOwnerName:=[PERSONNEL:11]Name:2
	//so as well as the singular owner we also load other owners(a diary item can now be owned by multiple people
	APPEND TO ARRAY:C911(SD2_al_DiaryOwnerpersons; [PERSONNEL:11]Personnel_ID:48)
	APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonNM; [PERSONNEL:11]Name:2)
	APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonCD; [PERSONNEL:11]Initials:1)
	
	If ([PERSONNEL:11]Global_Access:47)
		APPEND TO ARRAY:C911(SD2_at_DiaryPersREL; "Resource")
		APPEND TO ARRAY:C911(SD2_al_DiaryPersREL; -1)
	Else 
		APPEND TO ARRAY:C911(SD2_at_DiaryPersREL; "Owner")
		APPEND TO ARRAY:C911(SD2_al_DiaryPersREL; 1)
	End if 
	
	QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]DIARY_CODE:1=[DIARY:12]Diary_Code:3)
	If (Records in selection:C76([DIARY_ITEMOWNERS:106])>0)
		SELECTION TO ARRAY:C260([DIARY_ITEMOWNERS:106]PERSONNEL_ID:2; $_al_PersonnelID; [DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3; $_al_ClassID; [DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSNAME:4; $_at_ClassName; [DIARY_ITEMOWNERS:106]xStatus:6; $_al_Status)
		For ($_l_Index; 1; Size of array:C274($_al_PersonnelID))
			If (Find in array:C230(SD2_al_DiaryOwnerpersons; $_al_PersonnelID{$_l_Index})<0)
				//even if that person is 'deleted' they belong on here-as it is historical
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$_al_PersonnelID{$_l_Index})
				APPEND TO ARRAY:C911(SD2_al_DiaryOwnerpersons; [PERSONNEL:11]Personnel_ID:48)
				APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonNM; [PERSONNEL:11]Name:2)
				APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonCD; [PERSONNEL:11]Initials:1)
				If ([PERSONNEL:11]Global_Access:47)
					APPEND TO ARRAY:C911(SD2_at_DiaryPersREL; "Resource")
					APPEND TO ARRAY:C911(SD2_al_DiaryPersREL; -1)
				Else 
					APPEND TO ARRAY:C911(SD2_at_DiaryPersREL; "Owner")
					APPEND TO ARRAY:C911(SD2_al_DiaryPersREL; 1)
				End if 
			End if 
		End for 
		
	End if 
	
Else 
	
	
	
	
	If ([ACTIONS:13]Action_Code:1#"")
		SD2_GetAttributeValue($_ptr_attributes; "Whose Diaries"; ->$_al_WhoseDiaries)
		////
		
		
		///
		If (Size of array:C274($_al_WhoseDiaries)>0)
			$_bo_FirstPerson:=True:C214
			For ($_l_Index; 1; Size of array:C274($_al_WhoseDiaries))
				$_l_WhoseDiary:=$_al_WhoseDiaries{$_l_Index}
				If ($_l_WhoseDiary#0)
					If ($_l_WhoseDiary>0)
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$_l_WhoseDiary)
						If (Records in selection:C76([PERSONNEL:11])>0)
							If ([PERSONNEL:11]PersonDeleted:38=0)
								APPEND TO ARRAY:C911(SD2_al_DiaryOwnerpersons; $_l_WhoseDiary)
								APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonNM; [PERSONNEL:11]Name:2)
								APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonCD; [PERSONNEL:11]Initials:1)
								If ([PERSONNEL:11]Global_Access:47)
									APPEND TO ARRAY:C911(SD2_at_DiaryPersREL; "Resource")
									APPEND TO ARRAY:C911(SD2_al_DiaryPersREL; -1)
								Else 
									If ($_bo_FirstPerson)
										APPEND TO ARRAY:C911(SD2_at_DiaryPersREL; "Owner")
										APPEND TO ARRAY:C911(SD2_al_DiaryPersREL; 1)
									Else 
										APPEND TO ARRAY:C911(SD2_at_DiaryPersREL; "Diary Item Person")
										APPEND TO ARRAY:C911(SD2_al_DiaryPersREL; 2)
									End if 
								End if 
							End if 
						End if 
						
					Else 
						$_l_GroupID:=Abs:C99($_l_WhoseDiary)
						If (Not:C34($_bo_GroupsLoaded))
							$_obj_DiaryGroups:=SD_groupPrefs
							OB GET ARRAY:C1229($_obj_DiaryGroups; "DiaryGroupNames"; SD_at_DiaryGroupNames)
							OB GET ARRAY:C1229($_obj_DiaryGroups; "DiaryGroupIDS"; SD_al_DiaryGroupIDS)
							OB GET ARRAY:C1229($_obj_DiaryGroups; "DiaryGroupOwners"; SD_al_DiaryGroupOwners)
							
						End if 
						$_l_Ref:=Find in array:C230(SD_al_DiaryGroupIDS; $_l_GroupID)
						If ($_l_Ref>0)
							APPEND TO ARRAY:C911(SD2_al_DiaryOwnerpersons; $_l_GroupID)
							APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonNM; SD_at_DiaryGroupNames{$_l_Ref})
							APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonCD; "")
							APPEND TO ARRAY:C911(SD2_at_DiaryPersREL; "Group Item owner")
							APPEND TO ARRAY:C911(SD2_al_DiaryPersREL; 3)
						End if 
					End if 
				End if 
			End for 
		End if 
		SD2_GetAttributeValue($_ptr_attributes; "Whose Diaries"; ->$_al_ExcludeFromAdder)
		
		
		
		$_bo_Exclude:=($_al_ExcludeFromAdder=1)
	End if 
	//so if no persons on the action or there was no action
	If (Not:C34($_bo_Exclude)) | (Size of array:C274(SD2_al_DiaryOwnerpersons)=0)  // so if Exclude is ticked but no persons then it does get added
		[DIARY:12]Person:8:=SD2_t_WhoseDiary
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD2_t_WhoseDiary)  //the persons diary this is being added to
		If (Records in selection:C76([PERSONNEL:11])>0)
			SD2_t_DiaryOwnerName:=[PERSONNEL:11]Name:2
			If ([PERSONNEL:11]PersonDeleted:38=0)
				APPEND TO ARRAY:C911(SD2_al_DiaryOwnerpersons; $_al_WhoseDiary)
				APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonNM; [PERSONNEL:11]Name:2)
				APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonCD; [PERSONNEL:11]Initials:1)
				If ([PERSONNEL:11]Global_Access:47)
					APPEND TO ARRAY:C911(SD2_at_DiaryPersREL; "Resource")
					APPEND TO ARRAY:C911(SD2_al_DiaryPersREL; -1)
				Else 
					APPEND TO ARRAY:C911(SD2_at_DiaryPersREL; "Owner")
					APPEND TO ARRAY:C911(SD2_al_DiaryPersREL; 1)
				End if 
			End if 
		End if 
	Else 
		//exclude the person so make the diary person the first person
		If (Size of array:C274(SD2_al_DiaryOwnerpersons)>0)
			[DIARY:12]Person:8:=SD2_at_DiaryOwnerPersonCD{1}
			SD2_t_DiaryOwnerName:=SD2_at_DiaryOwnerPersonNM{1}
		End if 
	End if 
	//Also set the people as invitees(for schedule entry screen), and a group of person(other people) for the workflow
End if 
//This is only relevent for schedule items-such as meetings where the invitees can be internal or external. so this is seperate to whose diary it appears in
///
If (Size of array:C274(SD2_al_DiaryOwnerPersons)>0)
	For ($_l_Invitees; 1; Size of array:C274(SD2_al_DiaryOwnerPersons))
		If (SD2_at_DiaryOwnerPersonCD{$_l_Invitees}#[DIARY:12]Person:8)
			$_l_FindInvitee:=Find in array:C230(SD2_at_Invitees; SD2_at_DiaryOwnerPersonNM{$_l_Invitees})
			If ($_l_FindInvitee<0)  //don't invite the same person twice!!
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD2_at_DiaryOwnerPersonCD{$_l_Invitees})
				//Being a new record these will be stored in the array-
				APPEND TO ARRAY:C911(SD2_at_Invitees; SD2_at_DiaryOwnerPersonNM{$_l_Invitees})
				APPEND TO ARRAY:C911(SD2_al_InviteeClass; 0)
				APPEND TO ARRAY:C911(SD2_at_inviteeClass; "Internal")
				APPEND TO ARRAY:C911(SD2_at_InviteeEmailAddress; [PERSONNEL:11]Email_Address:36)
				APPEND TO ARRAY:C911(SD2_al_InviteeStatus; 0)
				$_l_FindStatus:=Find in array:C230(SD2_al_InviteStati; SD2_al_InviteeStatus{Size of array:C274(SD2_al_InviteeStatus)})
				APPEND TO ARRAY:C911(SD2_at_InviteeStatus; SD2_at_InviteStati{$_l_FindStatus})
				APPEND TO ARRAY:C911(SD2_al_RecordID; 0)
			End if 
		End if 
	End for 
	ARRAY TEXT:C222(SD2_at_InviteeComb; Size of array:C274(SD2_at_Invitees))
	For ($_l_Invitees; 1; Size of array:C274(SD2_at_Invitees))
		If (SD2_at_InviteeEmailAddress{$_l_Invitees}#"")
			SD2_at_InviteeComb{$_l_Invitees}:=SD2_at_Invitees{$_l_Invitees}+"  <"+SD2_at_InviteeEmailAddress{$_l_Invitees}+">"
		Else 
			SD2_at_InviteeComb{$_l_Invitees}:=SD2_at_Invitees{$_l_Invitees}+"  <"+"(No Email)"+">"
		End if 
	End for 
	ARRAY PICTURE:C279(SD2_apic_InfoPic; Size of array:C274(SD2_at_InviteeComb))
	//GET PICTURE FROM LIBRARY(418; $_pic_Picture)
	$_pic_Picture:=Get_Picture(418)
	For ($_l_Index; 1; Size of array:C274(SD2_at_InviteeComb))
		SD2_apic_InfoPic{$_l_Index}:=$_pic_Picture
	End for 
End if 
////
UNLOAD RECORD:C212([PERSONNEL:11])


SD2_l_Completed:=0
If ([DIARY:12]Action_Code:9#"")  //set the done check box
	If (Not:C34([DIARY:12]Done:14))
		
		SD2_GetAttributeValue($_ptr_attributes; "Done Action"; ->$_bo_RecordDoneTimeDate)
	Else 
		$_bo_RecordDoneTimeDate:=True:C214
	End if 
Else 
	If (Not:C34([DIARY:12]Done:14))
		
		$_bo_RecordDoneTimeDate:=False:C215
	Else 
		$_bo_RecordDoneTimeDate:=True:C214
	End if 
End if 
SD2_l_Completed:=Num:C11($_bo_RecordDoneTimeDate)  //and set Diary_Done-no that gets done when we save
Case of 
	: ([DIARY:12]Done:14)
		If ([DIARY:12]Date_Done_From:5=!00-00-00!) & ([DIARY:12]Date_Done_To:34=!00-00-00!) & ([DIARY:12]Time_Done_From:7=?00:00:00?) & ([DIARY:12]Time_Done_To:36=?00:00:00?)
			$_bo_SetTimes:=True:C214
		End if 
	Else 
		If ([DIARY:12]Date_Do_From:4=!00-00-00!) & ([DIARY:12]Date_Do_To:33=!00-00-00!) & ([DIARY:12]Time_Do_From:6=?00:00:00?) & ([DIARY:12]Time_Do_To:35=?00:00:00?)
			$_bo_SetTimes:=True:C214
		End if 
End case 
If ($_bo_SetTimes)
	SD_SetDiaryDateTime($_ptr_attributes)
End if 

///end from revised code
//note that the above only happens if its a record with no Date_Time-so if it was passed a date/time none of that happens.
SD2_SetDisplayTime
//One way or another the diary item should have a start time- an end time is set if the record is closed with a result
//Does the Diary have a reminder setting. Note that her
If ([DIARY:12]Action_Code:9#"") & ((Not:C34([DIARY:12]Done:14)) & (([DIARY:12]Date_Do_From:4>Current date:C33(*)) | (([DIARY:12]Date_Do_From:4>Current date:C33(*)) & ([DIARY:12]Time_Do_From:6>=Current time:C178(*)))))
	
	
	
	SD2_GetAttributeValue($_ptr_attributes; "Reminder"; ->$_l_SetReminder)
	
	If ($_l_SetReminder=1)  //set reminder by default
		SD2_GetAttributeValue($_ptr_attributes; "Reminder Time"; ->$_l_ReminderTime)
		SD2_GetAttributeValue($_ptr_attributes; "Reminder Time Type"; ->$_l_ReminderTimeType)
		If ($_l_ReminderTime>0)
			//The alarm time frame is always stored in minutes
			If ($_l_ScriptCodeRow>0)
				Case of 
					: (SD2_al_ActionVirtFieldDataLong{$_l_ScriptCodeRow}=2)  // Days
						$_l_OneDay:=24*60
						[DIARY:12]Alarm_Timeframe:48:=$_l_ReminderTime*$_l_OneDay
					: (SD2_al_ActionVirtFieldDataLong{$_l_ScriptCodeRow}=1)  //Hours
						$_l_OneHour:=60
						[DIARY:12]Alarm_Timeframe:48:=$_l_ReminderTime*$_l_OneHour
					Else 
						[DIARY:12]Alarm_Timeframe:48:=$_l_ReminderTime  //minutes
				End case 
				//Now set the screen values -not the visibility
				If ([DIARY:12]Alarm_Timeframe:48#0)
					$_l_AbsTimeFrame:=Abs:C99([DIARY:12]Alarm_Timeframe:48)
					SD2_l_CB_Alarmed:=1
					
					Case of 
						: ($_l_AbsTimeFrame>(60*24))  //DAYS/Hours/mins
							$_l_Days:=$_l_AbsTimeFrame/(60*24)
							$_l_Remainder:=$_l_AbsTimeFrame-($_l_Days*(60*24))
							If ($_l_Remainder>0)
								$_l_Hours:=$_l_Remainder/60
								$_l_Remainder:=$_l_Remainder-($_l_Hours*(60))
								If ($_l_Remainder>0)
									SD2_l_TimeFrame:=$_l_AbsTimeFrame
									SD2_t_TimeFrame:="Minutes"
								Else 
									SD2_l_TimeFrame:=$_l_Hours+($_l_Days*24)
									SD2_t_TimeFrame:="Hours"
								End if 
							Else 
								SD2_l_TimeFrame:=$_l_Days
								SD2_t_TimeFrame:="Days"
							End if 
							If ([DIARY:12]Alarm_Timeframe:48<0)
								SD2_l_TimeFrame:=-SD2_l_TimeFrame
							End if 
						: ($_l_AbsTimeFrame>60)  //hours
							
							
							$_l_Hours:=$_l_AbsTimeFrame/60
							$_l_Remainder:=$_l_AbsTimeFrame-($_l_Hours*(60))
							If ($_l_Remainder>0)
								SD2_l_TimeFrame:=$_l_AbsTimeFrame
								SD2_t_TimeFrame:="Minutes"
							Else 
								SD2_l_TimeFrame:=$_l_Hours
								SD2_t_TimeFrame:="Hours"
							End if 
							If ([DIARY:12]Alarm_Timeframe:48<0)
								SD2_l_TimeFrame:=-SD2_l_TimeFrame
							End if 
							
						Else 
							//   Minutes
							SD2_l_TimeFrame:=[DIARY:12]Alarm_Timeframe:48
							SD2_t_TimeFrame:="Minutes"
							//time frame already set so calc mins/hours/etc
					End case 
				Else 
					SD2_l_TimeFrame:=0
					SD2_t_TimeFrame:=""
					SD2_l_CB_Alarmed:=0
				End if 
				
			End if 
			
			
		End if 
	End if 
	
	
	
	
	
	
	If ([DIARY:12]Action_Details:10="")
		$_l_ScriptCodeRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Default Description")
		If ($_l_ScriptCodeRow>0)
			[DIARY:12]Action_Details:10:=SD2_at_ActionVirtFieldDataTXT{$_l_ScriptCodeRow}
		End if 
	End if 
	//Check 4D write is installed!!!
	
	$_l_ScriptCodeRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Use WP for action Description")
	If ($_l_ScriptCodeRow>0)
		If (SD2_al_ActionVirtFieldDataLong{$_l_ScriptCodeRow}=1)  //use wp entry area....
			//Load the document
			If (DB_UserHas4DWriteAccess)
				$_l_ScriptNametRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Document Code")
				$_t_DocumentCode:=SD2_at_ActionVirtFieldDataTXT{$_l_ScriptNametRow}
				If ($_t_DocumentCode#"")
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_DocumentCode)
					If (Records in selection:C76([DOCUMENTS:7])>0)
						Case of 
							: ([DOCUMENTS:7]Document_Class:14=4D Write Letter Template) | ([DOCUMENTS:7]Document_Class:14=4D Write Letter) | ([DOCUMENTS:7]Document_Class:14=0)
								
								//Here duplicate the document and set the document code on the diary
								//Actually NO-don't do that-no need to create a document at all we will never store the document
								SD2_t_DocumentDisplayCode:=$_t_DocumentCode
								SD2_bo_ShowDetailsASWP:=True:C214
							Else 
								SD2_bo_ShowDetailsASWP:=False:C215
						End case 
					Else 
						SD2_bo_ShowDetailsASWP:=False:C215
					End if 
				Else 
					//no default document but do show as WP area
					SD2_bo_ShowDetailsASWP:=True:C214
					SD2_t_DocumentDisplayCode:=$_t_DocumentCode
				End if 
			Else 
				//we wanted to use a 4D write area for this form but the user does not have 4D write so load the text of the document
				SD2_bo_ShowDetailsASWP:=False:C215
			End if 
		Else 
			SD2_bo_ShowDetailsASWP:=False:C215
			$_l_ScriptNametRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Document Code")
			$_t_DocumentCode:=SD2_at_ActionVirtFieldDataTXT{$_l_ScriptNametRow}
			//Copy this document and put the document code on the diary record
		End if 
	Else 
		SD2_bo_ShowDetailsASWP:=False:C215
	End if 
	//Static  field values would only be used rarely-say for a diary action that was always for the same company
	$_l_RecordCodesPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Static Record Codes")
	If ($_l_RecordCodesPosition>0)
		$_l_RecordFieldsPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Static Record Fields")
		If ($_l_RecordFieldsPosition>0)
			For ($_l_Index; 1; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_RecordCodesPosition}))
				If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_RecordCodesPosition})>=$_l_Index)
					$_ptr_FieldPointer:=Field:C253(Table:C252(->[DIARY:12]); SD2_al_ActionVirtFieldDataMANY{$_l_RecordFieldsPosition}{$_l_Index})
					$_ptr_FieldPointer->:=SD2_at_ActionVirtFieldDataMA{$_l_RecordCodesPosition}{$_l_Index}
				End if 
			End for 
		End if 
	End if 
	$_l_ScriptCodeRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Codes")
	$_l_ScriptNametRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Names")
	$_l_ScriptEventRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Event")
	$_l_RelationTypeElement:=Find in array:C230(SD2_at_ActionVirtFieldName; "Ignore Other Macros")
	ARRAY TEXT:C222(SD2_at_Scripts; 0)
	ARRAY LONGINT:C221(SD2_AL_MacroEvent; 0)
	//Events are
	//1=on saving new record
	//2on saving existing record
	//3 on loading record
	//4 On setting a record code (is a field macro on the current setup)
	ARRAY LONGINT:C221(SD2_AL_MacroignoreStd; 0)
	If ($_l_ScriptCodeRow>0)
		ARRAY TEXT:C222(SD2_at_Scripts; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ScriptCodeRow}))
		ARRAY LONGINT:C221(SD2_AL_MacroEvent; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ScriptCodeRow}))
		ARRAY LONGINT:C221(SD2_AL_MacroignoreStd; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ScriptCodeRow}))  // ignore std macros
		
		For ($_l_Index; 1; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ScriptCodeRow}))
			SD2_at_Scripts{$_l_Index}:=SD2_at_ActionVirtFieldDataMA{$_l_ScriptCodeRow}{$_l_Index}
			SD2_AL_MacroEvent{$_l_Index}:=SD2_al_ActionVirtFieldDataMANY{$_l_ScriptEventRow}{$_l_Index}
			SD2_AL_MacroignoreStd{$_l_Index}:=SD2_al_ActionVirtFieldDataMANY{$_l_RelationTypeElement}{$_l_Index}  //note that i have set this up like this but the interface only allows on esetting
		End for 
	End if 
	$_l_ActionField:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Level Field Macros")
	If ($_l_ActionField>0)
		SD2_l_FieldLevelMacros:=SD2_al_ActionVirtFieldDataLong{$_l_ActionField}
	End if 
	$_l_IgnoreScriptsField:=Find in array:C230(SD2_at_ActionVirtFieldName; "Ignore Other Macros")
	If ($_l_IgnoreScriptsField>0)
		SD2_l_IgnoreStdMacros:=SD2_al_ActionVirtFieldDataLong{$_l_IgnoreScriptsField}
	End if 
	$_l_ResultCodeField:=Find in array:C230(SD2_at_ActionVirtFieldName; "Result Codes")
	If ($_l_ResultCodeField>0)
		If (Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ResultCodeField})>0)
			
			ARRAY TEXT:C222(SD2_at_ResultCodes; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ResultCodeField}))
			ARRAY TEXT:C222(SD2_at_ResultNames; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ResultCodeField}))
			For ($_l_Index; 1; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ResultCodeField}))
				SD2_at_ResultCodes{$_l_Index}:=SD2_at_ActionVirtFieldDataMA{$_l_ResultCodeField}{$_l_Index}
				$_l_ResultsCodePosition:=Find in array:C230(SD2_at_AllResultCodes; SD2_at_ResultCodes{$_l_Index})
				If ($_l_ResultsCodePosition>0)
					SD2_at_ResultNames{$_l_Index}:=SD2_at_AllresultNames{$_l_ResultsCodePosition}
				End if 
			End for 
		Else 
			//all results
			ARRAY TEXT:C222(SD2_at_ResultCodes; 0)
			ARRAY TEXT:C222(SD2_at_ResultNames; 0)
			
		End if 
	End if 
	$_l_PostActionPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Post Time processing Action")
	If ($_l_PostActionPosition>0)
		SD2_l_autoActionCode:=SD2_al_ActionVirtFieldDataLong{$_l_PostActionPosition}
		[DIARY:12]x_Close_Options:71:=SD2_l_autoActionCode
		//The options here are
		//SD2_at_AutoActions{1}:="No automatic action"
		//SD2_at_AutoActions{2}:="Nag user"
		//SD2_at_AutoActions{3}:="Put in to-do list"
		//SD2_at_AutoActions{4}:="Auto complete"
		//SD2_at_AutoActions{5}:="Force user to complete"
		//SD2_al_AutoActionCodes{1}:=0
		//SD2_al_AutoActionCodes{2}:=1
		//SD2_al_AutoActionCodes{3}:=2
		//SD2_al_AutoActionCodes{4}:=3
		//SD2_al_AutoActionCodes{5}:=4
	End if 
	//TRACE
	$_l_DonectionPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Done Action")
	If ($_l_DonectionPosition>0)
		$_l_CBPostAction:=SD2_al_ActionVirtFieldDataLong{$_l_DonectionPosition}
	Else 
		$_l_CBPostAction:=0
	End if 
	If ($_l_CBPostAction=0)  //not a 'done' action
		$_l_StartTimePosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Start Time")
		If ($_l_StartTimePosition>0)
			[DIARY:12]Time_Do_From:6:=Time:C179(Time string:C180(SD2_al_ActionVirtFieldDataLong{$_l_StartTimePosition}))
		Else 
			[DIARY:12]Time_Do_From:6:=SD2_ti_TimeDoFrom
		End if 
		$_l_EndTimePosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "End Time")
		If ($_l_EndTimePosition>0)
			SD2_ti_TimeEnd:=Time:C179(Time string:C180(SD2_al_ActionVirtFieldDataLong{$_l_EndTimePosition}))
		Else 
			SD2_ti_TimeEnd:=SD2_ti_TimeDoTo
		End if 
		//[DIARY]Date Do From
		//[DIARY]Date Do To
		//[DIARY]Date Done From
		//[DIARY]Date Done To
		//[DIARY]Time Do From
		//[DIARY]Time Do To
		//[DIARY]Time Done From
		//[DIARY]Time Done To
	Else 
		[DIARY:12]Done:14:=True:C214
		$_d_CurrentDate:=Current date:C33(*)
		$_ti_CurrentTime:=Current time:C178(*)
		$_l_ScriptCodeRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Amount of Time")
		If ($_l_ScriptCodeRow>0)
			$_l_SD2TimeAmount:=SD2_al_ActionVirtFieldDataLong{$_l_ScriptCodeRow}
			$_l_ScriptCodeRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Amount of Time Type")
			If ($_l_ScriptCodeRow>0)
				Case of 
					: (SD2_al_ActionVirtFieldDataLong{$_l_ScriptCodeRow}=2)
						$_l_TimeAmount:=60*60*60*24*$_l_SD2TimeAmount
					: (SD2_al_ActionVirtFieldDataLong{$_l_ScriptCodeRow}=1)
						//hours
						$_l_TimeAmount:=60*60*60*$_l_SD2TimeAmount
					Else 
						//minutes
						$_l_TimeAmount:=60*60*$_l_SD2TimeAmount
				End case 
			Else 
				
				$_l_TimeAmount:=60*$_l_SD2TimeAmount
			End if 
			
			
			$_l_TimeAmount:=0*$_l_SD2TimeAmount
		Else 
			
			
			$_l_TimeAmount:=0*$_l_SD2TimeAmount
		End if 
		[DIARY:12]Date_Do_From:4:=$_d_CurrentDate
		[DIARY:12]Date_Do_To:33:=$_d_CurrentDate
		[DIARY:12]Date_Done_From:5:=$_d_CurrentDate
		[DIARY:12]Date_Done_To:34:=$_d_CurrentDate
		[DIARY:12]Display_Date_From:51:=$_d_CurrentDate
		[DIARY:12]Time_Do_From:6:=$_ti_CurrentTime
		[DIARY:12]Time_Do_To:35:=$_ti_CurrentTime
		[DIARY:12]Time_Done_From:7:=$_ti_CurrentTime
		[DIARY:12]Time_Done_To:36:=$_ti_CurrentTime
		[DIARY:12]Display_Time_From:53:=$_ti_CurrentTime
		[DIARY:12]Display_Time_To:54:=$_ti_CurrentTime
		OBJECT SET VISIBLE:C603([DIARY:12]Display_Date_To:52; False:C215)
		
	End if 
	
	
End if 

///Start of load relations
//Normally a diary item would be relatd to one contact and one company. but here we are enabling the possibility of more than one.

ARRAY TEXT:C222(SD2_at_RelatedCompanyCodes; 0)
ARRAY TEXT:C222(SD2_at_RelatedCompanyNames; 0)
ARRAY LONGINT:C221(SD2_al_RelatedCompanyIDs; 0)
If ([DIARY:12]x_ID:50>0) & (Not:C34(SD_bo_NewRecord))
	QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[COMPANIES:2]))
	If (Records in selection:C76([xDiaryRelations:137])>0)
		SELECTION TO ARRAY:C260([xDiaryRelations:137]xRecordID:4; SD2_al_RelatedCompanyIDs; [xDiaryRelations:137]XRecord_Code:5; SD2_at_RelatedCompanyCodes; [xDiaryRelations:137]X_DisplayedName:6; SD2_at_RelatedCompanyNames)
		
	End if 
Else 
	REDUCE SELECTION:C351([xDiaryRelations:137]; 0)
	
End if 
//NG note here -add in any contacts passed in the areas AutoAdd(See SD2_SetFieldValues)


OB GET PROPERTY NAMES:C1232([DIARY:12]Attributes:79; $_at_AttributeNames; $_al_AttributeTypes)
$_t_FieldReferenceName:="Static Record Fields"
$_t_RecordReferenceName:="Static Record Codes"
$_l_StaticFieldPosition:=Find in array:C230($_at_ObjectAttributeNames; $_t_FieldReferenceName)
$_l_StaticRecordPosition:=Find in array:C230($_at_ObjectAttributeNames; $_t_RecordReferenceName)
$_l_StaticFieldPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Static Record Fields")  //This is 'field' in the action..
$_l_StaticRecordPosition:=Find in array:C230($_at_ObjectAttributeNames; $_t_RecordReferenceName)

If ([DIARY:12]Company_Code:1#"")
	$_l_ArrayPosition:=Find in array:C230(SD2_at_RelatedCompanyCodes; [DIARY:12]Company_Code:1)
	If ($_l_ArrayPosition<0)
		If ([DIARY:12]Company_Code:1#[DIARY:12]Company_Code:1)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
			$_bo_Unload:=True:C214
		End if 
		If (Records in selection:C76([COMPANIES:2])>0)
			APPEND TO ARRAY:C911(SD2_at_RelatedCompanyCodes; [DIARY:12]Company_Code:1)
			APPEND TO ARRAY:C911(SD2_al_RelatedCompanyIDs; [COMPANIES:2]x_ID:63)
			If ([COMPANIES:2]Company_Name:2="")
				If ([COMPANIES:2]Private:37)
					$_t_CompanyName:="("+"Home Address"+")"
				Else 
					If ([COMPANIES:2]Address_Line_one:3#"")
						$_t_CompanyName:="("+[COMPANIES:2]Address_Line_one:3+")"
					Else 
						$_t_CompanyName:="("+"Unknown"+")"
					End if 
				End if 
				
			Else 
				$_t_CompanyName:=[COMPANIES:2]Company_Name:2
			End if 
			APPEND TO ARRAY:C911(SD2_at_RelatedCompanyNames; $_t_CompanyName)
		End if 
	End if 
	
Else 
	If (SD_bo_NewRecord)  //we only get the attribute data on a new record
		$_l_CompanyFIeld:=Field:C253(->[DIARY:12]Company_Code:1)
		
		If ($_l_StaticFieldPosition>0) & ($_l_StaticRecordPosition>0)
			OB GET ARRAY:C1229([DIARY:12]Attributes:79; $_t_FieldReferenceName; $_al_FieldReferences)
			$_l_CompanyFieldPosition:=Find in array:C230($_al_FieldReferences; $_l_CompanyFIeld)
			If ($_l_CompanyFieldPosition>0)
				OB GET ARRAY:C1229([DIARY:12]Attributes:79; $_t_RecordReferenceName; $_at_FieldRecordCode)
				For ($_l_Index; $_l_CompanyFieldPosition; Size of array:C274($_al_FieldReferences))
					If ($_al_FieldReferences{$_l_Index}=$_l_CompanyFIeld)
						$_t_CompanyCode:=$_at_FieldRecordCode{$_l_Index}
						If ([COMPANIES:2]Company_Code:1#$_t_CompanyCode)
							$_bo_Unload:=True:C214
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
						End if 
						
						If (Records in selection:C76([COMPANIES:2])>0)
							If ([COMPANIES:2]Deleted:61=0)
								If ([DIARY:12]Company_Code:1#"")
									[DIARY:12]Company_Code:1:=$_t_CompanyCode
								End if 
								APPEND TO ARRAY:C911(SD2_at_RelatedCompanyCodes; [COMPANIES:2]Company_Code:1)
								APPEND TO ARRAY:C911(SD2_at_RelatedCompanyNames; [COMPANIES:2]Company_Name:2)
								APPEND TO ARRAY:C911(SD2_al_RelatedCompanyIDs; [COMPANIES:2]x_ID:63)
								If ([COMPANIES:2]Company_Name:2="")
									If ([COMPANIES:2]Private:37)
										$_t_CompanyName:="("+"Home Address"+")"
									Else 
										If ([COMPANIES:2]Address_Line_one:3#"")
											$_t_CompanyName:="("+[COMPANIES:2]Address_Line_one:3+")"
										Else 
											$_t_CompanyName:="("+"Unknown"+")"
										End if 
									End if 
								Else 
									$_t_CompanyName:=[COMPANIES:2]Company_Name:2
								End if 
								APPEND TO ARRAY:C911(SD2_at_RelatedCompanyNames; $_t_CompanyName)
							End if 
							
						End if 
					End if 
				End for 
			End if 
		End if 
	End if 
End if 


//[DIARY]Company Code;
//[DIARY]Contact Code
ARRAY TEXT:C222(SD2_at_RelatedContactsCodes; 0)
ARRAY TEXT:C222(SD2_at_RelatedContactName; 0)
ARRAY LONGINT:C221(SD2_al_relatedContactID; 0)
ARRAY TEXT:C222($_at_EmailAddress; 0)
If ([DIARY:12]x_ID:50>0) & (Not:C34(SD_bo_NewRecord))
	QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[CONTACTS:1]))
	If (Records in selection:C76([xDiaryRelations:137])>0)
		SELECTION TO ARRAY:C260([xDiaryRelations:137]xRecordID:4; SD2_al_relatedContactID; [xDiaryRelations:137]XRecord_Code:5; SD2_at_RelatedContactsCodes; [xDiaryRelations:137]X_DisplayedName:6; SD2_at_RelatedContactName)
		ARRAY TEXT:C222($_at_EmailAddress; Size of array:C274(SD2_al_relatedContactID))
	End if 
Else 
	//we might have a fixed contact to add
	
End if 
If ([DIARY:12]Contact_Code:2#"")
	$_l_ContactCodePosition:=Find in array:C230(SD2_at_RelatedContactsCodes; [DIARY:12]Contact_Code:2)
	If ($_l_ContactCodePosition<0)
		If ([CONTACTS:1]Contact_Code:2#[DIARY:12]Contact_Code:2)
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[DIARY:12]Contact_Code:2)
		End if 
		If (Records in selection:C76([CONTACTS:1])>0)
			If ([CONTACTS:1]Deleted:32=0)
				APPEND TO ARRAY:C911(SD2_at_RelatedContactsCodes; [CONTACTS:1]Contact_Code:2)
				If ([CONTACTS:1]Contact_Name:31#"")
					APPEND TO ARRAY:C911(SD2_at_RelatedContactName; [CONTACTS:1]Contact_Name:31)
				Else 
					APPEND TO ARRAY:C911(SD2_at_RelatedContactName; [CONTACTS:1]Job_Title:6)
				End if 
				APPEND TO ARRAY:C911(SD2_al_relatedContactID; [CONTACTS:1]x_ID:33)
				APPEND TO ARRAY:C911($_at_EmailAddress; [CONTACTS:1]Email_Address:35)
			End if 
		End if 
	End if 
Else 
	If (SD_bo_NewRecord)
		//Look for an static add for this type of diary action.
		$_l_ContactFIeldNum:=Field:C253(->[DIARY:12]Contact_Code:2)
		
		If ($_l_StaticFieldPosition>0) & ($_l_StaticRecordPosition>0)
			OB GET ARRAY:C1229([DIARY:12]Attributes:79; $_t_FieldReferenceName; $_al_FieldReferences)
			$_l_ContactFieldPosition:=Find in array:C230($_al_FieldReferences; $_l_ContactFIeldNum)
			If ($_l_ContactFieldPosition>0)
				OB GET ARRAY:C1229([DIARY:12]Attributes:79; $_t_RecordReferenceName; $_at_FieldRecordCode)
				For ($_l_Index; $_l_ContactFieldPosition; Size of array:C274($_al_FieldReferences))
					If ($_al_FieldReferences{$_l_Index}=$_l_ContactFIeldNum)
						$_t_ContactCode:=$_at_FieldRecordCode{$_l_Index}
						
						//SD2_al_StaticFieldNUMs{2}:=Field(->[DIARY]Contact Code)
						If ([CONTACTS:1]Contact_Code:2#$_t_ContactCode)
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
						End if 
						If (Records in selection:C76([CONTACTS:1])>0)
							If ([DIARY:12]Contact_Code:2="")
								[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
							End if 
							If ([CONTACTS:1]Deleted:32=0)
								APPEND TO ARRAY:C911(SD2_at_RelatedContactsCodes; [CONTACTS:1]Contact_Code:2)
								If ([CONTACTS:1]Contact_Name:31#"")
									APPEND TO ARRAY:C911(SD2_at_RelatedContactName; [CONTACTS:1]Contact_Name:31)
								Else 
									APPEND TO ARRAY:C911(SD2_at_RelatedContactName; [CONTACTS:1]Job_Title:6)
								End if 
								APPEND TO ARRAY:C911(SD2_al_relatedContactID; [CONTACTS:1]x_ID:33)
								APPEND TO ARRAY:C911($_at_EmailAddress; [CONTACTS:1]Email_Address:35)
							End if 
						End if 
					End if 
				End for 
				
			End if 
		End if 
	End if 
End if 
//TRACE

//now add them to the invitees list as well...
//NOT in the workflow though because the 'invitees' are the actioners..
For ($_l_Index; 1; Size of array:C274(SD2_at_RelatedContactsCodes))
	APPEND TO ARRAY:C911(SD2_at_Invitees; SD2_at_RelatedContactName{$_l_Index})
	APPEND TO ARRAY:C911(SD2_al_InviteeClass; 1)
	APPEND TO ARRAY:C911(SD2_at_inviteeClass; "Contact")
	APPEND TO ARRAY:C911(SD2_at_InviteeEmailAddress; $_at_EmailAddress{$_l_Index})
	APPEND TO ARRAY:C911(SD2_al_InviteeStatus; 0)
	$_l_StatusPosition:=Find in array:C230(SD2_al_InviteStati; SD2_al_InviteeStatus{Size of array:C274(SD2_al_InviteeStatus)})
	APPEND TO ARRAY:C911(SD2_at_InviteeStatus; SD2_at_InviteStati{$_l_StatusPosition})
	APPEND TO ARRAY:C911(SD2_al_RecordID; SD2_al_relatedContactID{$_l_Index})
End for 
//NG so thats only from the schedule really where you make an item and add invitees where the invitees can be internal or external.

//Here we test that if there is a contact code there is a company code...
If (Size of array:C274(SD2_at_RelatedContactsCodes)>0)
	If (Size of array:C274(SD2_at_RelatedCompanyCodes)=0)
		//there is a contact but no company..so
		$_t_ContactCode:=SD2_at_RelatedContactsCodes{1}
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
		$_t_CompanyCode:=[CONTACTS:1]Company_Code:1
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
		If (Records in selection:C76([COMPANIES:2])=1)
			If ([COMPANIES:2]Deleted:61=0)
				
				
				APPEND TO ARRAY:C911(SD2_at_RelatedCompanyCodes; [CONTACTS:1]Contact_Code:2)
				APPEND TO ARRAY:C911(SD2_al_RelatedCompanyIDs; [CONTACTS:1]x_ID:33)
				If ([COMPANIES:2]Company_Name:2="")
					If ([COMPANIES:2]Private:37)
						$_t_CompanyName:="("+"Home Address"+")"
					Else 
						If ([COMPANIES:2]Address_Line_one:3#"")
							$_t_CompanyName:="("+[COMPANIES:2]Address_Line_one:3+")"
						Else 
							$_t_CompanyName:="("+"Unknown"+")"
						End if 
					End if 
				Else 
					$_t_CompanyName:=[COMPANIES:2]Company_Name:2
				End if 
				APPEND TO ARRAY:C911(SD2_at_RelatedCompanyNames; $_t_CompanyName)
				///NG November 2019 this is wrong-the company code  should only be set it if is blank[DIARY]Company_Code:=[CONTACTS]Contact_Code
				
			End if 
		End if 
		
		
	End if 
Else 
	//no contacts  on this diary record
	If (Size of array:C274(SD2_at_RelatedCompanyCodes)>0)
		For ($_l_Index; 1; Size of array:C274(SD2_at_RelatedCompanyCodes))
			APPEND TO ARRAY:C911(SD2_at_Invitees; SD2_at_RelatedCompanyNames{$_l_Index})
			APPEND TO ARRAY:C911(SD2_al_InviteeClass; 3)
			APPEND TO ARRAY:C911(SD2_at_inviteeClass; "Company")
			APPEND TO ARRAY:C911(SD2_at_InviteeEmailAddress; "(Not applicable)")
			APPEND TO ARRAY:C911(SD2_al_InviteeStatus; 0)
			$_l_StatusPosition:=Find in array:C230(SD2_al_InviteStati; SD2_al_InviteeStatus{Size of array:C274(SD2_al_InviteeStatus)})
			APPEND TO ARRAY:C911(SD2_at_InviteeStatus; SD2_at_InviteStati{$_l_StatusPosition})
			APPEND TO ARRAY:C911(SD2_al_RecordID; SD2_al_RelatedCompanyIDs{$_l_Index})
		End for 
	End if 
End if 

//the concept of invitees only applies to specific types of diary items-ones that appear in the schedule

ARRAY TEXT:C222(SD2_at_InviteeComb; Size of array:C274(SD2_at_Invitees))
For ($_l_Invitees; 1; Size of array:C274(SD2_at_Invitees))
	If (SD2_at_InviteeEmailAddress{$_l_Invitees}#"")
		SD2_at_InviteeComb{$_l_Invitees}:=SD2_at_Invitees{$_l_Invitees}+"  <"+SD2_at_InviteeEmailAddress{$_l_Invitees}+">"
	Else 
		SD2_at_InviteeComb{$_l_Invitees}:=SD2_at_Invitees{$_l_Invitees}+"  <"+"(No Email)"+">"
	End if 
End for 


ARRAY PICTURE:C279(SD2_apic_InfoPic; Size of array:C274(SD2_at_InviteeComb))
//GET PICTURE FROM LIBRARY(418; $_pic_Picture)
$_pic_Picture:=Get_Picture(418)
For ($_l_Index; 1; Size of array:C274(SD2_at_InviteeComb))
	SD2_apic_InfoPic{$_l_Index}:=$_pic_Picture
End for 
//`Now we build the other relations.



//
ARRAY LONGINT:C221(SD2_al_RelationTypesS; 0)
ARRAY TEXT:C222(SD2_at_RelationTypesS; 0)
ARRAY LONGINT:C221(SD2_al_RelationTablesS; 0)
ARRAY TEXT:C222(SD2_at_RelationTablesS; 0)
ARRAY LONGINT:C221(SD2_al_RelationRestS; 0)
ARRAY TEXT:C222(SD2_at_RelationRest; 0)


ARRAY TEXT:C222(SD2_at_RelatedRecordType; 0)
ARRAY LONGINT:C221(SD2_al_RelatedRecordTableNum; 0)  //²
ARRAY LONGINT:C221(SD2_al_RelatedtoDiaryfield; 0)
ARRAY LONGINT:C221(SD2_al_RelatedRecordID; 0)  //²
ARRAY TEXT:C222(SD2_at_RelatedRecordCode; 0)  //²
ARRAY TEXT:C222(SD2_at_RelatedRecordName; 0)  //²
ARRAY TEXT:C222(SD2_at_RelationNames; 0)
ARRAY LONGINT:C221(SD2_al_RelationTable; 0)
ARRAY LONGINT:C221(SD2_al_relationDiaryField; 0)


//Remember that this is
OB GET PROPERTY NAMES:C1232([DIARY:12]Attributes:79; $_at_DiaryAttributes; $_al_AttributeTypes)

If (Size of array:C274($_at_DiaryAttributes)>0)
	SD3_GetRelationRestrictions(->[DIARY:12]Attributes:79; ->SD2_al_RelationTypesS; ->SD2_at_RelationTypesS; ->SD2_al_RelationTablesS; ->SD2_at_RelationTablesS; ->SD2_al_RelationRestS; ->SD2_at_RelationRest)
	SD3_SetDiaryRelationsArray(SD_bo_NewRecord; ->[DIARY:12]Attributes:79; ->SD2_at_RelatedRecordType; ->SD2_al_RelatedRecordTableNum; ->SD2_al_RelatedtoDiaryfield; ->SD2_al_RelatedRecordID; ->SD2_at_RelatedRecordCode; ->SD2_at_RelatedRecordName; ->SD2_at_RelationNames; ->SD2_al_RelationTable; ->SD2_al_relationDiaryField)
Else 
	SD3_GetRelationRestrictions(->[ACTIONS:13]AttributesObject:42; ->SD2_al_RelationTypesS; ->SD2_at_RelationTypesS; ->SD2_al_RelationTablesS; ->SD2_at_RelationTablesS; ->SD2_al_RelationRestS; ->SD2_at_RelationRest)
	SD3_SetDiaryRelationsArray(SD_bo_NewRecord; ->[ACTIONS:13]AttributesObject:42; ->SD2_at_RelatedRecordType; ->SD2_al_RelatedRecordTableNum; ->SD2_al_RelatedtoDiaryfield; ->SD2_al_RelatedRecordID; ->SD2_at_RelatedRecordCode; ->SD2_at_RelatedRecordName; ->SD2_at_RelationNames; ->SD2_al_RelationTable; ->SD2_al_relationDiaryField)
End if 







//``
//[DIARY]Macro Code

//SD2_SetupLinks (SD2_al_LinkTables;SD2_al_LinkFields;SD2_al_LinkIDS)
//[DIARY]AGAccentColourBlue
//[DIARY]AGAccentColourGreen
//[DIARY]AGAccentColourRed
//[DIARY]AGFillColourBlue
//[DIARY]AGFillColourGreen
//[DIARY]AGFillColourRed
//[DIARY]Alarm_Timeframe

//$_l_ScriptCodeRow:=Find in array(
//[DIARY]Document Code
//[DIARY]DateStamp
//[DIARY]DateTimeStamp
//[DIARY]Doc Heading
//[DIARY]Original_DatetimeStamp
//[DIARY]Originator
//[DIARY]Person
//[DIARY]PersonID
//[DIARY]PersPrior
//[DIARY]Picture Code
//[DIARY]Priority
//[DIARY]Public
//[DIARY]Result Code
//[DIARY]Result Desc
//[DIARY]SourceDataField
//[DIARY]Status
//[DIARY]Subject
//[DIARY]Tim$_l_JobsTablePositione Checked
//load existing record
//End if
If (Count parameters:C259>=1)  //if we are creating a record with no form to be displayed this can be called without a parameter
	SD2_SetInterface($1)
End if 
ERR_MethodTrackerReturn("SD2_LoadDiary"; $_t_oldMethodName)
