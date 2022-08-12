//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_PlayP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_StopMacros; $_bo_ProcessVisible)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_ProcessState; $_l_ProcessTime; $_l_UniqueProcessID; $_l_UniqueProcessID2; SCPT_l_Cancel; SCPT_l_ExecutionState; SCPT_l_ThisWindowPalette)
	C_TEXT:C284($_t_oldMethodName; $_t_processName; $_t_ScriptText; $1)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Record_PlayP")

Start_ProcCount
//This method is ALWAYS called from the script palette. The script palette CANNOT(it tried to) interacte with this process..But this process could sit on a repeat for ever and never end so you cant
//this will launch its own mini set of buttons..which will be used to control this script.


If (Count parameters:C259>=1)
	$_t_oldMethodName:=ERR_MethodTracker($1)
End if 
If (Count parameters:C259=0)  //RELIES ON INTERPROCESS VAR!
	<>SYS_l_CancelProcess:=0
	SCPT_l_Cancel:=0
	<>SYS_bo_StopMacros:=False:C215
	Record_Play
Else 
	<>SYS_l_CancelProcess:=0
	SCPT_l_Cancel:=0
	<>SYS_bo_StopMacros:=False:C215
	QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$1)
	
	SCPT_l_ThisWindowPalette:=New process:C317("SCPT_minimacros"; 256000; "Controls For Process "+String:C10(Current process:C322); Current process:C322; $1)
	PROCESS PROPERTIES:C336(SCPT_l_ThisWindowPalette; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
	$_t_ScriptText:=Replace string:C233([SCRIPTS:80]Recording_Text:4; "$"; "SCPT_")
	Record_Play(0; $_t_ScriptText; False:C215; [SCRIPTS:80]Script_Code:1)
	If (SCPT_l_ThisWindowPalette>0)
		PROCESS PROPERTIES:C336(SCPT_l_ThisWindowPalette; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID2)
		If ($_l_UniqueProcessID2=$_l_UniqueProcessID) & ($_l_ProcessState>=0)
			SET PROCESS VARIABLE:C370(SCPT_l_ThisWindowPalette; SCPT_l_ExecutionState; 3)
			POST OUTSIDE CALL:C329(SCPT_l_ThisWindowPalette)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Record_PlayP"; $_t_oldMethodName)
