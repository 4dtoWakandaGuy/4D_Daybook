//%attributes = {}

If (False:C215)
	//Database Method Name:      SD2_ActionAttributestoScreen
	//------------------ Method Notes ------------------
	
	
	
	// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 21/01/2010 16:51
	//Method Name: SD2_ActionAttributestoScreen
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
	
	
	//------------------ Revision Control ----------------
	//Date Created:  23/09/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_RelationMandatory;0)
	//ARRAY BOOLEAN(SD2_abo_RelationsModified;0)
	//ARRAY BOOLEAN(SD2_lb_ActionStatus;0)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	//ARRAY LONGINT(SD_al_ActionAddPersonelID;0)
	//ARRAY LONGINT(SD2_al_ActionDisplayColour;0)
	//ARRAY LONGINT(SD2_al_ActionDIsplayStatusID;0)
	//ARRAY LONGINT(SD2_al_ActionDisplaytime;0)
	//ARRAY LONGINT(SD2_al_ActionDisplayTimeType;0)
	//ARRAY LONGINT(SD2_al_ActionREALFieldNum;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldType;0)
	//ARRAY LONGINT(SD2_al_AutoActionCodes;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeIDS;0)
	//ARRAY LONGINT(SD2_al_EventIDs;0)
	//ARRAY LONGINT(SD2_al_FieldNum;0)
	//ARRAY LONGINT(SD2_al_mIgnore;0)
	//ARRAY LONGINT(SD2_al_mWhen;0)
	//ARRAY LONGINT(SD2_al_RelationRestS;0)
	//ARRAY LONGINT(SD2_al_RelationsMax;0)
	//ARRAY LONGINT(SD2_AL_RelationsMIN;0)
	//ARRAY LONGINT(SD2_al_RelationsTableNUM;0)
	//ARRAY LONGINT(SD2_al_RelationTablesS;0)
	//ARRAY LONGINT(SD2_al_RelationType;0)
	//ARRAY LONGINT(SD2_al_RelationTypesS;0)
	//ARRAY LONGINT(SD2_al_rTableNUMs;0)
	//ARRAY LONGINT(SD2_al_StaticFieldNUMs;0)
	//ARRAY LONGINT(SD2_al_TemplateIDS;0)
	//ARRAY LONGINT(SD2_al_WhoseDiary;0)
	//ARRAY LONGINT(SD2_al_WorkflowStatus;0)
	//ARRAY LONGINT(SD2_al_WorkflowTable;0)
	//ARRAY PICTURE(SD2_apic_ActionDisplayPictures;0)
	//ARRAY REAL(SD2_ar_ActionVirtFieldDataREAL;0)
	//ARRAY TEXT(SD_at_actionAdd;0)
	//ARRAY TEXT(SD2_at_ActionDisplayName;0)
	//ARRAY TEXT(SD2_at_ActionDisplayTiming;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataMA;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_AllResultCodes;0)
	//ARRAY TEXT(SD2_at_AllresultNames;0)
	//ARRAY TEXT(SD2_at_AutoActions;0)
	//ARRAY TEXT(SD2_at_AutoResultCodes;0)
	//ARRAY TEXT(SD2_at_AutoResultNames;0)
	//ARRAY TEXT(SD2_at_AutoResults;0)
	//ARRAY TEXT(SD2_at_DayNames;0)
	//ARRAY TEXT(SD2_at_DayNames2;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	//ARRAY TEXT(SD2_at_DiaryTypes;0)
	//ARRAY TEXT(SD2_at_EntryForms;0)
	//ARRAY TEXT(SD2_at_EventNames;0)
	//ARRAY TEXT(SD2_at_FieldName;0)
	//ARRAY TEXT(SD2_at_JSTypeCodes;0)
	//ARRAY TEXT(SD2_at_JSTypes;0)
	//ARRAY TEXT(SD2_At_MaxRecordsasString;0)
	//ARRAY TEXT(SD2_at_RecordCode;0)
	//ARRAY TEXT(SD2_at_RelationRest;0)
	//ARRAY TEXT(SD2_at_RelationsName;0)
	//ARRAY TEXT(SD2_At_RelationsUUID;0)
	//ARRAY TEXT(SD2_at_RelationTablesS;0)
	//ARRAY TEXT(SD2_at_RelationType;0)
	//ARRAY TEXT(SD2_at_RelationTypes;0)
	//ARRAY TEXT(SD2_at_RelationTypesS;0)
	//ARRAY TEXT(SD2_at_ResultCodes;0)
	//ARRAY TEXT(SD2_at_ResultNames;0)
	//ARRAY TEXT(SD2_at_rTableNames;0)
	//ARRAY TEXT(SD2_at_ScriptCodes;0)
	//ARRAY TEXT(SD2_at_ScriptNames;0)
	//ARRAY TEXT(SD2_at_ScriptWhen;0)
	//ARRAY TEXT(SD2_at_SettingsTab;0)
	//ARRAY TEXT(SD2_at_StaticFieldNames;0)
	//ARRAY TEXT(SD2_at_TemplateNames;0)
	//ARRAY TEXT(SD2_at_TimeType;0)
	//ARRAY TEXT(SD2_at_TimeType2;0)
	//ARRAY TEXT(SD2_at_WhoseDiary;0)
	//ARRAY TEXT(SD2_at_WorkflowMacro;0)
	//ARRAY TEXT(SD2_at_WorkflowStatus;0)
	//ARRAY TEXT(SD2_at_WorkflowTable;0)
	C_BOOLEAN:C305($_bo_ShowWorflowStatus; ACT_bo_NotDiaryOwner)
	C_LONGINT:C283($_l_ActionID; $_l_ActionsColour; $_l_ActionsStatusRow; $_l_ActionsTimings; $_l_ActionTypeRow; $_l_AmountofTimeRow; $_l_ArraySize; $_l_CharacterPosition; $_l_ClassIDRow; $_l_DiaryTypeRow; $_l_DoneActionRow)
	C_LONGINT:C283($_l_Element; $_l_EndDayRow; $_l_EndTimeRow; $_l_EntryFormRow; $_l_EventTypeRow; $_l_FieldMacrosRow; $_l_FieldsIndex; $_l_IgnoreScriptsRow; $_l_JobAssRow; $_l_KeyTableRow; $_l_LoadComponents)
	C_LONGINT:C283($_l_LocationFieldRow; $_l_LocationRow; $_l_MacroHandlingRow; $_l_NonWorkingDaysRow; $_l_PersonRow; $_l_PostProcessingRow; $_l_RealFIeldNumberRow; $_l_RecordTimeRow; $_l_RelationsIndex; $_l_RelationTable; $_l_RelationTypeRow)
	C_LONGINT:C283($_l_ReminderRow; $_l_ReminderTimeRow; $_l_ReminderTypeRow; $_l_RestrictionRow; $_l_RestrictTableRow; $_l_ResultCodeRow; $_l_ResultFieldRow; $_l_ResultsFieldRow; $_l_ScriptCodesRow; $_l_ScriptEventRow; $_l_ScriptNamesRow)
	C_LONGINT:C283($_l_StartDayRow; $_l_StartTimeRow; $_l_StaticDataRow; $_l_StaticRecordRow; $_l_StatusColourRow; $_l_StatusRow; $_l_TemplateRow; $_l_ThreadedRow; $_l_ThreadOptionRow; $_l_TimeScriptRow; $_l_TimeTypeRow)
	C_LONGINT:C283($_l_TimeUnitsRow; $_l_TimingRow; $_l_TImingTypeRow; $_l_TypeCodeRow; $_l_UnitsValueRow; $_l_UseJobStageRow; $_l_WHoseDiaryRow; $_l_WorkflowScriptRow; $_l_WPActionRow; CB_l_ExcludeNonWorking; CB_l_FieldLevelMacros)
	C_LONGINT:C283(CB_l_GetTimeValues; CB_l_IgnoreStdMacros; CB_l_RecordTime; CB_l_SetReminder; CB_l_WPDescription; SD_l_DayEnd; SD_l_DayStart; SD2_l_ActionCLassID; SD2_l_ActionStatusList; SD2_l_ActionTypeID; SD2_l_autoActionCode)
	C_LONGINT:C283(SD2_l_BUT1; SD2_l_But2; SD2_l_BUT3; SD2_l_BUT4; SD2_l_BUT5; SD2_l_BUT6; SD2_l_BUT7; SD2_l_BUT8; SD2_l_BUT9; SD2_l_CBPostAction; SD2_l_CBThreaded)
	C_LONGINT:C283(SD2_l_ReminderTime; SD2_l_TimeAmount; sRB_l_Diary; sRB_l_Original)
	C_POINTER:C301($_ptr_Field)
	C_REAL:C285(SD2_R_TimeUnits; SD2_R_TimeValue)
	C_TEXT:C284($_t_ActionLocations; $_t_JSCode; $_t_oldMethodName; $_t_TableName; $_t_ThisLocation; $_t_TimeType; SD_t_ViewActionClassNM; SD2_ActionSettingsLabel; SD2_ast_COL1; SD2_ast_COL2; SD2_ast_COL3)
	C_TEXT:C284(SD2_ast_COL4; SD2_ast_COL5; SD2_ast_COL6; SD2_ast_COL7; SD2_ast_COL8; SD2_ast_COL9; SD2_ast_HED1; SD2_ast_HED2; SD2_ast_HED3; SD2_ast_HED4; SD2_ast_HED5)
	C_TEXT:C284(SD2_ast_HED6; SD2_ast_HED7; SD2_ast_HED8; SD2_ast_HED9; SD2_t_ActioncodeLabel; SD2_T_ActionNameLabel; SD2_t_ActionTypeLabel; SD2_t_AutoAction; SD2_t_AutoResult; SD2_T_DayEnd; SD2_t_DayStart)
	C_TEXT:C284(SD2_t_EntryForm; SD2_t_JSType; SD2_t_JSTypeNAME; SD2_t_TemplateActionName; SD2_t_TemplateLabel; SD2_t_TUMacroCode; SD2_t_TUScriptName)
	C_TIME:C306(SD2_ti_TimeEnd; SD2_ti_TimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_ActionAttributestoScreen")
//This piece of code takes the attributes arrays and puts them on screen
SD2_t_ActioncodeLabel:=Get localized string:C991("ActionsFieldNames_ActionCode")
SD2_T_ActionNameLabel:=Get localized string:C991("ActionsFieldNames_ActionName")
SD2_t_ActionTypeLabel:=Get localized string:C991("ActionsFieldNames_ActionType")
If (Position:C15(";"; SD2_t_ActionTypeLabel)=0)
	SD2_t_ActionTypeLabel:=SD2_t_ActionTypeLabel+" :"
End if 
SD2_t_TemplateLabel:=Get localized string:C991("ActionsFieldNames_ActionClass")
SD2_ActionSettingsLabel:=Get localized string:C991("ActionsFieldNames_ActionSettings")
ARRAY TEXT:C222(SD2_at_SettingsTab; 4)
SD2_at_SettingsTab{1}:=Get localized string:C991("ActionsFieldNames_WhenWhere")
SD2_at_SettingsTab{2}:=Get localized string:C991("ActionsFieldNames_FieldValues")
SD2_at_SettingsTab{3}:=Get localized string:C991("ActionsFieldNames_DataHandling")
SD2_at_SettingsTab{4}:=Get localized string:C991("ActionsFieldNames_ActionManagement")

ARRAY LONGINT:C221(SD2_al_RelationType; 2)
ARRAY TEXT:C222(SD2_at_RelationTypes; 2)
SD2_al_RelationType{1}:=1
SD2_al_RelationType{2}:=2
SD2_at_RelationTypes{1}:="Mandatory"
SD2_at_RelationTypes{2}:="Resticted Maximum"



// make sure the action types are loaded
ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)  //selected Diary locations
ARRAY TEXT:C222(SD2_at_DiaryLocations; 0)
ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; Size of array:C274(SD2_al_DiaryLocations))

