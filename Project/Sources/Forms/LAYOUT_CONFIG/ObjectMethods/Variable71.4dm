If (False:C215)
	//object Name: Object Name:      LAYOUT_CONFIG.Variable71
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/08/2012 11:00
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(LAY_bo_RecordEdited; Lay_bo_SetupEdited)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/LAYOUT_CONFIG/Variable71"; Form event code:C388)

If (Lay_bo_SetupEdited) | (LAY_bo_RecordEdited)
	Gen_Confirm("No Changes made on this form will be saved"; "Continue"; "Stop")
Else 
	OK:=1
End if 
If (OK=1)
	CANCEL:C270
	OK:=0
	Transact_End(False:C215)
	OK:=1
	USE NAMED SELECTION:C332("Whenwecamein")
Else 
	OK:=1
End if 
ERR_MethodTrackerReturn("OBJ LAYOUT_CONFIG.Variable71"; $_t_oldMethodName)
