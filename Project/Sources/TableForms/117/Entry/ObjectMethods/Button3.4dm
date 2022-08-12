If (False:C215)
	//object Name: [EW_ExportProjects]Entry.Button3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(EW_ai_StepDetailOrder;0)
	//ARRAY TEXT(EW_at_ControlExportTables;0)
	C_BOOLEAN:C305(EW_bo_ModifiedStep)
	C_LONGINT:C283($iSelectedStep)
	C_TEXT:C284($_t_oldMethodName; tErrorMsg)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.Button3"; Form event code:C388)

If (Records in selection:C76([EW_ExportSteps:118])=0)
	QUERY:C277([EW_ExportSteps:118]; [EW_ExportSteps:118]ProjectNumber:1=[EW_ExportProjects:117]RecordNumber:2)
End if 
Case of 
	: (Records in selection:C76([EW_ExportSteps:118])=0)
		//    ALERT("You have not set up any Exports!")
		Gen_Alert("You have not set up any Exports!")
	Else 
		DB_SaveRecord(->[EW_ExportProjects:117])
		DB_SaveRecord(->[EW_ExportSteps:118])
		DB_SaveRecord(->[EW_ExportTables:120])
		ORDER BY:C49([EW_ExportSteps:118]; [EW_ExportSteps:118]Order:2)  // 16/09/03
		If (Size of array:C274(EW_ai_StepDetailOrder)=0)
			EW_DisplayStep([EW_ExportSteps:118]RecordNumber:6)
		End if 
		If (EW_Validate)
			If (EW_bo_ModifiedStep)
				EW_SaveSteps
			End if 
			
			$iSelectedStep:=Selected record number:C246([EW_ExportSteps:118])
			EW_ExportNow([EW_ExportProjects:117]RecordNumber:2; "L")
			If (tErrorMsg="")  // the export was concluded OK
				[EW_ExportProjects:117]LastRunDate:28:=Current date:C33(*)
				[EW_ExportProjects:117]LastRunTime:29:=Current time:C178(*)
				DB_SaveRecord(->[EW_ExportProjects:117])
			End if 
			GOTO SELECTED RECORD:C245([EW_ExportSteps:118]; $iSelectedStep)
			EW_at_ControlExportTables:=1
			QUERY:C277([EW_ExportTables:120]; [EW_ExportTables:120]ExportStepNumber:1=[EW_ExportSteps:118]RecordNumber:6; *)
			QUERY:C277([EW_ExportTables:120];  & ; [EW_ExportTables:120]Order:4=1)
			ORDER BY:C49([EW_ExportTables:120]; [EW_ExportTables:120]Order:4)
			EW_DisplayStep([EW_ExportSteps:118]RecordNumber:6)
			//      EW_DisplayDetails
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.Button3"; $_t_oldMethodName)
