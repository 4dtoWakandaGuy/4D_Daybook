If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.oExportReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/01/2012 10:49
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
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_QR_EDITOR/oExportReport"; Form event code:C388)

DB_REP_ExportReport
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oExportReport"; $_t_oldMethodName)
