//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetNewProcessOption
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  17/05/2010 22:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordsinNewProcess; DB_bo_SetOpeninNewWindow)
	C_OBJECT:C1216($_obj_Save)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetNewProcessOption")

If (DB_bo_RecordsinNewProcess)
	DB_bo_RecordsinNewProcess:=False:C215
Else 
	DB_bo_RecordsinNewProcess:=True:C214
	
End if 
//DB_bo_SetOpeninNewWindow:=DB_bo_RecordsinNewProcess
$_obj_Save:=New object:C1471("SetOpenInNewWindow"; DB_bo_RecordsinNewProcess)
DB_SaveWindowPrefs($_obj_Save)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("DB_SetNewProcessOption"; $_t_oldMethodName)
