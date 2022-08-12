If (False:C215)
	//object Name: Object Name:      SCRIPT_FORM.oButtonAdd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2012 16:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SCRPT_at_TableNames;0)
	C_LONGINT:C283(DB_l_CURRENTDISPLAYEDFORM; SCC_l_ParentOLD; SCPT_l_EditScriptProcess; SCPT_l_ExecutionState)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ SCRIPT_FORM.oButtonAdd"; Form event code:C388)
If (SCPT_l_ExecutionState>=0)
	SCC_l_ParentOLD:=DB_l_CURRENTDISPLAYEDFORM
	If (SCPT_l_EditScriptProcess=0)
		SCPT_l_ExecutionState:=-1
		HIDE PROCESS:C324(Current process:C322)
		SCPT_l_EditScriptProcess:=ZRecord_EditLst(Current process:C322; ""; SCRPT_at_TableNames{SCRPT_at_TableNames})
	End if 
End if 
ERR_MethodTrackerReturn("OBJ SCRIPT_FORM.oButtonAdd"; $_t_oldMethodName)
