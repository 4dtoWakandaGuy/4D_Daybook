//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_ArraysSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/11/2009 11:44`Method: EW_ArraysSetup
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(EW_ai_StepDetailOrder;0)
	//ARRAY LONGINT(EW_al_BKFieldLength;0)
	//ARRAY LONGINT(EW_al_BKFieldType;0)
	//ARRAY LONGINT(EW_al_DBFieldNumbers;0)
	//ARRAY LONGINT(EW_al_ExportFieldNumbers;0)
	//ARRAY LONGINT(EW_al_ManyTableNumbers;0)
	//ARRAY TEXT(EW_at_aScriptNames;0)
	//ARRAY TEXT(EW_at_BKDescription;0)
	//ARRAY TEXT(EW_at_BKFieldNames;0)
	//ARRAY TEXT(EW_at_BKType;0)
	//ARRAY TEXT(EW_at_CharacterConversion;0)
	//ARRAY TEXT(EW_at_DBFieldNames;0)
	//ARRAY TEXT(EW_at_ExportActions;0)
	//ARRAY TEXT(EW_at_ExportFields;0)
	//ARRAY TEXT(EW_at_ExportFormats;0)
	//ARRAY TEXT(EW_at_OneTableFieldNumber;0)
	//ARRAY TEXT(EW_at_OtherDataTypes;0)
	//ARRAY TEXT(EW_at_OutputLabels;0)
	//ARRAY TEXT(EW_at_Personnel;0)
	//ARRAY TEXT(EW_at_RecordDelimitOptions;0)
	//ARRAY TEXT(EW_at_ScriptDataExportCodes;0)
	//ARRAY TEXT(EW_at_ScriptDataExportNames;0)
	//ARRAY TEXT(EW_at_ScriptQueryCodes;0)
	//ARRAY TEXT(EW_at_TimePeriods;0)
	//ARRAY TEXT(EW_at_WhatData;0)
	C_BOOLEAN:C305(<>RunLoadCode; $_bo_AutoMany; $_bo_AutoOne; $_bo_Invisible)
	C_LONGINT:C283($_l_ArraySize; $_l_ChoiceField; $_l_FilledCount; $_l_Index; $_l_Index2; $_l_OneField; $_l_OneTable; $_l_ScriptClassID; $_l_ScriptClassID2; $_l_TableCount; $destruct)
	C_TEXT:C284($_t_LoadType; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_ArraysSetup")
// EW_ArraysSetup
// Creates the arrays that are used in the Export Wizard
// 28/06/02 pb
// Parameters: $1 = "all" or specific arrays

$_t_LoadType:=$1

//If (Records in table([EW_BK_FieldMap])=0)
// EW_BKFieldMapCreate
//End if

If ($_t_LoadType="all")
	EW_TableArrays
	// create arrays of tables & fields that have a one-many relationship
	ARRAY LONGINT:C221(EW_al_ManyTableNumbers; 350)
	ARRAY TEXT:C222(EW_at_OneTableFieldNumber; 350)
	$_l_TableCount:=Get last table number:C254
	$_l_FilledCount:=0
	For ($_l_Index; 1; $_l_TableCount)
		If (Is table number valid:C999($_l_Index))
			GET TABLE PROPERTIES:C687($_l_Index; $_bo_Invisible)
			If ($_bo_Invisible=False:C215)
				For ($_l_Index2; 1; Get last field number:C255($_l_Index))
					If (Is field number valid:C1000($_l_Index; $_l_Index2))
						GET RELATION PROPERTIES:C686($_l_Index; $_l_Index2; $_l_OneTable; $_l_OneField; $_l_ChoiceField; $_bo_AutoOne; $_bo_AutoMany)
						//      If ($_bo_Invisible=False)
						Case of 
							: ($_l_OneTable>0)  // related one to many
								$_l_FilledCount:=$_l_FilledCount+1
								EW_al_ManyTableNumbers{$_l_FilledCount}:=$_l_Index
								EW_at_OneTableFieldNumber{$_l_FilledCount}:=String:C10($_l_OneTable)+" "+String:C10($_l_OneField)
								//           ALERT(EW_at_OneTableFieldNumber{$_l_FilledCount})
								If (False:C215)
									EW_at_OneTableFieldNumber{$_l_FilledCount}:=String:C10($_l_OneTable)+" "+String:C10($_l_Index2)  // one table number + many field number
								End if 
								$_l_ArraySize:=Size of array:C274(EW_al_ManyTableNumbers)
								If ($_l_FilledCount=$_l_ArraySize)
									INSERT IN ARRAY:C227(EW_al_ManyTableNumbers; $_l_ArraySize+1; 100)
									INSERT IN ARRAY:C227(EW_at_OneTableFieldNumber; $_l_ArraySize+1; 100)
								End if 
								//         End if
						End case 
					End if 
				End for   // count fields
			End if   // invisible
		End if 
	End for 
	ARRAY LONGINT:C221(EW_al_ManyTableNumbers; $_l_FilledCount)
	//  ARRAY LONGINT(alOneFieldNumber;$_l_FilledCount)
	ARRAY TEXT:C222(EW_at_OneTableFieldNumber; $_l_FilledCount)
	//  ARRAY LONGINT(alManyFieldNumber;$_l_FilledCount)
	//ALERT("Size of array EW_at_OneTableFieldNumber = "+String($_l_FilledCount))
	
	//  hFieldList:=New list
	ARRAY TEXT:C222(EW_at_DBFieldNames; 0)
	ARRAY LONGINT:C221(EW_al_DBFieldNumbers; 0)
	
	ARRAY TEXT:C222(EW_at_ExportFormats; 4)
	EW_at_ExportFormats{1}:="Daybook Ecommerce"
	EW_at_ExportFormats{2}:="Daybook Publisher"
	EW_at_ExportFormats{3}:="Comma-Delimited Text File"
	EW_at_ExportFormats{4}:="Tab-Delimited Text File"
	
	ARRAY TEXT:C222(EW_at_WhatData; 5)
	EW_at_WhatData{1}:="All records in table"
	EW_at_WhatData{2}:="Current selection"
	EW_at_WhatData{3}:="Select by Macro"
	EW_at_WhatData{4}:="Saved Set"
	EW_at_WhatData{5}:="Modified since last export"
	
	ARRAY TEXT:C222(EW_at_TimePeriods; 4)
	EW_at_TimePeriods{1}:="Hours"
	EW_at_TimePeriods{2}:="Days"
	EW_at_TimePeriods{3}:="Weeks"
	EW_at_TimePeriods{4}:="Months"
	EW_at_TimePeriods:=1
	
	ARRAY TEXT:C222(EW_at_CharacterConversion; 3)
	EW_at_CharacterConversion{1}:="None"
	EW_at_CharacterConversion{2}:="Mac to Windows"
	EW_at_CharacterConversion{3}:="Windows to Mac"
	
	ARRAY TEXT:C222(EW_at_ScriptQueryCodes; 0)
	ARRAY TEXT:C222(EW_at_ScriptDataExportCodes; 0)
	ARRAY TEXT:C222(EW_at_aScriptNames; 0)
	ARRAY TEXT:C222(EW_at_ScriptDataExportNames; 0)
	<>RunLoadCode:=False:C215
	$_l_ScriptClassID:=Data Export Query Macro
	$_l_ScriptClassID2:=Data Export Data Macro
	QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Class:11=$_l_ScriptClassID)  // Macros used for querying the base table
	SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Name:2; EW_at_aScriptNames; [SCRIPTS:80]Script_Code:1; EW_at_ScriptQueryCodes)
	SORT ARRAY:C229(EW_at_aScriptNames; EW_at_ScriptQueryCodes)
	QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Class:11=$_l_ScriptClassID2)  // Macros for exporting data
	SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Name:2; EW_at_ScriptDataExportNames; [SCRIPTS:80]Script_Code:1; EW_at_ScriptDataExportCodes)
	SORT ARRAY:C229(EW_at_ScriptDataExportNames; EW_at_ScriptDataExportCodes)
	<>RunLoadCode:=True:C214
	
	ARRAY TEXT:C222(EW_at_RecordDelimitOptions; 3)
	EW_at_RecordDelimitOptions{1}:="Return (ASCII 13)"
	EW_at_RecordDelimitOptions{2}:="Pipe |"
	EW_at_RecordDelimitOptions{3}:="New Line (ASCII 10)"
	
	ARRAY TEXT:C222(EW_at_OtherDataTypes; 3)
	EW_at_OtherDataTypes{1}:="Calculation"
	EW_at_OtherDataTypes{2}:="Static Text"
	EW_at_OtherDataTypes{3}:="Macro"
	
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Startup_List:15=True:C214; *)
	QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38=0)
	SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; EW_at_Personnel)
	SORT ARRAY:C229(EW_at_Personnel)
	
	ARRAY TEXT:C222(EW_at_BKFieldNames; 0)
	ARRAY TEXT:C222(EW_at_BKDescription; 0)
	ARRAY LONGINT:C221(EW_al_BKFieldType; 0)
	ARRAY LONGINT:C221(EW_al_BKFieldLength; 0)
	ARRAY TEXT:C222(EW_at_BKType; 0)
	
End if 

If (($_t_LoadType="all") | ($_t_LoadType="details"))
	ARRAY TEXT:C222(EW_at_ExportFields; 0)
	ARRAY LONGINT:C221(EW_al_ExportFieldNumbers; 0)
	ARRAY TEXT:C222(EW_at_ExportActions; 0)
	ARRAY INTEGER:C220(EW_ai_StepDetailOrder; 0)
	ARRAY TEXT:C222(EW_at_OutputLabels; 0)
End if 
ERR_MethodTrackerReturn("EW_ArraysSetup"; $_t_oldMethodName)