//Make sure the list of TEMPLATE actions was loaded before display the action of list of actions!
ARRAY TEXT:C222(SD2_at_TimeType; 3)
SD2_at_TimeType{1}:="Mins"
SD2_at_TimeType{2}:="Hrs"
SD2_at_TimeType{3}:="Days"
ARRAY TEXT:C222(SD2_at_DayNames; 7)
ARRAY TEXT:C222(SD2_at_DayNames2; 7)


SD2_at_DayNames{1}:="Sunday"
SD2_at_DayNames{2}:="Monday"
SD2_at_DayNames{3}:="Tuesday"
SD2_at_DayNames{4}:="Wednesday"
SD2_at_DayNames{5}:="Thursday"
SD2_at_DayNames{6}:="Friday"
SD2_at_DayNames{7}:="Saturday"
COPY ARRAY:C226(SD2_at_DayNames; SD2_at_DayNames2)
ARRAY TEXT:C222(SD2_at_TimeType2; 3)
SD2_at_TimeType2{1}:="Mins"
SD2_at_TimeType2{2}:="Hrs"
SD2_at_TimeType2{3}:="Days"
ARRAY LONGINT:C221(SD2_al_WhoseDiary; 0)
ARRAY TEXT:C222(SD2_at_WhoseDiary; 0)

ARRAY LONGINT:C221(SD2_al_FieldNum; 0)
ARRAY TEXT:C222(SD2_at_FieldName; 0)
ARRAY TEXT:C222(SD2_at_RecordCode; 0)
ARRAY TEXT:C222(SD2_at_StaticFieldNames; 15)
ARRAY LONGINT:C221(SD2_al_StaticFieldNUMs; 15)
SD2_al_StaticFieldNUMs{1}:=Field:C253(->[DIARY:12]Company_Code:1)
SD2_al_StaticFieldNUMs{2}:=Field:C253(->[DIARY:12]Contact_Code:2)
$_l_Element:=2

$_l_LoadComponents:=DB_GetModuleSettingByNUM(Module_SalesOrders)  //Sales Orders"
If ($_l_LoadComponents>1)
	$_l_Element:=$_l_Element+1
	SD2_al_StaticFieldNUMs{$_l_Element}:=Field:C253(->[DIARY:12]Order_Code:26)
