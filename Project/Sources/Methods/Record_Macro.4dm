//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_Macro
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2009 09:32`Method: Record_Macro
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_StopMacros)
	C_LONGINT:C283(<>SCPT_l_currentScriptProcess; <>SCPT_l_PlayerActive; <>SYS_l_CancelProcess; $_l_ProcessState; $_l_ProcessTime; $2; SCPT_l_CallBackProcess; SCPT_l_Cancel)
	C_TEXT:C284(<>RECTEXT; $_t_oldMethodName; $_t_ProcessName; $_t_ScriptCode; $_t_ScriptText; $_t_Text; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_Macro")
READ ONLY:C145([SCRIPTS:80])
PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)

If (Count parameters:C259>=1)
	QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$1)
Else 
	If ($_t_ProcessName="Play @")
		$_t_ScriptCode:=Substring:C12($_t_ProcessName; 6)
	Else 
		$_t_ScriptCode:=$_t_ProcessName
	End if 
	QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ScriptCode)
End if 
Start_ProcCount
SCPT_l_CallBackProcess:=0
If (Count parameters:C259>=2)
	SCPT_l_CallBackProcess:=$2
End if 
If (SCPT_l_CallBackProcess>0)
	//This process was initiated from a palette..open a mini control..actually this should not happen
	//because the palette calls through a differnt menthod
End if 

If (Records in selection:C76([SCRIPTS:80])>0)
	If ([SCRIPTS:80]Script_status:13#Disabled)
		<>SYS_l_CancelProcess:=0
		SCPT_l_Cancel:=0
		<>SYS_bo_StopMacros:=False:C215
		$_t_ScriptText:=[SCRIPTS:80]Recording_Text:4
		$_t_ScriptText:=Replace string:C233($_t_ScriptText; "$"; "SCPT_")
		Record_Play(1; $_t_ScriptText; False:C215; [SCRIPTS:80]Script_Code:1)
	End if 
	
Else 
	//Gen_Alert ("Macro "+$_t_ProcessName+" not found";"")
End if 
ERR_MethodTrackerReturn("Record_Macro"; $_t_oldMethodName)
