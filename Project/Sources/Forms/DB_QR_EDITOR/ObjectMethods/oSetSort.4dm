If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.oSetSort
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/01/2012 12:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_T_CurrentReportCode)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_QR_EDITOR/oSetSort"; Form event code:C388)

If (DB_T_CurrentReportCode#"") | (True:C214)
	
	DB_REP_SetReportSorts
	
	
End if 
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oSetSort"; $_t_oldMethodName)