End if 
$_l_LoadComponents:=(DB_GetModuleSettingByNUM(Module_Products))  //Products"
If ($_l_LoadComponents>1)
	$_l_Element:=$_l_Element+1
	SD2_al_StaticFieldNUMs{$_l_Element}:=Field:C253(->[DIARY:12]Product_Code:13)
End if 
$_l_LoadComponents:=(DB_GetModuleSettingByNUM(Module_ServiceCentre))  //Contracts/Service Calls"
If ($_l_LoadComponents>1)
	$_l_Element:=$_l_Element+1
	SD2_al_StaticFieldNUMs{$_l_Element}:=Field:C253(->[DIARY:12]Call_Code:25)
End if 
$_l_LoadComponents:=DB_GetModuleSettingByNUM(Module_JobCosting)  //Jobs????(Jobs and stages"

If ($_l_LoadComponents>1)
	$_l_Element:=$_l_Element+1
	SD2_al_StaticFieldNUMs{$_l_Element}:=Field:C253(->[DIARY:12]Job_Code:19)
End if 

$_l_LoadComponents:=DB_GetModuleSettingByNUM(Module_JobCosting)  //Jobs????(Jobs and stages"

If ($_l_LoadComponents>1)  // | ($Mod2>1)
	$_l_Element:=$_l_Element+1
	SD2_al_StaticFieldNUMs{$_l_Element}:=Field:C253(->[DIARY:12]Stage_Code:21)
End if 

//There needs to be a change to the diary so other stuff can be linked to the diary
//That change has now been done....enabling a number of other tables to link to the diary. via xDiaryRelations
//its not active for users yet
//Accounts
//Transactions
//Trans in
//invoices
//purchase invoices
//order items
//purchase orders
//subsrciptions
//products

//jobs
//job stages
//job personnel
//event

//stock movements
//current stock

ARRAY TEXT:C222(SD2_at_StaticFieldNames; $_l_Element)
ARRAY LONGINT:C221(SD2_al_StaticFieldNUMs; $_l_Element)
For ($_l_FieldsIndex; 1; Size of array:C274(SD2_al_StaticFieldNUMs))
	SD2_at_StaticFieldNames{$_l_FieldsIndex}:=Field name:C257(Field:C253(Table:C252(->[DIARY:12]); SD2_al_StaticFieldNUMs{$_l_FieldsIndex}))
End for 


ARRAY LONGINT:C221(SD2_al_rTableNUMs; 0)
ARRAY TEXT:C222(SD2_at_rTableNames; 0)
ARRAY TEXT:C222(SD2_at_ScriptCodes; 0)
ARRAY TEXT:C222(SD2_at_ScriptNames; 0)
ARRAY LONGINT:C221(SD2_al_mWhen; 0)
ARRAY TEXT:C222(SD2_at_ScriptWhen; 0)
ARRAY LONGINT:C221(SD2_al_mIgnore; 0)  // ignore std macros
//`````
//1=on saving new
//2=on saving existing
//3=on opening
//4=on Setting a result code
//5=on setting to Done
ARRAY TEXT:C222(SD2_at_EventNames; 5)
ARRAY LONGINT:C221(SD2_al_EventIDs; 5)
SD2_al_EventIDs{1}:=1
SD2_at_EventNames{1}:="on saving new"
SD2_al_EventIDs{2}:=2
SD2_at_EventNames{2}:="on saving existing"
SD2_al_EventIDs{3}:=3
SD2_at_EventNames{3}:="on opening"
SD2_al_EventIDs{4}:=4
SD2_at_EventNames{4}:="on Setting a result code"
ARRAY TEXT:C222(SD2_at_ResultCodes; 0)
ARRAY TEXT:C222(SD2_at_ResultNames; 0)
ARRAY TEXT:C222(SD2_at_AutoActions; 5)
ARRAY LONGINT:C221(SD2_al_AutoActionCodes; 5)
SD2_at_AutoActions{1}:="No automatic action"
SD2_at_AutoActions{2}:="Nag user"
SD2_at_AutoActions{3}:="Put in to-do list"
SD2_at_AutoActions{4}:="Auto complete"
SD2_at_AutoActions{5}:="Force user to complete"
SD2_al_AutoActionCodes{1}:=0
SD2_al_AutoActionCodes{2}:=1
SD2_al_AutoActionCodes{3}:=2
SD2_al_AutoActionCodes{4}:=3
SD2_al_AutoActionCodes{5}:=4
ARRAY TEXT:C222(SD2_at_AutoResults; 0)
//This is either all results OR the list of restricted results
ARRAY TEXT:C222(SD2_at_EntryForms; 0)

//Now deal with the virtual fields
$_l_ArraySize:=0

