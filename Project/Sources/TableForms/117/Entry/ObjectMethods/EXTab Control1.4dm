If (False:C215)
	//object Name: [EW_ExportProjects]Entry.EXTab Control1
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
	C_BOOLEAN:C305($_bo_CanChange)
	C_LONGINT:C283($_l_ArraySize)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.EXTab Control1"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (Self:C308->#[EW_ExportTables:120]Order:4)
			$_bo_CanChange:=True:C214
			If (Size of array:C274(EW_ai_StepDetailOrder)=0)
				CONFIRM:C162("You haven't selected any Details for this table."; "Delete table"; "Add Details")
				If (OK=1)  // delete
					//       SAVE RECORD([EW_ExportSteps])
					DB_DeletionControl(->[EW_ExportTables:120])
					
					DELETE RECORD:C58([EW_ExportTables:120])
					EW_DeleteStep([EW_ExportSteps:118]RecordNumber:6)
					$_l_ArraySize:=Size of array:C274(EW_at_ControlExportTables)-1
					ARRAY TEXT:C222(EW_at_ControlExportTables; $_l_ArraySize)
					QUERY:C277([EW_ExportTables:120]; [EW_ExportTables:120]ExportStepNumber:1=[EW_ExportSteps:118]RecordNumber:6; *)
					QUERY:C277([EW_ExportTables:120];  & ; [EW_ExportTables:120]Order:4=Self:C308->)
					EW_DisplayDetails
				Else 
					$_bo_CanChange:=False:C215
					Self:C308->:=[EW_ExportTables:120]Order:4
				End if 
			End if 
			If ($_bo_CanChange)
				SAVE RECORD:C53([EW_ExportTables:120])
				//      If (EW_bo_ModifiedStep)
				EW_SaveSteps
				//       End if
				QUERY:C277([EW_ExportTables:120]; [EW_ExportTables:120]ExportStepNumber:1=[EW_ExportSteps:118]RecordNumber:6; *)
				QUERY:C277([EW_ExportTables:120];  & ; [EW_ExportTables:120]Order:4=Self:C308->)
				EW_DisplayDetails
			End if 
		End if 
		//  End if
End case 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.EXTab Control1"; $_t_oldMethodName)
