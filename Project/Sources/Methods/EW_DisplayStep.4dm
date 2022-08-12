//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_DisplayStep
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(EW_lb_DataExports;0)
	//ARRAY INTEGER(EW_al_ExportTableNumbers;0)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	//ARRAY TEXT(EW_at_aScriptNames;0)
	//ARRAY TEXT(EW_at_BKExportTable;0)
	//ARRAY TEXT(EW_at_ControlExportTables;0)
	//ARRAY TEXT(EW_at_ExportTableNames;0)
	//ARRAY TEXT(EW_at_ScriptQueryCodes;0)
	//ARRAY TEXT(EW_at_TabControl;0)
	//ARRAY TEXT(EW_at_WhatData;0)
	C_BOOLEAN:C305(EW_bo_ModifiedStep; yNewStep)
	C_LONGINT:C283($_l_index; $_l_RecordNumber; $1)
	C_REAL:C285(iLoc)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_DisplayStep")
// EW_displayStep
// Displays the details for a selected Step
// 22/07/02 pb
// Parameters: $1 = the record number of the Step to display

$_l_RecordNumber:=$1
DB_SaveRecord(->[EW_ExportSteps:118])
QUERY:C277([EW_ExportSteps:118]; [EW_ExportSteps:118]RecordNumber:6=$_l_RecordNumber)
yNewStep:=False:C215
If ([EW_ExportSteps:118]MacroCode:7#"")
	EW_at_aScriptNames:=Find in array:C230(EW_at_ScriptQueryCodes; [EW_ExportSteps:118]MacroCode:7)
End if 
QUERY:C277([EW_ExportTables:120]; [EW_ExportTables:120]ExportStepNumber:1=[EW_ExportSteps:118]RecordNumber:6)
ORDER BY:C49([EW_ExportTables:120]; [EW_ExportTables:120]Order:4)
If ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")
	//  If ([EW_ExportSteps]CatalogueExport)
	//   QUERY([EW_BK_FieldMap];[EW_BK_FieldMap]DayBookTableNumber=Table(->[PRODUCTS])
	// Else
	//   QUERY([EW_BK_FieldMap];[EW_BK_FieldMap]DayBookTableNumber=[EW_ExportSteps]Bas
	// End if
	//  QUERY([EW_BK_FieldMap]; & ;[EW_BK_FieldMap]BKFieldName)#"";*)
	DM_at_BKModelNames:=Find in array:C230(DM_at_BKModelNames; [EW_ExportSteps:118]BKModelName:8)
	QUERY:C277([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]x_MapSetID:7=DM_al_BKModelIDS{DM_at_BKModelNames}; *)
	QUERY:C277([EW_BK_FieldMap:121];  & ; [EW_BK_FieldMap:121]BKFieldName:3#"")
	
End if 
QUERY:C277([EW_StepActions:119]; [EW_StepActions:119]StepTableRecordNumber:1=[EW_ExportTables:120]RecordNumber:2)  // 1/11/02 pb
EW_DisplayDetails
ARRAY TEXT:C222(EW_at_ControlExportTables; Records in selection:C76([EW_ExportTables:120]))
//ORDER BY([EW_ExportTables]Order)
For ($_l_index; 1; Records in selection:C76([EW_ExportTables:120]))
	Case of 
		: ([EW_ExportTables:120]SubFieldNumber:7>0)
			EW_at_ControlExportTables{$_l_index}:=Field name:C257([EW_ExportTables:120]TableNumber:3; [EW_ExportTables:120]SubFieldNumber:7)
		: ([EW_ExportSteps:118]CatalogueExport:9) & ([EW_ExportTables:120]TableNumber:3=Table:C252(->[PRODUCTS:9]))  // 01/03/03 pb
			EW_at_ControlExportTables{$_l_index}:="Catalogue"
		Else 
			EW_at_ControlExportTables{$_l_index}:=Table name:C256([EW_ExportTables:120]TableNumber:3)
	End case 
	NEXT RECORD:C51([EW_ExportTables:120])
End for 
FIRST RECORD:C50([EW_ExportTables:120])
EW_at_ControlExportTables:=1
//AL_SetLine (eALDataExports;iLoc)
LB_SetLine(->EW_lb_DataExports; iLoc)
EW_at_WhatData:=Find in array:C230(EW_at_WhatData; [EW_ExportSteps:118]WhatDataToExport:4)
EW_HideShowObjects
EW_bo_ModifiedStep:=False:C215
EW_at_TabControl:=2
If ([EW_ExportSteps:118]CatalogueExport:9=True:C214)
	EW_at_ExportTableNames:=Find in array:C230(EW_al_ExportTableNumbers; Table:C252(->[CATALOGUE:108]))
Else 
	EW_at_ExportTableNames:=Find in array:C230(EW_al_ExportTableNumbers; [EW_ExportSteps:118]BaseTablenumber:3)
End if 
If ([EW_ExportSteps:118]BKModelName:8="items")
	EW_at_BKExportTable:=1
Else 
	EW_at_BKExportTable:=2
End if 

FORM GOTO PAGE:C247(2)
ERR_MethodTrackerReturn("EW_DisplayStep"; $_t_oldMethodName)