ARRAY LONGINT:C221(SD2_al_RelationTypesS; $_l_ArraySize)
ARRAY TEXT:C222(SD2_at_RelationTypesS; $_l_ArraySize)
ARRAY LONGINT:C221(SD2_al_RelationTablesS; $_l_ArraySize)
ARRAY TEXT:C222(SD2_at_RelationTablesS; $_l_ArraySize)
ARRAY LONGINT:C221(SD2_al_RelationRestS; $_l_ArraySize)
ARRAY TEXT:C222(SD2_at_RelationRest; $_l_ArraySize)
If ([ACTIONS:13]xID:12#0)
	QUERY:C277([ACTIONS_RELATIONRESTRICTIONS:205]; [ACTIONS_RELATIONRESTRICTIONS:205]ActionID:2=[ACTIONS:13]xID:12)
Else 
	REDUCE SELECTION:C351([ACTIONS_RELATIONRESTRICTIONS:205]; 0)
End if 
SELECTION TO ARRAY:C260([ACTIONS_RELATIONRESTRICTIONS:205]UUID:1; SD2_At_RelationsUUID; [ACTIONS_RELATIONRESTRICTIONS:205]RelationMandatory:7; SD2_abo_RelationMandatory; [ACTIONS_RELATIONRESTRICTIONS:205]RelationMaxRecords:5; SD2_al_RelationsMax; *)
SELECTION TO ARRAY:C260([ACTIONS_RELATIONRESTRICTIONS:205]RelationMinRecords:6; SD2_AL_RelationsMIN; [ACTIONS_RELATIONRESTRICTIONS:205]RelationTable:3; SD2_al_RelationsTableNUM; [ACTIONS_RELATIONRESTRICTIONS:205]RelationName:4; SD2_at_RelationsName)
$_l_ArraySize:=Size of array:C274(SD2_At_RelationsUUID)
ARRAY TEXT:C222(SD2_at_RelationTablesS; $_l_ArraySize)
ARRAY BOOLEAN:C223(SD2_abo_RelationsModified; $_l_ArraySize)
ARRAY TEXT:C222(SD2_At_MaxRecordsasString; $_l_ArraySize)
ARRAY TEXT:C222(SD2_at_RelationType; $_l_ArraySize)
For ($_l_FieldsIndex; 1; Size of array:C274(SD2_At_RelationsUUID))
	If (SD2_abo_RelationMandatory{$_l_FieldsIndex})
		SD2_at_RelationType{$_l_FieldsIndex}:="Mandatory"
		If (SD2_al_RelationsMax{$_l_FieldsIndex}>0)
			SD2_at_RelationType{$_l_FieldsIndex}:=SD2_at_RelationType{$_l_FieldsIndex}+", limited Maximum"
		End if 
	Else 
		If (SD2_al_RelationsMax{$_l_FieldsIndex}>0)
			SD2_at_RelationType{$_l_FieldsIndex}:="Limited Maximum"
		Else 
			If (SD2_al_RelationsMin{$_l_FieldsIndex}=0)
				SD2_at_RelationType{$_l_FieldsIndex}:="No Records"
			End if 
		End if 
	End if 
	SD2_At_MaxRecordsasString{$_l_FieldsIndex}:=String:C10(SD2_al_RelationsMax{$_l_FieldsIndex})
	
	SD2_al_RelationTablesS{$_l_RelationsIndex}:=SD2_al_ActionVirtFieldDataMANY{$_l_FieldsIndex}{$_l_RelationsIndex}
	If (SD2_al_RelationsTableNUM{$_l_FieldsIndex}>0)
		If (Is table number valid:C999(SD2_al_RelationsTableNUM{$_l_FieldsIndex}))
			SD2_at_RelationTablesS{$_l_FieldsIndex}:=Table name:C256(SD2_al_RelationsTableNUM{$_l_FieldsIndex})
		Else 
			SD2_at_RelationTablesS{$_l_FieldsIndex}:="Unknown"
		End if 
	Else 
		SD2_at_RelationTablesS{$_l_FieldsIndex}:="Unknown"
	End if 
	
End for 


If (True:C214)
	$_l_RelationTypeRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Relation Type")
	If ($_l_RelationTypeRow>0)  //It should be
		//there is 2D array of the relation Types
		$_l_RelationTable:=Find in array:C230(SD2_at_ActionVirtFieldName; "Relation Table")
		If ($_l_RelationTable>0)
			$_l_RestrictionRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Relation Restriction")
			If ($_l_RestrictionRow>0)
				$_l_ArraySize:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_RelationTypeRow})
				ARRAY LONGINT:C221(SD2_al_RelationTypesS; $_l_ArraySize)
				ARRAY TEXT:C222(SD2_at_RelationTypesS; $_l_ArraySize)
				ARRAY LONGINT:C221(SD2_al_RelationTablesS; $_l_ArraySize)
				ARRAY TEXT:C222(SD2_at_RelationTablesS; $_l_ArraySize)
				ARRAY LONGINT:C221(SD2_al_RelationRestS; $_l_ArraySize)
				ARRAY TEXT:C222(SD2_at_RelationRest; $_l_ArraySize)
				For ($_l_RelationsIndex; 1; $_l_ArraySize)
					SD2_al_RelationTypesS{$_l_RelationsIndex}:=SD2_al_ActionVirtFieldDataMANY{$_l_RelationTypeRow}{$_l_RelationsIndex}
					If (SD2_al_RelationTypesS{$_l_RelationsIndex}>0)
						$_l_RelationTypeRow:=Find in array:C230(SD2_al_RelationType; SD2_al_RelationTypesS{$_l_RelationsIndex})
						If ($_l_RelationTypeRow>0)
							SD2_at_RelationTypesS{$_l_RelationTypeRow}:=SD2_at_RelationTypes{$_l_RelationTypeRow}
						Else 
							SD2_at_RelationTypesS{$_l_RelationTypeRow}:="Unknown"
						End if 
					End if 
					
					SD2_al_RelationTablesS{$_l_RelationsIndex}:=SD2_al_ActionVirtFieldDataMANY{$_l_RelationTable}{$_l_RelationsIndex}
					If (SD2_al_RelationTablesS{$_l_RelationsIndex}>0)
						If (Is table number valid:C999(SD2_al_RelationTablesS{$_l_RelationsIndex}))
							SD2_at_RelationTablesS{$_l_RelationsIndex}:=Table name:C256(SD2_al_RelationTablesS{$_l_RelationsIndex})
						Else 
							SD2_at_RelationTablesS{$_l_RelationsIndex}:="Unknown"
						End if 
						
					Else 
						SD2_at_RelationTablesS{$_l_RelationsIndex}:="Unknown"
					End if 
					SD2_al_RelationRestS{$_l_RelationsIndex}:=SD2_al_ActionVirtFieldDataMANY{$_l_RestrictionRow}{$_l_RelationsIndex}
					If (SD2_al_RelationRestS{$_l_RelationsIndex}>0)
						SD2_at_RelationRest{$_l_RelationsIndex}:=String:C10(SD2_al_RelationRestS{$_l_RelationsIndex})
					Else 
						SD2_at_RelationRest{$_l_RelationsIndex}:="Unlimited"
					End if 
				End for 
			Else 
			End if 
			
		Else 
		End if 
	End if 
End if   //``
$_l_ArraySize:=0
If (True:C214)
	ARRAY LONGINT:C221(SD2_al_WorkflowTable; $_l_ArraySize)
	ARRAY TEXT:C222(SD2_at_WorkflowTable; $_l_ArraySize)
	ARRAY TEXT:C222(SD2_at_WorkflowMacro; $_l_ArraySize)
	$_l_KeyTableRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Workflow Table")
	If ($_l_KeyTableRow>0)  //It should be
		//there is 2D array of the workflow tables
		
		$_l_WorkflowScriptRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Workflow Macro")
		If ($_l_WorkflowScriptRow>0)  // it should be
			$_l_ArraySize:=Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_KeyTableRow})
			ARRAY LONGINT:C221(SD2_al_WorkflowTable; $_l_ArraySize)
			ARRAY TEXT:C222(SD2_at_WorkflowTable; $_l_ArraySize)
			ARRAY TEXT:C222(SD2_at_WorkflowMacro; $_l_ArraySize)
			For ($_l_RelationsIndex; 1; $_l_ArraySize)
				SD2_al_WorkflowTable{$_l_RelationsIndex}:=SD2_al_ActionVirtFieldDataMANY{$_l_KeyTableRow}{$_l_RelationsIndex}
				If (SD2_al_WorkflowTable{$_l_RelationsIndex}>0)
					If (Is table number valid:C999(SD2_al_WorkflowTable{$_l_RelationsIndex}))
						$_t_TableName:=Table name:C256(SD2_al_WorkflowTable{$_l_RelationsIndex})
						SD2_at_WorkflowTable{$_l_RelationsIndex}:=$_t_TableName
						If ($_l_RelationsIndex>=Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_WorkflowScriptRow}))
							SD2_at_WorkflowMacro{$_l_RelationsIndex}:=SD2_at_ActionVirtFieldDataMA{$_l_WorkflowScriptRow}{$_l_RelationsIndex}
						Else 
							SD2_at_WorkflowMacro{$_l_RelationsIndex}:=""
						End if 
					Else 
						SD2_at_WorkflowTable{$_l_RelationsIndex}:="Unknown"
					End if 
				End if 
			End for 
			
			
		Else 
		End if 
	End if 
	//``
End if 

