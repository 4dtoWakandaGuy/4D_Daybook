//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_DeleteStep
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
	//ARRAY INTEGER(EW_ai_ExportOrder;0)
	//ARRAY LONGINT(EW_al_DBTableNumbers;0)
	//ARRAY LONGINT(EW_al_ExportRecordNumbers;0)
	//ARRAY TEXT(EW_at_ControlExportTables;0)
	//ARRAY TEXT(EW_at_DBTableNames;0)
	C_LONGINT:C283($_l_Index; $_l_RecordNumber; $_l_RecordNumberPosition; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_DeleteStep")
// EW_DeleteStep
// 18/07/02 pb
// Deletes an Export Step in the Ewport wizard
// Parameters: $1=the Export Step record number to dispose of

$_l_RecordNumber:=$1
QUERY:C277([EW_ExportSteps:118]; [EW_ExportSteps:118]RecordNumber:6=$_l_RecordNumber)
DB_DeletionControl(->[EW_ExportSteps:118])

DELETE RECORD:C58([EW_ExportSteps:118])
$_l_RecordNumberPosition:=Find in array:C230(EW_al_ExportRecordNumbers; $_l_RecordNumber)
DELETE FROM ARRAY:C228(EW_ai_ExportOrder; $_l_RecordNumberPosition)
DELETE FROM ARRAY:C228(EW_at_DBTableNames; $_l_RecordNumberPosition)
DELETE FROM ARRAY:C228(EW_al_ExportRecordNumbers; $_l_RecordNumberPosition)
DELETE FROM ARRAY:C228(EW_al_DBTableNumbers; $_l_RecordNumberPosition)
For ($_l_Index; 1; Size of array:C274(EW_ai_ExportOrder))
	EW_ai_ExportOrder{$_l_Index}:=$_l_Index
End for 
EW_ArraysSetup("details")

// not needed now this has been replaced with a listbox? pb 06/07/06


If (Size of array:C274(EW_ai_ExportOrder)#0)
	If ($_l_RecordNumberPosition-1<Size of array:C274(EW_ai_ExportOrder))
		//AL_SetLine (eALDataExports;$_l_RecordNumberPosition)
		LB_SetLine(->EW_lb_DataExports; $_l_RecordNumberPosition)
	Else 
		//AL_SetLine (eALDataExports;$_l_RecordNumberPosition-1)
		LB_SetLine(->EW_lb_DataExports; $_l_RecordNumberPosition-1)
	End if 
End if 

//EW_at_ControlExportTables
QUERY:C277([EW_ExportTables:120]; [EW_ExportTables:120]ExportStepNumber:1=[EW_ExportSteps:118]RecordNumber:6)
ORDER BY:C49([EW_ExportTables:120]; [EW_ExportTables:120]Order:4)
ARRAY TEXT:C222(EW_at_ControlExportTables; Records in selection:C76([EW_ExportTables:120]))
ERR_MethodTrackerReturn("EW_DeleteStep"; $_t_oldMethodName)