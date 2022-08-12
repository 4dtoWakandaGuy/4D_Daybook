If (False:C215)
	//object Method Name: Object Name:      [COMPONENTS].EDIT_COMPONENT.oScript
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2011 08:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(PRD_l_ScriptEdit)
	C_TEXT:C284($_t_oldMethodName; $_t_ScriptCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPONENTS].EDIT_COMPONENT.oScript"; Form event code:C388)
$_t_ScriptCode:=[COMPONENTS:86]Build_Code_Macro:14
PRD_l_ScriptEdit:=New process:C317("Record_EditLst"; DB_ProcessMemoryinit(2); $_t_ScriptCode; [COMPONENTS:86]Build_Code_Macro:14)
If (PRD_l_ScriptEdit>0)
	Process_StartAr(PRD_l_ScriptEdit; "Edit Macro")
End if 
ERR_MethodTrackerReturn("OBJ [COMPONENTS].EDIT_COMPONENT.oScript"; $_t_oldMethodName)
