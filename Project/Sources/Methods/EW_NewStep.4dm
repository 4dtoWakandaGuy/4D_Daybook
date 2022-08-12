//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_NewStep
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
	//ARRAY TEXT(EW_at_ExportTableNames;0)
	//ARRAY LONGINT(EW_al_ExportTableNumbers;0)
	//ARRAY INTEGER(EW_ai_ExportOrder;0)
	//ARRAY LONGINT(EW_al_DBTableNumbers;0)
	//ARRAY LONGINT(EW_al_ExportRecordNumbers;0)
	//ARRAY TEXT(EW_at_ControlExportTables;0)
	//ARRAY TEXT(EW_at_DBTableNames;0)
	//ARRAY TEXT(EW_at_WhatData;0)
	C_BOOLEAN:C305(EW_bo_ModifiedStep; yNewStep)
	C_LONGINT:C283($_l_ArraySize)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_NewStep")
//EW_NewStep
// 05/07/02 pb

If ([EW_ExportProjects:117]ProjectName:1="")
	// ALERT("Please enter a Project Name first.")
	Gen_Alert("Please enter a Project Name first.")
	FORM GOTO PAGE:C247(1)
	GOTO OBJECT:C206([EW_ExportProjects:117]ProjectName:1)
Else 
	REDUCE SELECTION:C351([EW_ExportTables:120]; 0)  // 28/02/03
	ARRAY TEXT:C222(EW_at_ControlExportTables; 0)
	CREATE RECORD:C68([EW_ExportSteps:118])
	[EW_ExportSteps:118]ProjectNumber:1:=[EW_ExportProjects:117]RecordNumber:2
	[EW_ExportSteps:118]RecordNumber:6:=Gen_RecordNumber(Table:C252(->[EW_ExportSteps:118]))
	[EW_ExportSteps:118]Order:2:=Size of array:C274(EW_ai_ExportOrder)+1
	//`[EW_ExportSteps]TableNumber:=EW_al_ExportTableNumbers{1}
	[EW_ExportSteps:118]WhatDataToExport:4:=EW_at_WhatData{1}
	//  If ([EW_ExportProjects]Exportformat="daybook ecommerce")
	//   [EW_ExportSteps]BKModelName:="Items"
	//  EW_at_BKExportTable:=Find in array(EW_at_BKExportTable;"items")
	//  End if
	DB_SaveRecord(->[EW_ExportSteps:118])
	yNewStep:=True:C214
	REDUCE SELECTION:C351([EW_StepActions:119]; 0)
	//  EW_FieldArrays (EW_al_ExportTableNumbers{1})
	//  EW_FieldArrays (0;0)
	//  EW_GetTableDetails (0)
	EW_bo_ModifiedStep:=True:C214
	EW_at_WhatData:=1
	EW_al_ExportTableNumbers:=1
	EW_at_ExportTableNames:=1
	EW_HideShowObjects
	//  EW_GetTableDetails (0)
	$_l_ArraySize:=Size of array:C274(EW_ai_ExportOrder)+1
	INSERT IN ARRAY:C227(EW_ai_ExportOrder; $_l_ArraySize)
	INSERT IN ARRAY:C227(EW_al_DBTableNumbers; $_l_ArraySize)
	INSERT IN ARRAY:C227(EW_al_ExportRecordNumbers; $_l_ArraySize)
	INSERT IN ARRAY:C227(EW_at_DBTableNames; $_l_ArraySize)
	EW_ai_ExportOrder{$_l_ArraySize}:=$_l_ArraySize
	EW_al_DBTableNumbers{$_l_ArraySize}:=EW_al_ExportTableNumbers{1}
	EW_al_ExportRecordNumbers{$_l_ArraySize}:=[EW_ExportSteps:118]RecordNumber:6
	EW_at_DBTableNames{$_l_ArraySize}:=EW_at_ExportTableNames{1}
	EW_at_ExportTableNames:=1  // "select a table"
	//  EW_ArraysSetup ("details")
	EW_DetailsArrays
End if 
ERR_MethodTrackerReturn("EW_NewStep"; $_t_oldMethodName)