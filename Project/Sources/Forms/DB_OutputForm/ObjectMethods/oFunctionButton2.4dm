If (False:C215)
	//object Method Name: Object Name:      DB_OutputForm.oFunctionButton2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/10/2013 17:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_SubWindowsOpen)
	C_TEXT:C284($_t_oldMethodName; DB_t_Function2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oFunctionButton2"; Form event code:C388)
DB_bo_SubWindowsOpen:=True:C214
If (DB_t_Function2#"")
	EXECUTE FORMULA:C63(DB_t_Function2)
End if 
DB_bo_SubWindowsOpen:=False:C215
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oFunctionButton2"; $_t_oldMethodName)
