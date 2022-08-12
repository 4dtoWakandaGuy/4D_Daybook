If (False:C215)
	//object Name: [EW_ExportProjects]Entry.oButtonDelete
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/10/2012 15:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(EW_lb_DataExports;0)
	//ARRAY LONGINT(EW_al_ExportRecordNumbers;0)
	//ARRAY TEXT(EW_at_ControlExportTables;0)
	C_LONGINT:C283($_l_Number)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.oButtonDelete"; Form event code:C388)
$_l_Number:=EW_lb_DataExports

If ($_l_Number<1)
	//  ALERT("Please select an Export to delete!")
	Gen_Alert("Please select an Export to delete!")
Else 
	CONFIRM:C162("Delete the selected Export?"; "No"; "Yes")
	If (OK=0)
		EW_DeleteStep(EW_al_ExportRecordNumbers{$_l_Number})
		ARRAY TEXT:C222(EW_at_ControlExportTables; 0)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.oButtonDelete"; $_t_oldMethodName)
