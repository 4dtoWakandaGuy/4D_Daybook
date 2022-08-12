//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Record Startup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2009 09:32`Method: Record Startup
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_inStartup; <>SYS_bo_StopMacros)
	C_LONGINT:C283(<>K; <>RecBarUp; <>SCPT_l_currentScriptProcess; <>SCPT_l_PlayerActive; <>SYS_l_CancelProcess; $_l_Retries; $_l_ScriptRunProcess; SCPT_l_Cancel)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>RECTEXT; <>vMacroCode; $_t_oldMethodName; $_t_ScriptCode; $_t_ScriptText; viSearch)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record Startup")
$_t_ScriptCode:=<>vMacroCode
DelayTicks(240)
Start_ProcCount
viSearch:=""
READ ONLY:C145([SCRIPTS:80])
QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Keystroke:3="S@"; *)
QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Person:5=<>PER_t_CurrentUserInitials)
If (Records in selection:C76([SCRIPTS:80])=0)
	QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Keystroke:3="S@"; *)
	QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Person:5="")
End if 
If (Records in selection:C76([SCRIPTS:80])>0)
	If (<>SYS_bo_inStartup)
		PAUSE PROCESS:C319(Current process:C322)
		$_l_Retries:=0
		Repeat 
			$_l_Retries:=$_l_Retries+1
			DelayTicks(6*$_l_Retries)
		Until (Not:C34(<>SYS_bo_inStartup))
	End if 
	ORDER BY:C49([SCRIPTS:80]; [SCRIPTS:80]Keystroke:3; >)
	FIRST RECORD:C50([SCRIPTS:80])
	While (Not:C34(End selection:C36([SCRIPTS:80])))
		<>SCPT_l_currentScriptProcess:=0
		If ([SCRIPTS:80]Background:7)
			//TRACE
			//<>SCPT_l_PlayerActive:=686868
			$_l_ScriptRunProcess:=New process:C317("Record_Macro"; DB_ProcessMemoryinit(1); [SCRIPTS:80]Script_Code:1; [SCRIPTS:80]Script_Code:1)
		Else 
			<>SYS_l_CancelProcess:=0
			SCPT_l_Cancel:=0
			<>SYS_bo_StopMacros:=False:C215
			$_t_ScriptText:=Replace string:C233([SCRIPTS:80]Recording_Text:4; "$"; "SCPT_")
			
			Record_Play(1; $_t_ScriptText; False:C215; [SCRIPTS:80]Script_Code:1)
			
			
		End if 
		NEXT RECORD:C51([SCRIPTS:80])
		If (Not:C34(End selection:C36([SCRIPTS:80])))
			Record_StartDel
		End if 
	End while 
End if 
Process_End
<>vMacroCode:=$_t_ScriptCode
ERR_MethodTrackerReturn("Record Startup"; $_t_oldMethodName)