//SD2_l_ActionTypeID:=SD2_al_ActionVirtFieldDataLong{$_l_ActionsStatusRow}
//And look up the string
SD_t_ViewActionClassNM:=""
If ([ACTIONS:13]xActionTypeID:10>0)
	$_l_ActionTypeRow:=Find in array:C230(SD2_al_DiaryTypeIDS; [ACTIONS:13]xActionTypeID:10)
	If ($_l_ActionTypeRow>0)
		SD_t_ViewActionClassNM:=SD2_at_DiaryTypes{$_l_ActionTypeRow}
	End if 
End if 

If (True:C214)
	$_l_ActionTypeRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Type ID")
	If ($_l_ActionTypeRow>0)  //It should be
		SD2_l_ActionTypeID:=SD2_al_ActionVirtFieldDataLong{$_l_ActionTypeRow}
		//And look up the string
		
		$_l_DiaryTypeRow:=Find in array:C230(SD2_al_DiaryTypeIDS; SD2_l_ActionTypeID)
		If ($_l_DiaryTypeRow>0)
			SD_t_ViewActionClassNM:=SD2_at_DiaryTypes{$_l_DiaryTypeRow}
		Else 
			SD2_l_ActionTypeID:=0
			SD_t_ViewActionClassNM:=""
		End if 
	Else 
		SD2_l_ActionTypeID:=0
		SD_t_ViewActionClassNM:=""
	End if 
End if 
//the above then goes into  [DIARY]xDiaryClass
//seperately we need to store the locations-the class affects how it is handled not where it appears.

If ([ACTIONS:13]xLocations:13#"")
	$_t_ActionLocations:=[ACTIONS:13]xLocations:13
	Repeat 
		$_l_CharacterPosition:=Position:C15(","; $_t_ActionLocations)
		$_t_ThisLocation:=""
		If ($_l_CharacterPosition>0)
			$_t_ThisLocation:=Substring:C12($_t_ActionLocations; 1; $_l_CharacterPosition-1)
			$_t_ActionLocations:=Substring:C12($_t_ActionLocations; $_l_CharacterPosition+1)
		Else 
			$_t_ThisLocation:=$_t_ActionLocations
			$_t_ActionLocations:=""
		End if 
		If ($_t_ThisLocation#"")
			$_l_LocationFieldRow:=Find in array:C230(SD2_at_DiaryLocations; $_t_ThisLocation)
			If ($_l_LocationFieldRow>0)
				SD2_aI_DiaryLocationsSEL{$_l_LocationFieldRow}:=1
			End if 
		End if 
	Until ($_t_ActionLocations="")
	
End if 

If (True:C214)
	
	$_l_LocationFieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
	
	If ($_l_LocationFieldRow>0)
		For ($_l_FieldsIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_LocationFieldRow}))
			$_l_LocationRow:=Find in array:C230(SD2_al_DiaryLocations; SD2_al_ActionVirtFieldDataMANY{$_l_LocationFieldRow}{$_l_FieldsIndex})
			If ($_l_LocationRow>0)  //it should be
				SD2_aI_DiaryLocationsSEL{$_l_LocationRow}:=1
			End if 
			
		End for 
		
	Else 
		
	End if 
End if 

ARRAY TEXT:C222(SD2_at_WorkflowStatus; 0)
ARRAY LONGINT:C221(SD2_al_WorkflowStatus; 0)
SD2_l_ActionStatusList:=AA_LoadListByName("Action Status"; ->SD2_at_WorkflowStatus; ->SD2_al_WorkflowStatus)
$_bo_ShowWorflowStatus:=False:C215
$_l_LocationRow:=Find in array:C230(SD2_at_DiaryLocations; "Workflow")
ARRAY LONGINT:C221(SD2_al_ActionDIsplayStatusID; 0)
ARRAY TEXT:C222(SD2_at_ActionDisplayName; 0)
ARRAY LONGINT:C221(SD2_al_ActionDisplayColour; 0)
ARRAY PICTURE:C279(SD2_apic_ActionDisplayPictures; 0)
ARRAY LONGINT:C221(SD2_al_ActionDisplaytime; 0)
ARRAY LONGINT:C221(SD2_al_ActionDisplayTimeType; 0)
ARRAY TEXT:C222(SD2_at_ActionDisplayTiming; 0)
//```

LB_SetupListbox(->SD2_lb_ActionStatus; "SD2_ast"; "SD2_L"; 1; ->SD2_at_ActionDisplayName; ->SD2_apic_ActionDisplayPictures; ->SD2_at_ActionDisplayTiming; ->SD2_al_ActionDIsplayStatusID; ->SD2_al_ActionDisplayColour; ->SD2_al_ActionDisplaytime; ->SD2_al_ActionDisplayTimeType)


LB_SetColumnHeaders(->SD2_lb_ActionStatus; "SD2_L"; 1; "Status"; "Color"; "Timing"; "Status ID"; "Colour Number"; "Time"; "Time Type")


LB_SetColumnWidths(->SD2_lb_ActionStatus; "SD2_ast"; 1; 92; 18; 188; 0; 0; 0; 0)

LB_SetEnterable(->SD2_lb_ActionStatus; False:C215; 0)
LB_SetScroll(->SD2_lb_ActionStatus; -3; -2)

LB_StyleSettings(->SD2_lb_ActionStatus; "Black"; 9; "SD2_ast"; ->[DIARY:12])


//``
If ($_l_LocationRow>0)
	If (SD2_aI_DiaryLocationsSEL{$_l_LocationRow}=1)
		$_bo_ShowWorflowStatus:=True:C214
		
	End if 
End if 
If (Not:C34($_bo_ShowWorflowStatus))
	OBJECT SET VISIBLE:C603(SD2_lb_ActionStatus; False:C215)
Else 
	OBJECT SET VISIBLE:C603(SD2_lb_ActionStatus; True:C214)
End if 
$_l_ActionsStatusRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Status")
$_l_StatusColourRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Status Colour")
$_l_TimingRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Status Timing")
$_l_TImingTypeRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Status Timing Type")
If ($_l_ActionsStatusRow>0) & ($_l_StatusColourRow>0) & ($_l_TimingRow>0) & ($_l_TImingTypeRow>0)
	//We have action Status for this action
	For ($_l_FieldsIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ActionsStatusRow}))
		$_l_ActionID:=SD2_al_ActionVirtFieldDataMANY{$_l_ActionsStatusRow}{$_l_FieldsIndex}
		$_l_ActionsColour:=SD2_al_ActionVirtFieldDataMANY{$_l_StatusColourRow}{$_l_FieldsIndex}
		$_l_ActionsTimings:=SD2_al_ActionVirtFieldDataMANY{$_l_TimingRow}{$_l_FieldsIndex}
		$_l_StatusRow:=Find in array:C230(SD2_al_WorkflowStatus; $_l_ActionID)
		If ($_l_StatusRow>0)
			APPEND TO ARRAY:C911(SD2_al_ActionDIsplayStatusID; $_l_ActionID)
			APPEND TO ARRAY:C911(SD2_at_ActionDisplayName; SD2_at_WorkflowStatus{$_l_StatusRow})
			APPEND TO ARRAY:C911(SD2_al_ActionDisplayColour; $_l_ActionsColour)
			APPEND TO ARRAY:C911(SD2_apic_ActionDisplayPictures; SD2_PicMakeSVGcircle($_l_ActionsColour; 18; 12))
			APPEND TO ARRAY:C911(SD2_al_ActionDisplaytime; $_l_ActionsTimings)
			APPEND TO ARRAY:C911(SD2_al_ActionDisplayTimeType; SD2_al_ActionVirtFieldDataLong{$_l_TImingTypeRow})
			
			
			Case of 
				: (SD2_al_ActionVirtFieldDataLong{$_l_TImingTypeRow}=2)
					$_t_TimeType:=SD2_at_TimeType{3}
				: (SD2_al_ActionVirtFieldDataLong{$_l_TImingTypeRow}=1)
					$_t_TimeType:=SD2_at_TimeType{2}
				Else 
					$_t_TimeType:=SD2_at_TimeType{1}
			End case 
			
			
			If ($_l_ActionsTimings<0)
				APPEND TO ARRAY:C911(SD2_at_ActionDisplayTiming; String:C10(Abs:C99($_l_ActionsTimings))+" "+$_t_TimeType+" "+"after due(start) time")
			Else 
				APPEND TO ARRAY:C911(SD2_at_ActionDisplayTiming; String:C10($_l_ActionsTimings)+" "+$_t_TimeType+" "+"before due(start) time")
			End if 
			
		End if 
	End for 
