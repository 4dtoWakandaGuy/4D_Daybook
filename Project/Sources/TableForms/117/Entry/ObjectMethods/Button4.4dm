If (False:C215)
	//object Name: [EW_ExportProjects]Entry.Button4
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
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_Index3; $_l_OldRecordNumber; $_l_OldTableRecordNumber)
	C_TEXT:C284($_t_NewProjectName; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.Button4"; Form event code:C388)
If (EW_Validate)
	$_t_NewProjectName:="'"
	$_t_NewProjectName:=Request:C163("Name for the duplicated project:")
	If ((OK=1) & ($_t_NewProjectName#""))
		DB_SaveRecord(->[EW_ExportProjects:117])
		DB_SaveRecord(->[EW_ExportSteps:118])
		DB_SaveRecord(->[EW_ExportTables:120])
		EW_SaveSteps
		$_l_OldRecordNumber:=[EW_ExportProjects:117]RecordNumber:2
		DUPLICATE RECORD:C225([EW_ExportProjects:117])
		[EW_ExportProjects:117]RecordNumber:2:=Gen_RecordNumber(Table:C252(->[EW_ExportProjects:117]); ->[EW_ExportProjects:117]RecordNumber:2)
		
		[EW_ExportProjects:117]ProjectName:1:=$_t_NewProjectName
		DB_SaveRecord(->[EW_ExportProjects:117])
		QUERY:C277([EW_ExportSteps:118]; [EW_ExportSteps:118]ProjectNumber:1=$_l_OldRecordNumber)
		CREATE SET:C116([EW_ExportSteps:118]; "use")
		For ($_l_Index; 1; Records in selection:C76([EW_ExportSteps:118]))
			$_l_OldRecordNumber:=[EW_ExportSteps:118]RecordNumber:6
			DUPLICATE RECORD:C225([EW_ExportSteps:118])
			[EW_ExportSteps:118]ProjectNumber:1:=[EW_ExportProjects:117]RecordNumber:2
			[EW_ExportSteps:118]RecordNumber:6:=Gen_RecordNumber(Table:C252(->[EW_ExportSteps:118]))
			DB_SaveRecord(->[EW_ExportSteps:118])
			QUERY:C277([EW_ExportTables:120]; [EW_ExportTables:120]ExportStepNumber:1=$_l_OldRecordNumber)
			CREATE SET:C116([EW_ExportTables:120]; "use2")
			For ($_l_Index2; 1; Records in selection:C76([EW_ExportTables:120]))
				$_l_OldTableRecordNumber:=[EW_ExportTables:120]RecordNumber:2
				DUPLICATE RECORD:C225([EW_ExportTables:120])
				[EW_ExportTables:120]ExportStepNumber:1:=[EW_ExportSteps:118]RecordNumber:6
				[EW_ExportTables:120]RecordNumber:2:=Gen_RecordNumber(Table:C252(->[EW_ExportTables:120]))
				DB_SaveRecord(->[EW_ExportTables:120])
				QUERY:C277([EW_StepActions:119]; [EW_StepActions:119]StepTableRecordNumber:1=$_l_OldTableRecordNumber)
				CREATE SET:C116([EW_StepActions:119]; "use3")
				For ($_l_Index3; 1; Records in selection:C76([EW_StepActions:119]))
					DUPLICATE RECORD:C225([EW_StepActions:119])
					[EW_StepActions:119]StepTableRecordNumber:1:=[EW_ExportTables:120]RecordNumber:2
					[EW_StepActions:119]RecordNumber:2:=Gen_RecordNumber(Table:C252(->[EW_StepActions:119]))
					DB_SaveRecord(->[EW_StepActions:119])
					USE SET:C118("use3")
					GOTO SELECTED RECORD:C245([EW_StepActions:119]; $_l_Index3)
					NEXT RECORD:C51([EW_StepActions:119])
				End for 
				USE SET:C118("use2")
				GOTO SELECTED RECORD:C245([EW_ExportTables:120]; $_l_Index2)
				NEXT RECORD:C51([EW_ExportTables:120])
			End for 
			USE SET:C118("use")
			GOTO SELECTED RECORD:C245([EW_ExportSteps:118]; $_l_Index)
			NEXT RECORD:C51([EW_ExportSteps:118])
		End for 
		FORM GOTO PAGE:C247(1)
		EW_EntryBefore
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.Button4"; $_t_oldMethodName)
