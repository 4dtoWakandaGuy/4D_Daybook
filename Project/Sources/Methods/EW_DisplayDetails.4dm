//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_DisplayDetails
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_DisplayDetails")
//EW_DisplayDetails
// displays the fields, related tables, and details for the selected table
// 01/09/02 pb

//EW_FieldArrays ([EW_ExportSteps]BaseTableNumber;0)
If ([EW_ExportTables:120]SubFieldNumber:7>0)
	EW_FieldArrays([EW_ExportTables:120]TableNumber:3; [EW_ExportTables:120]SubFieldNumber:7)
Else 
	EW_FieldArrays([EW_ExportTables:120]TableNumber:3; 0)
End if 
ORDER BY:C49([EW_ExportTables:120]; [EW_ExportTables:120]Order:4)
FIRST RECORD:C50([EW_ExportTables:120])
//RELATE MANY([EW_ExportTables]RecordNumber)
QUERY:C277([EW_StepActions:119]; [EW_StepActions:119]StepTableRecordNumber:1=[EW_ExportTables:120]RecordNumber:2)
EW_DetailsArrays
ERR_MethodTrackerReturn("EW_DisplayDetails"; $_t_oldMethodName)