If (False:C215)
	//object Name: [EW_ExportProjects]Entry.oDE2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 06:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(EW_lb_StepDetails;0)
	//ARRAY INTEGER(EW_ai_StepDetailOrder;0)
	//ARRAY LONGINT(EW_al_RelatedManyFieldNumber;0)
	//ARRAY LONGINT(EW_al_RelatedOneFieldNumber;0)
	//ARRAY LONGINT(EW_al_RelatedSubFieldNumbers;0)
	//ARRAY LONGINT(EW_al_RelatedTableNumbers;0)
	//ARRAY TEXT(EW_at_ControlExportTables;0)
	//ARRAY TEXT(EW_at_RelatedTableNames;0)
	C_BOOLEAN:C305(EW_bo_ModifiedStep)
	C_LONGINT:C283($_l_event; $_l_ParentTableNum; $_l_SourceColumn; $_l_SourceRow; $_l_TableCount)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.oDE2"; Form event code:C388)
// eALStepDetails


$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Double Clicked:K2:5)  // double-click
		LISTBOX GET CELL POSITION:C971(EW_lb_StepDetails; $_l_SourceColumn; $_l_SourceRow)
		
		
		Case of 
			: (Size of array:C274(EW_ai_StepDetailOrder)=0)
				Gen_Alert("Please select one or more fields to export from the table "+Table name:C256([EW_ExportTables:120]TableNumber:3)+" before you add related data.")
			Else 
				SAVE RECORD:C53([EW_ExportTables:120])
				If (EW_bo_ModifiedStep)
					EW_SaveSteps
				End if 
				$_l_TableCount:=Size of array:C274(EW_at_ControlExportTables)+1
				INSERT IN ARRAY:C227(EW_at_ControlExportTables; $_l_TableCount)
				EW_at_ControlExportTables{$_l_TableCount}:=EW_at_RelatedTableNames{$_l_SourceRow}
				$_l_ParentTableNum:=[EW_ExportTables:120]TableNumber:3
				CREATE RECORD:C68([EW_ExportTables:120])
				[EW_ExportTables:120]ExportStepNumber:1:=[EW_ExportSteps:118]RecordNumber:6
				[EW_ExportTables:120]RecordNumber:2:=AA_GetNextID(->[EW_ExportTables:120]RecordNumber:2)
				[EW_ExportTables:120]TableNumber:3:=EW_al_RelatedTableNumbers{$_l_SourceRow}
				[EW_ExportTables:120]Order:4:=$_l_TableCount
				[EW_ExportTables:120]ParentTableNumber:6:=$_l_ParentTableNum
				[EW_ExportTables:120]FileName:5:=Replace string:C233(EW_at_RelatedTableNames{$_l_SourceRow}; " "; "")+".txt"
				[EW_ExportTables:120]SubFieldNumber:7:=EW_al_RelatedSubFieldNumbers{$_l_SourceRow}
				[EW_ExportTables:120]RelatedOnefieldNumber:8:=EW_al_RelatedOneFieldNumber{$_l_SourceRow}
				//       [EW_ExportTables]RelatedManyfieldNumber:=EW_al_RelatedManyFieldNumber{$Sourc
				[EW_ExportTables:120]RelatedManyfieldNumber:9:=EW_al_RelatedManyFieldNumber{$_l_SourceRow}  // back in 19/11/02
				EW_FieldArrays([EW_ExportTables:120]TableNumber:3; [EW_ExportTables:120]SubFieldNumber:7)
				SAVE RECORD:C53([EW_ExportTables:120])
				REDUCE SELECTION:C351([EW_StepActions:119]; 0)
				EW_DetailsArrays
				EW_bo_ModifiedStep:=True:C214
				EW_at_ControlExportTables:=$_l_TableCount
		End case 
End case 
ERR_MethodTrackerReturn("OBJ:Entry,EW_lb_RelatedData"; $_t_oldMethodName)