End if 




$_l_DoneActionRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Done Action")

If ($_l_DoneActionRow>0)
	SD2_l_CBPostAction:=SD2_al_ActionVirtFieldDataLong{$_l_DoneActionRow}
Else 
	SD2_l_CBPostAction:=0
End if 
If (True:C214)
	
	$_l_ThreadedRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded")
	If ($_l_ThreadedRow>0)
		SD2_l_CBThreaded:=SD2_al_ActionVirtFieldDataLong{$_l_ThreadedRow}
	Else 
		SD2_l_CBThreaded:=0
	End if 
	If (SD2_l_CBThreaded=1)
		$_l_ThreadOptionRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Threaded View Option")
		If ($_l_ThreadOptionRow>0)
			sRB_l_Original:=SD2_al_ActionVirtFieldDataLong{$_l_ThreadOptionRow}
			sRB_l_Diary:=Num:C11(sRB_l_Original=0)
		Else 
			//Default
			sRB_l_Original:=0
			sRB_l_Diary:=1
		End if 
		
	Else 
		sRB_l_Original:=0
		sRB_l_Diary:=0
		OBJECT SET ENTERABLE:C238(sRB_l_Original; False:C215)
		OBJECT SET ENTERABLE:C238(sRB_l_Diary; False:C215)
	End if 
End if 
If (True:C214)
	$_l_ClassIDRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Class ID")
	If ($_l_ClassIDRow>0)
		SD2_l_ActionCLassID:=SD2_al_ActionVirtFieldDataLong{$_l_ClassIDRow}
		$_l_TemplateRow:=Find in array:C230(SD2_al_TemplateIDS; SD2_l_ActionCLassID)
		If ($_l_TemplateRow>0)
			SD2_t_TemplateActionName:=SD2_at_TemplateNames{$_l_TemplateRow}
		Else 
			SD2_l_ActionCLassID:=0
			SD2_t_TemplateActionName:=""
		End if 
		
	Else 
		SD2_l_ActionCLassID:=0
		SD2_t_TemplateActionName:=""
	End if 
End if 
If (True:C214)
	$_l_AmountofTimeRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Amount of Time")
	If ($_l_AmountofTimeRow>0)
		SD2_l_TimeAmount:=SD2_al_ActionVirtFieldDataLong{$_l_AmountofTimeRow}
		$_l_TimeTypeRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Amount of Time Type")
		If ($_l_TimeTypeRow>0)
			Case of 
				: (SD2_al_ActionVirtFieldDataLong{$_l_TimeTypeRow}=2)
					SD2_at_TimeType:=3
				: (SD2_al_ActionVirtFieldDataLong{$_l_TimeTypeRow}=1)
					SD2_at_TimeType:=2
				Else 
					SD2_at_TimeType:=1
			End case 
			
		End if 
		
	Else 
		SD2_l_TimeAmount:=0
		SD2_at_TimeType:=0
	End if 
End if 
If (True:C214)
	$_l_StartTimeRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Start Time")
	If ($_l_StartTimeRow>0)
		SD2_ti_TimeStart:=Time:C179(Time string:C180(SD2_al_ActionVirtFieldDataLong{$_l_StartTimeRow}))
	Else 
		SD2_ti_TimeStart:=?00:00:00?
	End if 
	$_l_EndTimeRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "End Time")
	If ($_l_EndTimeRow>0)
		SD2_ti_TimeEnd:=Time:C179(Time string:C180(SD2_al_ActionVirtFieldDataLong{$_l_EndTimeRow}))
	Else 
		SD2_ti_TimeEnd:=?00:00:00?
	End if 
	$_l_StartDayRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Start Day")
	If ($_l_StartDayRow>0)
		SD_l_DayStart:=SD2_al_ActionVirtFieldDataLong{$_l_StartDayRow}
		SD2_t_DayStart:=SD2_at_DayNames{SD2_al_ActionVirtFieldDataLong{$_l_StartDayRow}}
	End if 
	$_l_EndDayRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "End Day")
	If ($_l_EndDayRow>0)
		SD_l_DayEnd:=SD2_al_ActionVirtFieldDataLong{$_l_EndDayRow}
		SD2_T_DayEnd:=SD2_at_DayNames{SD2_al_ActionVirtFieldDataLong{$_l_EndDayRow}}
	End if 
	$_l_ReminderRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Reminder")
	If ($_l_ReminderRow>0)
		CB_l_SetReminder:=SD2_al_ActionVirtFieldDataLong{$_l_ReminderRow}
	Else 
		CB_l_SetReminder:=0
	End if 
	If (CB_l_SetReminder=1)
		$_l_ReminderTimeRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Reminder TIme")
		If ($_l_ReminderTimeRow>0)
			SD2_l_ReminderTime:=SD2_al_ActionVirtFieldDataLong{$_l_ReminderTimeRow}
			$_l_ReminderTypeRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Reminder TIme Type")
			If ($_l_ReminderTypeRow>0)
				Case of 
					: (SD2_al_ActionVirtFieldDataLong{$_l_ReminderTypeRow}=2)
						SD2_at_TimeType2:=3
					: (SD2_al_ActionVirtFieldDataLong{$_l_ReminderTypeRow}=1)
						SD2_at_TimeType2:=2
					Else 
						SD2_at_TimeType2:=1
				End case 
				
			End if 
			
		Else 
			SD2_l_ReminderTime:=0
			SD2_at_TimeType2:=0
		End if 
	Else 
		OBJECT SET ENTERABLE:C238(SD2_l_ReminderTime; False:C215)
		OBJECT SET ENTERABLE:C238(SD2_at_TimeType2; False:C215)
		SD2_l_ReminderTime:=0
		SD2_at_TimeType2:=0
	End if 
