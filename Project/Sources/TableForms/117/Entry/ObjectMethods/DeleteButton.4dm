If (False:C215)
	//object Name: [EW_ExportProjects]Entry.DeleteButton
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
	//ARRAY TEXT(EW_at_ControlExportTables;0)
	C_LONGINT:C283($_l_index; $_l_Size)
	C_TEXT:C284($_t_Message; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.DeleteButton"; Form event code:C388)
Case of 
	: (Size of array:C274(EW_at_ControlExportTables)=0)
		// this button should be hidden ... but just in case ...
		
	: (Size of array:C274(EW_at_ControlExportTables)=1)
		$_t_Message:="To delete this export, please go to the project tab and "
		$_t_Message:=$_t_Message+"click the Delete button. "+Char:C90(13)
		$_t_Message:=$_t_Message+"To change the export table, simply select a new table"
		$_t_Message:=$_t_Message+" from the pop-up list of table names."
		//   ALERT($_t_Message)
		Gen_Alert($_t_Message)
		
	: (Size of array:C274(EW_at_ControlExportTables)>1) & (EW_at_ControlExportTables=1)
		//    ALERT("Sorry, you cannot delete the export to the Base Table.")
		Gen_Alert("Sorry, you cannot delete the export to the Base Table.")
		
	Else 
		CONFIRM:C162("Are you sure you want to delete the export from the table "+Table name:C256([EW_ExportTables:120]TableNumber:3)+"?"; "No"; "Yes")
		If (OK=0)
			READ WRITE:C146([EW_ExportTables:120])
			$_l_Size:=EW_at_ControlExportTables
			DB_DeletionControl(->[EW_ExportTables:120])
			
			DELETE RECORD:C58([EW_ExportTables:120])
			QUERY:C277([EW_ExportTables:120]; [EW_ExportTables:120]ExportStepNumber:1=[EW_ExportSteps:118]RecordNumber:6)
			ORDER BY:C49([EW_ExportTables:120]; [EW_ExportTables:120]Order:4)
			ARRAY TEXT:C222(EW_at_ControlExportTables; Records in selection:C76([EW_ExportTables:120]))
			For ($_l_index; 1; Records in selection:C76([EW_ExportTables:120]))
				EW_at_ControlExportTables{$_l_index}:=Table name:C256([EW_ExportTables:120]TableNumber:3)
				[EW_ExportTables:120]Order:4:=$_l_index
				SAVE RECORD:C53([EW_ExportTables:120])
				NEXT RECORD:C51([EW_ExportTables:120])
			End for 
			Case of 
				: ($_l_Size<=Records in selection:C76([EW_ExportTables:120]))
					EW_at_ControlExportTables:=$_l_Size
				: ($_l_Size>Records in selection:C76([EW_ExportTables:120]))
					EW_at_ControlExportTables:=Records in selection:C76([EW_ExportTables:120])
			End case 
			QUERY SELECTION:C341([EW_ExportTables:120]; [EW_ExportTables:120]Order:4=EW_at_ControlExportTables)
			EW_DisplayDetails
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.DeleteButton"; $_t_oldMethodName)