End if 
If (True:C214)
	$_l_NonWorkingDaysRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Exclude NON working Days")
	If ($_l_NonWorkingDaysRow>0)
		CB_l_ExcludeNonWorking:=SD2_al_ActionVirtFieldDataLong{$_l_NonWorkingDaysRow}
	Else 
		CB_l_ExcludeNonWorking:=0
	End if 
	$_l_WHoseDiaryRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Whose Diaries")
	If ($_l_WHoseDiaryRow>0)
		ARRAY LONGINT:C221(SD2_al_WhoseDiary; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_WHoseDiaryRow}))
		ARRAY TEXT:C222(SD2_at_WhoseDiary; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_WHoseDiaryRow}))
		For ($_l_FieldsIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_WHoseDiaryRow}))
			SD2_al_WhoseDiary{$_l_FieldsIndex}:=SD2_al_ActionVirtFieldDataMANY{$_l_WHoseDiaryRow}{$_l_FieldsIndex}
			$_l_PersonRow:=Find in array:C230(SD_al_ActionAddPersonelID; SD2_al_WhoseDiary{$_l_FieldsIndex})
			If ($_l_PersonRow>0)
				SD2_at_WhoseDiary{$_l_FieldsIndex}:=SD_at_actionAdd{$_l_PersonRow}
			Else 
				SD2_at_WhoseDiary{$_l_FieldsIndex}:="???"
			End if 
			
		End for 
	End if 
End if 
$_l_WPActionRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Use WP for action Description")
If ($_l_WPActionRow>0)
	CB_l_WPDescription:=SD2_al_ActionVirtFieldDataLong{$_l_WPActionRow}
Else 
	CB_l_WPDescription:=0
End if 
If (True:C214)
	
	$_l_StaticDataRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Static Record Fields")
	$_l_StaticRecordRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Static Record Codes")
	If ($_l_StaticDataRow>0)
		ARRAY LONGINT:C221(SD2_al_FieldNum; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_StaticDataRow}))
		ARRAY TEXT:C222(SD2_at_FieldName; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_StaticDataRow}))
		ARRAY TEXT:C222(SD2_at_RecordCode; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_StaticDataRow}))
		For ($_l_FieldsIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_StaticDataRow}))
			SD2_al_FieldNum{$_l_FieldsIndex}:=SD2_al_ActionVirtFieldDataMANY{$_l_StaticDataRow}{$_l_FieldsIndex}
			SD2_at_FieldName{$_l_FieldsIndex}:=Field name:C257(Table:C252(->[DIARY:12]); SD2_al_FieldNum{$_l_FieldsIndex})
			SD2_at_RecordCode{$_l_FieldsIndex}:=SD2_at_ActionVirtFieldDataMA{$_l_StaticRecordRow}{$_l_FieldsIndex}
		End for 
		
		
	Else 
		
	End if 
End if 
If (True:C214)
	$_l_TimeUnitsRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Time Units")
	If ($_l_TimeUnitsRow>0)
		SD2_R_TimeUnits:=SD2_ar_ActionVirtFieldDataREAL{$_l_TimeUnitsRow}
	Else 
		SD2_R_TimeUnits:=0
	End if 
	$_l_UnitsValueRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Time Units Value")
	If ($_l_UnitsValueRow>0)
		SD2_R_TimeValue:=SD2_ar_ActionVirtFieldDataREAL{$_l_UnitsValueRow}
	Else 
		SD2_R_TimeValue:=0
	End if 
End if 
If (True:C214)
	$_l_TimeScriptRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Time Units Macro Code")
	If ($_l_TimeScriptRow>0)
		SD2_t_TUMacroCode:=SD2_at_ActionVirtFieldDataTXT{$_l_TimeScriptRow}
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=SD2_at_ActionVirtFieldDataTXT{$_l_TimeScriptRow})
		SD2_t_TUScriptName:=[SCRIPTS:80]Script_Name:2
		UNLOAD RECORD:C212([SCRIPTS:80])
	Else 
		SD2_t_TUMacroCode:=""
		SD2_t_TUScriptName:=""
	End if 
End if 
If (True:C214)
	$_l_UseJobStageRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Use Job Stage Rates")
	If ($_l_UseJobStageRow>0)
		CB_l_GetTimeValues:=SD2_al_ActionVirtFieldDataLong{$_l_UseJobStageRow}
		
	Else 
		CB_l_GetTimeValues:=0
		
	End if 
End if 
$_l_RecordTimeRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Record Time_In Job Stage")
ARRAY TEXT:C222(SD2_at_JSTypeCodes; 0)
ARRAY TEXT:C222(SD2_at_JSTypes; 0)

If ($_l_RecordTimeRow>0)
	CB_l_RecordTime:=SD2_al_ActionVirtFieldDataLong{$_l_RecordTimeRow}
	If (CB_l_RecordTime=1)
		OBJECT SET VISIBLE:C603(*; "oJSTypeLabel"; True:C214)
		OBJECT SET VISIBLE:C603(SD2_t_JSType; True:C214)
		OBJECT SET VISIBLE:C603(SD2_at_JSTypes; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(*; "oJSTypeLabel"; False:C215)
		OBJECT SET VISIBLE:C603(SD2_t_JSType; False:C215)
		OBJECT SET VISIBLE:C603(SD2_at_JSTypes; False:C215)
	End if 
	ALL RECORDS:C47([STAGES:45])
	SELECTION TO ARRAY:C260([STAGES:45]Stage_Code:1; SD2_at_JSTypeCodes; [STAGES:45]Stage_Name:2; SD2_at_JSTypes)
	SORT ARRAY:C229(SD2_at_JSTypes; SD2_at_JSTypeCodes; >)
	$_l_JobAssRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Associated Job Stage Type")
	If ($_l_JobAssRow>0)
		$_t_JSCode:=SD2_at_ActionVirtFieldDataTXT{$_l_JobAssRow}
		$_l_TypeCodeRow:=Find in array:C230(SD2_at_JSTypeCodes; $_t_JSCode)
		If ($_l_TypeCodeRow>0)
			SD2_t_JSTypeNAME:=SD2_at_JSTypes{$_l_TypeCodeRow}
			SD2_t_JSType:=$_t_JSCode  //Code
		Else 
			SD2_t_JSTypeNAME:=""
			SD2_t_JSType:=""  //Code
		End if 
	Else 
		$_t_JSCode:=""
		SD2_t_JSTypeNAME:=""
		SD2_t_JSType:=""  //Code
	End if 
	
	
	
Else 
	CB_l_RecordTime:=0
	OBJECT SET VISIBLE:C603(*; "oJSTypeLabel"; False:C215)
	OBJECT SET VISIBLE:C603(SD2_t_JSTypeNAME; False:C215)
	OBJECT SET VISIBLE:C603(SD2_at_JSTypes; False:C215)
	SD2_t_JSTypeNAME:=""
	SD2_t_JSType:=""  //Code
End if 
If (True:C214)
	$_l_RestrictTableRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Restrict Table")
	If ($_l_RestrictTableRow>0)
		ARRAY LONGINT:C221(SD2_al_rTableNUMs; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_RestrictTableRow}))
		ARRAY TEXT:C222(SD2_at_rTableNames; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_RestrictTableRow}))
		For ($_l_FieldsIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_RestrictTableRow}))
			SD2_al_rTableNUMs{$_l_FieldsIndex}:=SD2_al_ActionVirtFieldDataMANY{$_l_RestrictTableRow}{$_l_FieldsIndex}
			If (SD2_al_rTableNUMs{$_l_FieldsIndex}>0)  //it should be but just in case
				SD2_at_rTableNames{$_l_FieldsIndex}:=Table name:C256(Table:C252(SD2_al_rTableNUMs{$_l_FieldsIndex}))
				
			End if 
			
		End for 
		
	End if 
End if 
If (True:C214)
	$_l_ScriptCodesRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Codes")
	$_l_ScriptNamesRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Names")
	$_l_ScriptEventRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Macro Event")
	$_l_IgnoreScriptsRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Ignore Other Macros")
	If ($_l_ScriptCodesRow>0)
		ARRAY TEXT:C222(SD2_at_ScriptCodes; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ScriptCodesRow}))
		ARRAY TEXT:C222(SD2_at_ScriptNames; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ScriptCodesRow}))
		ARRAY TEXT:C222(SD2_at_ScriptWhen; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ScriptCodesRow}))
		ARRAY LONGINT:C221(SD2_al_mWhen; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ScriptCodesRow}))
		ARRAY LONGINT:C221(SD2_al_mIgnore; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ScriptCodesRow}))  // ignore std macros
		
		For ($_l_FieldsIndex; 1; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ScriptCodesRow}))
			SD2_at_ScriptCodes{$_l_FieldsIndex}:=SD2_at_ActionVirtFieldDataMA{$_l_ScriptCodesRow}{$_l_FieldsIndex}
			SD2_at_ScriptNames{$_l_FieldsIndex}:=SD2_at_ActionVirtFieldDataMA{$_l_ScriptNamesRow}{$_l_FieldsIndex}
			SD2_al_mWhen{$_l_FieldsIndex}:=SD2_al_ActionVirtFieldDataMANY{$_l_ScriptEventRow}{$_l_FieldsIndex}
			SD2_al_mIgnore{$_l_FieldsIndex}:=SD2_al_ActionVirtFieldDataMANY{$_l_IgnoreScriptsRow}{$_l_FieldsIndex}
			$_l_EventTypeRow:=Find in array:C230(SD2_al_EventIDs; SD2_al_mWhen{$_l_FieldsIndex})
			If ($_l_EventTypeRow>0)  //it should b
				SD2_at_ScriptWhen{$_l_FieldsIndex}:=SD2_at_EventNames{$_l_EventTypeRow}
			End if 
			
		End for 
	End if 
End if 
If (True:C214)
	$_l_FieldMacrosRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Level Field Macros")
	If ($_l_FieldMacrosRow>0)
		CB_l_FieldLevelMacros:=SD2_al_ActionVirtFieldDataLong{$_l_FieldMacrosRow}
	End if 
	$_l_MacroHandlingRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Ignore Other Macros")
	If ($_l_MacroHandlingRow>0)
		CB_l_IgnoreStdMacros:=SD2_al_ActionVirtFieldDataLong{$_l_MacroHandlingRow}
	End if 
End if 
If (True:C214)
	$_l_ResultsFieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Result Codes")
	If ($_l_ResultsFieldRow>0)
		ARRAY TEXT:C222(SD2_at_ResultCodes; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ResultsFieldRow}))
		ARRAY TEXT:C222(SD2_at_ResultNames; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ResultsFieldRow}))
		For ($_l_FieldsIndex; 1; Size of array:C274(SD2_at_ActionVirtFieldDataMA{$_l_ResultsFieldRow}))
			SD2_at_ResultCodes{$_l_FieldsIndex}:=SD2_at_ActionVirtFieldDataMA{$_l_ResultsFieldRow}{$_l_FieldsIndex}
			$_l_ResultCodeRow:=Find in array:C230(SD2_at_AllResultCodes; SD2_at_ResultCodes{$_l_FieldsIndex})
			If ($_l_ResultCodeRow>0)
				SD2_at_ResultNames{$_l_FieldsIndex}:=SD2_at_AllresultNames{$_l_ResultCodeRow}
			End if 
		End for 
	End if 
End if 
If (True:C214)
	$_l_PostProcessingRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Post Time processing Action")
	If ($_l_PostProcessingRow>0)
		SD2_t_AutoAction:=SD2_at_AutoActions{SD2_al_ActionVirtFieldDataLong{$_l_PostProcessingRow}}
		SD2_l_autoActionCode:=SD2_al_ActionVirtFieldDataLong{$_l_PostProcessingRow}
		
		
	End if 
	ARRAY TEXT:C222(SD2_at_AutoResultNames; 0)
	ARRAY TEXT:C222(SD2_at_AutoResultCodes; 0)
	If (SD2_t_AutoAction="Auto complete")
		If (Size of array:C274(SD2_at_ResultCodes)=0)
			ARRAY TEXT:C222(SD2_at_AutoResultNames; Size of array:C274(SD2_at_AllResultCodes))
			ARRAY TEXT:C222(SD2_at_AutoResultCodes; Size of array:C274(SD2_at_AllResultCodes))
			For ($_l_FieldsIndex; 1; Size of array:C274(SD2_at_AllResultCodes))
				SD2_at_AutoResultCodes{$_l_FieldsIndex}:=SD2_at_AllResultCodes{$_l_FieldsIndex}
				SD2_at_AutoResultNames{$_l_FieldsIndex}:=SD2_at_AllresultNames{$_l_FieldsIndex}
			End for 
		Else 
			ARRAY TEXT:C222(SD2_at_AutoResultNames; Size of array:C274(SD2_at_ResultCodes))
			ARRAY TEXT:C222(SD2_at_AutoResultCodes; Size of array:C274(SD2_at_ResultCodes))
			
			For ($_l_FieldsIndex; 1; Size of array:C274(SD2_at_AutoResultCodes))
				SD2_at_AutoResultCodes{$_l_FieldsIndex}:=SD2_at_ResultCodes{$_l_FieldsIndex}
				SD2_at_AutoResultNames{$_l_FieldsIndex}:=SD2_at_ResultNames{$_l_FieldsIndex}
			End for 
			
		End if 
		
		$_l_ResultFieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Auto Result Code")
		If ($_l_ResultFieldRow>0)
			SD2_t_AutoResult:=SD2_at_ActionVirtFieldDataTXT{$_l_ResultFieldRow}
			
		End if 
		OBJECT SET VISIBLE:C603(SD2_at_AutoResultNames; True:C214)
		
		OBJECT SET VISIBLE:C603(*; "oAutoresultPopPic"; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(SD2_at_AutoResultNames; False:C215)
		OBJECT SET ENTERABLE:C238(SD2_t_AutoResult; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAutoresultPopPic"; False:C215)
	End if 
End if 
If (True:C214)
	$_l_EntryFormRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
	If ($_l_EntryFormRow>0)
		SD2_t_EntryForm:=SD2_at_ActionVirtFieldDataTXT{$_l_EntryFormRow}
	End if 
End if 
ERR_MethodTrackerReturn("SD2_ActionAttributestoScreen"; $_t_oldMethodName)
